import 'package:flutter/material.dart';
import 'package:meal_app/widget/meal_item_dart.dart';
import 'package:transparent_image/transparent_image.dart';

import '../model/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({Key? key, required this.meal, required this.onSelectMealItem})
      : super(key: key);
  final Meal meal;
  final void Function(Meal meal) onSelectMealItem;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        onTap: () {
          onSelectMealItem(meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                              icon: Icons.schedule,
                              label: '${meal.duration} min'),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                              icon: Icons.work, label: complexityText),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                              icon: Icons.attach_money,
                              label: affordabilityText),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
