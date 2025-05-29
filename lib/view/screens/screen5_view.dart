import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/screen5_controller.dart';
import '../../controllers/screen6_controller.dart';
import 'screen6_view.dart';

class Screen5View extends StatelessWidget {
  final Screen5Controller controller = Get.put(Screen5Controller());
  final Screen6Controller screen6Controller = Get.put(Screen6Controller());
  final List<String> labels = ['A.', 'B.', 'C.', 'D.'];

  Screen5View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Flutter App Development',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        elevation: 0.5,
        shadowColor: Colors.grey.shade200,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        infoIconText(Icons.help_outline, '20 Questions'),
                        infoIconText(Icons.access_time, '4:45'),
                        infoIconText(Icons.star_border, '50 Marks'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 1, color: Colors.grey, height: 0),
                  const SizedBox(height: 8),
                  ...buildQuestions(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => const Screen6View(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B82F6),
                minimumSize: const Size.fromHeight(48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildQuestions() {
    final questions = [
      {
        'label': controller.currentQuestionLabel1,
        'question': 'What are the most useful editors for Flutter apps?',
        'options': controller.options1,
        'selected': controller.selectedOptionIndex1,
      },
      {
        'label': controller.currentQuestionLabel2,
        'question': 'Are there any popular apps which make use of flutter?',
        'options': controller.options2,
        'selected': controller.selectedOptionIndex2,
      },
      {
        'label': controller.currentQuestionLabel3,
        'question': 'Which language is used to write Flutter apps?',
        'options': controller.options3,
        'selected': controller.selectedOptionIndex3,
      },
      {
        'label': controller.currentQuestionLabel4,
        'question': 'Which widget is used for layout?',
        'options': controller.options4,
        'selected': controller.selectedOptionIndex4,
      },
      {
        'label': controller.currentQuestionLabel5,
        'question': 'Which method initializes the app?',
        'options': controller.options5,
        'selected': controller.selectedOptionIndex5,
      },
    ];

    return questions.map<Widget>((q) {
      final RxString label = q['label'] as RxString;
      final String question = q['question'] as String;
      final List<String> options = q['options'] as List<String>;
      final RxInt selected = q['selected'] as RxInt;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => buildRibbon(label.value)),
          buildQuestionBox(
            questionText: question,
            options: options,
            selectedIndex: selected,
          ),
        ],
      );
    }).toList();
  }

  Widget infoIconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue, size: 20),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget buildRibbon(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ClipPath(
        clipper: RibbonClipper(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          color: Colors.black,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildQuestionBox({
    required String questionText,
    required List<String> options,
    required RxInt selectedIndex,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 3, offset: Offset(0, 1)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            questionText,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          ...List.generate(options.length, (index) {
            return Obx(() {
              final isSelected = selectedIndex.value == index;
              return GestureDetector(
                onTap: () => selectedIndex.value = index,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFFE8F0FE) : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color:
                          isSelected
                              ? const Color(0xFF3B82F6)
                              : Colors.grey.shade300,
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${labels[index]}  ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Icon(
                        isSelected
                            ? Icons.check_box_rounded
                            : Icons.check_box_outline_blank,
                        size: 18,
                        color:
                            isSelected ? const Color(0xFF3B82F6) : Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          options[index],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
          }),
        ],
      ),
    );
  }
}

class RibbonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double triangleWidth = 15;
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width - triangleWidth, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - triangleWidth, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


