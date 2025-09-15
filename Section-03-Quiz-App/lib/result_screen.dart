import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';
var j=0;
class ResultScreen extends StatelessWidget {
  const ResultScreen(this.restartQuiz,
      {super.key, required this.selectedAnswers});
  final List<String> selectedAnswers;
  final void Function() restartQuiz;
  
  List<Map<String, Object>> get SummaryData {
    final List<Map<String, Object>> summery = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summery.add(
        {
          'questionIndex': i,
          'question': questions[i].text,
          'correctAnswer': questions[i].answers[0],
          'choosenAnswer': selectedAnswers[i]
        },
      );
    }
    return summery;
  }
  

  @override
  Widget build(BuildContext context) {
    
    for(var i=0; i< selectedAnswers.length; i++){
    if(selectedAnswers[i]== questions[i].answers[0]) {
      j++;
    }
  }
  final String output='You have got $j out of ${questions.length} questions';
  
    return SizedBox(
      width: double.infinity,

      child: Center(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(output),
              QuestionsSummary(SummaryData),
              TextButton(
                onPressed: restartQuiz,
                child: const Text('restart quiz'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
