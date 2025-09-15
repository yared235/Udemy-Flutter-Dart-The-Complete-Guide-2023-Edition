import 'package:flutter/material.dart';
import 'package:sec8_multiscreen_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:sec8_multiscreen_app/models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.selectMealItem});
  final Function(Meal mealItem) selectMealItem;
  final Meal meal;
  String get complexityText {
    return meal.complexity.name[0] + meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0] + meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {selectMealItem(meal);},
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    padding: const EdgeInsets.symmetric(),
                    color: Colors.black54,
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealItemTrait(
                                lable: '${meal.duration} min',
                                icon: Icons.schedule),
                            const SizedBox(
                              width: 12,
                            ),
                            MealItemTrait(
                                lable: complexityText,
                                icon: Icons.work),
                            const SizedBox(
                              width: 12,
                            ),
                            MealItemTrait(
                                lable: affordabilityText,
                                icon: Icons.money_off),
                          ],
                        )
                      ],
                    )))
          ],
        ),
      ),
    ); // Replace with your desired widget.
  }
}
