import 'package:get/get.dart';

class Screen5Controller extends GetxController {
  final correctAnswers = [0, 1, 2, 0, 3];

  RxString currentQuestionLabel1 = 'Question. 1'.obs;
  RxString currentQuestionLabel2 = 'Question. 2'.obs;
  RxString currentQuestionLabel3 = 'Question. 3'.obs;
  RxString currentQuestionLabel4 = 'Question. 4'.obs;
  RxString currentQuestionLabel5 = 'Question. 5'.obs;
  // Selected answer
  RxInt selectedOptionIndex1 = (-1).obs;
  RxInt selectedOptionIndex2 = (-1).obs;
  RxInt selectedOptionIndex3 = (-1).obs;
  RxInt selectedOptionIndex4 = (-1).obs;
  RxInt selectedOptionIndex5 = (-1).obs;

  List<String> options1 = [
    'Visual Studio',
    'Android Studio',
    'IntelliJ IDEA',
    'All',
  ];
  List<String> options2 = ['Google Ads', 'Reflectly', 'Birch Finance', 'All'];
  List<String> options3 = ['Kotlin', 'Java', 'Dart', 'Swift'];
  List<String> options4 = ['ListView', 'Container', 'Column', 'Row'];
  List<String> options5 = ['runApp()', 'main()', 'initApp()', 'startApp()'];

  /// Calculates results
  Map<String, dynamic> calculateResults() {
    final selectedAnswers = [
      selectedOptionIndex1.value,
      selectedOptionIndex2.value,
      selectedOptionIndex3.value,
      selectedOptionIndex4.value,
      selectedOptionIndex5.value,
    ];

    int correct = 0;
    int skipped = 0;
    for (int i = 0; i < correctAnswers.length; i++) {
      if (selectedAnswers[i] == -1) {
        skipped++;
      } else if (selectedAnswers[i] == correctAnswers[i]) {
        correct++;
      }
    }
    int incorrect = correctAnswers.length - correct - skipped;
    int percentage = ((correct / correctAnswers.length) * 100).round();

    return {
      'correct': correct,
      'skipped': skipped,
      'incorrect': incorrect,
      'completion': '$percentage%',
      'percentage': percentage,
    };
  }
}
