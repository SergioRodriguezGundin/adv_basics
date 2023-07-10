import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/start_quiz.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers =
      []; // we dont have to reasignate memory, we only edit an existing value in memory
  Widget? activeScreen; // set ? to say that variable could be null
  var activeScreenV2 = 'start-screen';

  @override
  void initState() {
    // we use initState to initialize activeScreen
    //activeScreen = StartQuiz(switchScreen);
    activeScreenV2 = 'start-screen';
    super.initState();
  }

  void switchScreen() {
    setState(() {
      //activeScreen = const QuestionsScreen();
      activeScreenV2 = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreenV2 = 'results-screen';
      });
    }
  }

  void resetQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreenV2 = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartQuiz(switchScreen);

    if (activeScreenV2 == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreenV2 == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: resetQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 55, 7, 90),
              Color.fromARGB(255, 85, 40, 164)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          //child: activeScreen,
          child: screenWidget,
        ),
      ),
    );
  }
}
