import 'package:flutter/material.dart';

import 'package:quiz_app_final/questions_screen.dart';

import 'package:quiz_app_final/start_screen.dart';

import 'package:quiz_app_final/data/questions.dart';

import 'package:quiz_app_final/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  //APPROACH 2/3
  var activeScreen = 'start-screen';

  //APPROACH 1
  // Widget? activeScreen;

  // @override
  // void initState() {
  //  activeScreen = StartScreen(switchScreen);
  //  super.initState();
  //}

  switchScreen() {
    setState(() {
      //APPROACH 1
      //activeScreen = const QuestionsScreen();
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    //APPROACH 3
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 79, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // APPROACH 2
          //child: activeScreen == 'start-screen'
          //? StartScreen(switchScreen)
          //: const QuestionsScreen(),
          // APPROACH 1
          //child: activeScreen,
          //APPROACH 3
          child: screenWidget,
        ),
      ),
    );
  }
}
