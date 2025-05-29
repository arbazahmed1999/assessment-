import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/screens/screen3_view.dart';

class Screen2Controller extends GetxController {
  final otpError = ''.obs;
  final mobileNumber = ''.obs;
  final timeRemaining = 30.obs;
  Timer? _timer;

  // Four OTP text field controllers
  List<TextEditingController> otpFields = [];

  @override
  void onInit() {
    super.onInit();
    otpFields = List.generate(4, (_) => TextEditingController());
  }

  @override
  void onClose() {
    _timer?.cancel();
    for (var c in otpFields) {
      c.dispose();
    }
    super.onClose();
  }

  void initialize(String number) {
    mobileNumber.value = number;
    otpError.value = '';
    for (var controller in otpFields) {
      controller.clear();
    }
    startCountdown();
  }

  void startCountdown() {
    _timer?.cancel();
    timeRemaining.value = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeRemaining.value > 0) {
        timeRemaining.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void onVerifyPressed() {
    String otp = otpFields.map((c) => c.text).join();
    if (otp.length != 4 || otp.contains(RegExp(r'\D'))) {
      otpError.value = 'Please enter a valid 4-digit OTP';
    } else {
      otpError.value = '';
      Get.back();
      // Get.snackbar('Success', 'OTP Verified Successfully');
      Get.to(() => Screen3View());
    }
  }
}
