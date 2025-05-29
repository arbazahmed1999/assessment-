import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/screen1_controller.dart';
import 'package:flutter/services.dart';

class Screen1View extends GetView<Screen1Controller> {
  const Screen1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Apex University',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white10,
        elevation: 0.5,
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
 
      body: SafeArea(
        child: Column(
          children: [
    
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Virtual Job Fair Registration Form',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ),
                    const SizedBox(height: 32),

                    const Text('Name'),
                    const SizedBox(height: 6),
                    TextField(
                      controller: controller.nameController,
                      keyboardType: TextInputType.name,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z\s]'),
                        ),
                      ],

                      decoration: const InputDecoration(
                        hintText: 'Enter your name',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (_) => controller.nameError.value = '',
                    ),
                    Obx(
                      () =>
                          controller.nameError.value.isNotEmpty
                              ? Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  controller.nameError.value,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 13,
                                  ),
                                ),
                              )
                              : const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 16),

                    const Text('Mobile Number'),
                    const SizedBox(height: 6),
                    TextField(
                      controller: controller.mobileController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        hintText: 'Enter your mobile number',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (_) => controller.mobileError.value = '',
                    ),
                    Obx(
                      () =>
                          controller.mobileError.value.isNotEmpty
                              ? Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  controller.mobileError.value,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 13,
                                  ),
                                ),
                              )
                              : const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 16),

                    const Text('Email Address'),
                    const SizedBox(height: 6),
                    TextField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (_) => controller.emailError.value = '',
                    ),
                    Obx(
                      () =>
                          controller.emailError.value.isNotEmpty
                              ? Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  controller.emailError.value,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 13,
                                  ),
                                ),
                              )
                              : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 24, bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  controller.onGetStartPressed(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Get Started', style: TextStyle(fontSize: 16)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
