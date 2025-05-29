import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../controllers/screen5_controller.dart';
import '../../controllers/screen6_controller.dart';
import '../../controllers/screen7_controller.dart';
import 'screen7_view.dart';

class Screen6View extends StatelessWidget {
  const Screen6View({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Screen6Controller>();
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Transform.translate(
        offset: const Offset(0, -120), // move upward by 100 pixels
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      controller.selectedIcon.value,
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      controller.selectedTitle.value,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Icon(Icons.timer_outlined, color: Colors.red, size: 40),
                const SizedBox(height: 4),
                Obx(
                  () => Text(
                    controller.formattedTime,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'You assessment is over',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final screen5Controller = Get.find<Screen5Controller>();
                    final screen7Controller = Get.find<Screen7Controller>();

                    final result = screen5Controller.calculateResults();
                    screen7Controller.setResults(
                      result['correct'],
                      result['incorrect'],
                      result['skipped'],
                      result['completion'],
                      result['percentage'],
                    );

                    Get.back(); // Close dialog
                    Get.to(() => Screen7View());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size.fromHeight(45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Submit Assessments',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
