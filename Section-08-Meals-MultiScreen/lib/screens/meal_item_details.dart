import 'package:flutter/material.dart';
import 'package:sec8_multiscreen_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItemDetails extends StatelessWidget {
  const MealItemDetails({super.key, required this.mealItem, required this.favIconOnPress});
  final void Function(Meal mealItem) favIconOnPress;
  final Meal mealItem;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(mealItem.title),
          actions: [
            IconButton(onPressed: (){favIconOnPress(mealItem);}, icon: const Icon(Icons.star))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FadeInImage(
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(mealItem.imageUrl),
              ),
              const SizedBox(
                height: 15,
              ),
              Text('Ingredients',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary)),
              for (final ingredient in mealItem.ingredients)
                Text(ingredient,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
              const SizedBox(
                height: 15,
              ),
              Text('Steps',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary)),
              for (final step in mealItem.steps)
                Text(step,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface))
            ],
          ),
        )); // Replace with your desired widget.
  }
}
