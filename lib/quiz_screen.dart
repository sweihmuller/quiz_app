import 'package:flutter/material.dart';
import 'package:quiz_app/home_page.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  @override
  State<QuizScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuizScreen> {
  final List<String> selectedAnswers = [];
  //Widget? activeScreen;
  var activeScreen = 'start-screen';

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = HomePage(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswers);
    } else {
      screenWidget = HomePage(switchScreen);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen();
    }
    return MaterialApp(
      home: Scaffold(backgroundColor: Colors.deepPurple, body: screenWidget),
    );
  }
}
