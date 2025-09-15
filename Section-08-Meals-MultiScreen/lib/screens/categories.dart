import 'package:flutter/material.dart';
import 'package:sec8_multiscreen_app/models/meal.dart';
import 'package:sec8_multiscreen_app/screens/meals.dart';
import 'package:sec8_multiscreen_app/widgets/category_grid_item.dart';
import 'package:sec8_multiscreen_app/data/dummy_data.dart';
import 'package:sec8_multiscreen_app/models/category.dart';

class CatagoriesScreen extends StatelessWidget {
  const CatagoriesScreen({super.key,required this.favIconOnPress, required this.availableMeals});
  final List<Meal> availableMeals;
  final void Function(Meal favMeal) favIconOnPress;
  void selectCatagory(BuildContext context, Category catagory) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(catagory.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (cxt) =>
            MealsScreen(title: catagory.title, meals: filteredMeals,favIconOnPress: favIconOnPress),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            selectCatagory: () {
              selectCatagory(context, category);
            },
          )
      ],
    ); // Replace with your desired widget.
  }
}
