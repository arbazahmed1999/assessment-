import 'package:get/get.dart';
import 'dart:async';

class Screen6Controller extends GetxController {
  RxString selectedTitle = ''.obs;
  RxString selectedIcon = ''.obs;

  void updateAssessmentData(String title, String icon) {
    selectedTitle.value = title;
    selectedIcon.value = icon;
  }

  var remainingSeconds = 60.obs; // 1 minute
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    remainingSeconds.value = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  String get formattedTime {
    final minutes = (remainingSeconds.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingSeconds.value % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
