import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Adjusts to fit the content size
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(129, 255, 255, 255),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 75.0, bottom: 25.0),
            child: const Text(
              "Learn flutter the fun way.",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              startQuiz();
            },
            icon: Icon(Icons.arrow_right_alt, size: 35),
            label: const Text(
              'Start quiz',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
