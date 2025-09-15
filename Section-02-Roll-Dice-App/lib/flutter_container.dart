import 'package:flutter/material.dart';
import 'package:second_app/roll_dice.dart';


Alignment startAlignment = Alignment.topLeft;
var stopAlignment = Alignment.bottomRight;

class GradiantContainer extends StatelessWidget {
  const GradiantContainer(this.colors1, {super.key});
  final colors1;
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors1,
          begin: startAlignment,
          end: stopAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
