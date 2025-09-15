//import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(20,255,255,255),
          ),
          const SizedBox(height: 10),
          const Text(
            'Learning Flutter the fun way',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            label: const Text(
              'Start',
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: startQuiz,
          )
        ],
      ),
    );
  }
}
