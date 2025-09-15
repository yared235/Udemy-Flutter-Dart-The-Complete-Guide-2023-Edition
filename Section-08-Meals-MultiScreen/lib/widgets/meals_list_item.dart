import 'package:flutter/material.dart';
import 'package:sec8_multiscreen_app/models/meal.dart';
class MealsListItem extends StatelessWidget {
  const MealsListItem({super.key, required this.meals});
  final Meal meals;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(meals.ingredients.toString(), style: const TextStyle(color: Colors.white),),
        const SizedBox(height: 12,),
        Text(meals.steps.toString(),style: const TextStyle(color: Colors.white))
      ],
    ); // Replace with your desired widget.
  }
}