import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/screens/screen2_view.dart'; // Make sure this import exists and is correct

class Screen1Controller extends GetxController {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();

  var nameError = ''.obs;
  var mobileError = ''.obs;
  var emailError = ''.obs;

  // Validate form fields
  bool validateForm() {
    bool isValid = true;

    final name = nameController.text.trim();
    if (name.isEmpty) { 
      nameError.value = 'Name is required';
      isValid = false;
    } else if (!RegExp(r'^[A-Z][a-zA-Z]*\s[A-Z][a-zA-Z]*$').hasMatch(name)) {
      nameError.value = 'Enter first and last name with capital initials';
      isValid = false;
    } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)) {
      nameError.value = 'Only alphabets allowed';
      isValid = false;
    } else {
      nameError.value = '';
    }

    final mobile = mobileController.text.trim();
    if (mobile.isEmpty) {
      mobileError.value = 'Mobile number is required';
      isValid = false;
    } else if (!RegExp(r'^\d{10}$').hasMatch(mobile)) {
      mobileError.value = 'Enter a valid 10-digit mobile number';
      isValid = false;
    } else {
      mobileError.value = '';
    }

    final email = emailController.text.trim();
    if (email.isEmpty) {
      emailError.value = 'Email is required';
      isValid = false;
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = 'Invalid email address';
      isValid = false;
    } else {
      emailError.value = '';
    }

    return isValid;
  }

  // Function called on Get Start button
  void onGetStartPressed(BuildContext context) {
    if (validateForm()) {
      showOtpPopup(context, mobileController.text.trim());
    }
  }
}
