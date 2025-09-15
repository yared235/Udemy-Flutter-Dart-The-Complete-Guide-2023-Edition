import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summeryList, {super.key});
  final List<Map<String, Object>> summeryList;
  @override
  Widget build(context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          children: summeryList.map((data) {
            return Row(
              children: [
                Text(
                  ((data['questionIndex'] as int) + 1).toString(),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'] as String),
                      Text(data['correctAnswer'] as String),
                      Text(data['choosenAnswer'] as String),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
