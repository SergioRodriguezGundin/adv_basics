import 'package:adv_basics/questions_identifier.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((summary) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionIdentifier(
                  isCorrectAnswer:
                      summary['user_answer'] == summary['correct_answer'],
                  questionIndex: (summary['question_index'] as int) + 1,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 10, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          summary['question'] as String,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(summary['user_answer'] as String,
                            style: TextStyle(
                                color: summary['user_answer'] ==
                                        summary['correct_answer']
                                    ? const Color.fromARGB(123, 7, 199, 224)
                                    : const Color.fromARGB(255, 196, 58, 116),
                                fontSize: 12)),
                        Text(summary['correct_answer'] as String,
                            style: const TextStyle(
                                color: Color.fromARGB(123, 7, 199, 224),
                                fontSize: 12)),
                      ],
                    ),
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
