import 'package:get/get.dart';

class Screen3Controller extends GetxController {
  final selectedSkill = ''.obs;

  final skills =
      <String>[
        'Flutter App Development',
        'Java Development',
        'Javascript',
        'PHP Development',
        'React JS Development',
        'Node JS Development',
        'Angular JS',
        'Python Development',
        'Laravel Development',
      ].obs;

  final Map<String, String> skillIcons = {
    'Flutter App Development': 'assets/screen3_images/icons8-flutter.png',
    'Java Development': 'assets/screen3_images/icons8-java.png',
    'Javascript': 'assets/screen3_images/icons8-javascript.png',
    'PHP Development': 'assets/screen3_images/icons8-php.png',
    'React JS Development': 'assets/screen3_images/react.png',
    'Node JS Development': 'assets/screen3_images/icons8-nodejs.png',
    'Angular JS': 'assets/screen3_images/icons8-angular.png',
    'Python Development': 'assets/screen3_images/icons8-python.png',
    'Laravel Development': 'assets/screen3_images/icons8-laravel.png',
  };

  void selectSkill(String skill) {
    if (selectedSkill.value == skill) {
      selectedSkill.value = '';
    } else {
      selectedSkill.value = skill;
    }
  }

  String? getSelectedSkill() {
    if (selectedSkill.value.isNotEmpty) {
      return selectedSkill.value;
    }
    return null;
  }
}
