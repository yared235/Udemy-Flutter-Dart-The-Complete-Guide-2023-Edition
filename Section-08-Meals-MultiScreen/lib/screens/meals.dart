import 'package:flutter/material.dart';
import 'package:sec8_multiscreen_app/models/meal.dart';
import 'package:sec8_multiscreen_app/screens/meal_item_details.dart';
import 'package:sec8_multiscreen_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals, required this.favIconOnPress});
  final void Function(Meal favMeal) favIconOnPress;
  final String? title;
  final List<Meal> meals;
  void selectMealItem(BuildContext context, Meal mealItem) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (cxt) => MealItemDetails(mealItem: mealItem, favIconOnPress: favIconOnPress,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('there are no meals',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface)),
            const SizedBox(
              height: 16,
            ),
            Text(
              'try different catagory',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            )
          ],
        ),
      );
    } else {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (cxt, index) {
            return MealItem(
              meal: meals[index],
              selectMealItem: (meal) {
                selectMealItem(context, meal);
              },
            );
          });
    }
    if (title == null) {
      return content;
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content,
      ); // Replace with your desired widget.
    }
  }
}
