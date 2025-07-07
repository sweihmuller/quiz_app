import 'package:flutter/material.dart';
import 'package:quiz_app/home_page.dart';
import 'package:quiz_app/questions_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuizScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuizScreen> {
  final List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = HomePage(switchScreen);
    super.initState();
  }

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswers);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(backgroundColor: Colors.deepPurple, body: activeScreen),
    );
  }
}
