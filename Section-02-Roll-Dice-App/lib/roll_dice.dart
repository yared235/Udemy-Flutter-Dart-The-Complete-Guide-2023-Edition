import 'dart:math';

import 'package:flutter/material.dart';
import 'package:second_app/styled_text.dart';
final randomizer=Random();
class DiceRoller extends StatefulWidget {
const DiceRoller({super.key});
  @override
  State<DiceRoller> createState(){
    return _stateDiceRoller();
  }
}
class _stateDiceRoller extends State<DiceRoller> {
  @override
  //var currentRollN=2;
  
  var nextRoll=2;
  var activeDiceImage=2;//'assets/images/dice-$currentRollN.png';
  void rollDice() {
    nextRoll= randomizer.nextInt(6) + 1;
    setState((){
      activeDiceImage=nextRoll;
      });
  }
  @override
  Widget build(context){
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/dice-$activeDiceImage.png',
              width: 200,
            ),
            TextButton( 
              onPressed: rollDice,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(top: 10),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 28),
              ),
              child: const StyledText("Roll Dice"),
            )
          ],
        );
  }
}