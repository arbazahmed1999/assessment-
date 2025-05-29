import 'package:get/get.dart';

class Screen4Controller extends GetxController {
  final skillName = ''.obs;
  final iconPath = ''.obs;
  final imagePath = 'assets/screen4_images/assessments_detail.png';
  final assessmentStats =
      <String>['20 Questions', '50 Marks', '10 Minutes'].obs;
  final quoteLine1 =
      '*Personally passionate and up to date with current trends and'.obs;
  final quoteLine2 =
      'technologies, committed to quality and comfortable working'.obs;

  void initialize(String skill, String icon) {
    skillName.value = skill;
    iconPath.value = icon;
  }
}
