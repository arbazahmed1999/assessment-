import 'package:get/get.dart';

class Screen7Controller extends GetxController {
  var correct = 0.obs;
  var incorrect = 0.obs;
  var skipped = 0.obs;
  var completion = ''.obs;
  var percentage = 0.obs;

  void setResults(
    int correctCount,
    int incorrectCount,
    int skippedCount,
    String completionText,
    int percent,
  ) {
    correct.value = correctCount;
    incorrect.value = incorrectCount;
    skipped.value = skippedCount;
    completion.value = completionText;
    percentage.value = percent;
  }
}
