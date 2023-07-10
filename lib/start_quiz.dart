import 'package:flutter/material.dart';

class StartQuiz extends StatelessWidget {
  @override
  const StartQuiz(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 260,
            color: const Color.fromARGB(94, 255, 255, 255),
          ),
          const SizedBox(height: 40),
          const Text('Learn Flutter the fun way',
              style: TextStyle(color: Colors.white, fontSize: 24)),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz, // a pointer of anonimous function
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text('Start Quiz'),
            icon: const Icon(Icons.arrow_right_alt),
          )
        ],
      ),
    );
  }
}
