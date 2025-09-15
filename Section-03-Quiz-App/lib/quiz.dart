import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/starting_screen.dart';
import 'package:adv_basics/data/questions.dart';
var activeScreen='start_screen';
Widget? screenWidget;
class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}
class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers1 = [];
  //@override
  // void initState() {
  //   activeScreen= StartScreen(screenState);
  //   super.initState();
  // }
  void screenState(){
  setState((){
    activeScreen='question_string';
  });
}
void chooseAnswer(String answer) {
  selectedAnswers1.add(answer);
  if(selectedAnswers1.length== questions.length) {
    setState(() {
      activeScreen='result_screen';
    });
  }
}
void restartQuiz() {
  setState(() {
    activeScreen= 'start_screen';
  });
}
  @override
  Widget build(context){
    screenWidget = StartScreen(screenState);
    if (activeScreen == 'question_string') {
      screenWidget= QuestionsScreen(onSelectAnswer: chooseAnswer );
    }else if(activeScreen == 'result_screen') {
      screenWidget = ResultScreen(restartQuiz, selectedAnswers: selectedAnswers1);
    }
    
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 49, 12, 182), Color.fromARGB(255, 75, 9, 197)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class Quiz extends StatelessWidget {
//   const Quiz({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Text('jadix');
//   }
// }