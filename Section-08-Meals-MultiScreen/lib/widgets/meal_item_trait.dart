import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.lable, required this.icon});
  final IconData icon; //possible error  due to class ambguity
  final String lable;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          lable,
          style: const TextStyle(color: Colors.white),
        )
      ],
    ); // Replace with your desired widget.
  }
}
