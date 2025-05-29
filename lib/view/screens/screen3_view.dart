import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assessment/controllers/screen3_controller.dart';
import 'package:assessment/controllers/screen6_controller.dart';
import 'screen4_view.dart';

class Screen3View extends StatelessWidget {
  final controller = Get.put(Screen3Controller());

  Screen3View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Assessments',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.5,
        shadowColor: Colors.grey.shade200,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Obx(
        () =>
            controller.skills.isEmpty
                ? const Center(child: Text('No skills available'))
                : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.skills.length,
                  itemBuilder: (context, index) {
                    final skill = controller.skills[index];
                    return GestureDetector(
                      onTap: () => controller.selectSkill(skill),
                      child: Obx(() {
                        final isSelected =
                            controller.selectedSkill.value == skill;

                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.blue : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color:
                                  isSelected
                                      ? Colors.blue
                                      : Colors.grey.shade300,
                            ),
                          ),
                          child: Row(
                            children: [
                              isSelected
                                  ? Container(
                                    width: 40,
                                    height: 40,
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Image.asset(
                                      controller.skillIcons[skill]!,
                                      fit: BoxFit.contain,
                                    ),
                                  )
                                  : Image.asset(
                                    controller.skillIcons[skill]!,
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.contain,
                                  ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  skill,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color:
                                        isSelected
                                            ? Colors.white
                                            : Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              if (isSelected)
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                  size: 20,
                                ),
                            ],
                          ),
                        );
                      }),
                    );
                  },
                ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
          ),
          onPressed: () {
            final selectedSkill = controller.getSelectedSkill();
            if (selectedSkill != null) {
              if (!Get.isRegistered<Screen6Controller>()) {
                Get.put(
                  Screen6Controller(),
                ); // Register controller before using
              }
              Get.find<Screen6Controller>().updateAssessmentData(
                selectedSkill,
                controller.skillIcons[selectedSkill]!,
              );
              Get.to(
                () => Screen4View(
                  skill: selectedSkill,
                  icon: controller.skillIcons[selectedSkill]!,
                ),
              );
            } else {
              Get.snackbar(
                'Select Skill',
                'Please select a skill before proceeding.',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.redAccent,
                colorText: Colors.white,
              );
            }
          },
          child: const Text('Proceed'),
        ),
      ),
    );
  }
}
