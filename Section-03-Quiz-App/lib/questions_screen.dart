import 'package:flutter/material.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

var currentQuestionIndex = 0;
var currentQuestion = questions[0];
//var currentQuestion = questions[currentQuestionIndex];

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  //final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex = currentQuestionIndex+1;
    });
  }

  @override
  Widget build(context) {
    currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 133, 104, 179),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ...currentQuestion.shuffledList().map(
                (answer) {
                  return ActionButton(onTap: () {
                    answerQuestion(answer);
                  }, text: answer);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
