import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screen/meals_screen.dart';
import 'package:meal_app/widget/category_grid_item.dart';
import '../data/dummy_data.dart';
import 'package:meal_app/model/Category.dart';

import '../model/meal.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Meal> availableMeals;
  const CategoriesScreen({super.key, required this.onToggleFavorite, required this.availableMeals});
  final void Function(Meal meal) onToggleFavorite;


  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals.where((element) =>
        element.categories.contains(category.id)).toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>
        MealsScreen(title: category.title, meals: filteredMeals,onToggleFavorite: onToggleFavorite,)));
  }


  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20),
      children: [
        for(final item in availableCategories)
          CategoryGridItem(category: item, onSelectCategory: () {
            _selectCategory(context, item);
          },)
      ],
    );
  }
}
