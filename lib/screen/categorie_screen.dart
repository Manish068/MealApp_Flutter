import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screen/meals_screen.dart';
import 'package:meal_app/widget/category_grid_item.dart';
import '../data/dummy_data.dart';
import 'package:meal_app/model/Category.dart';

import '../model/meal.dart';

class CategoriesScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  const CategoriesScreen({super.key, required this.availableMeals});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  
  @override
  void initState() {
    _animationController = AnimationController(vsync:this,upperBound: 1,lowerBound: 0,duration: const Duration(milliseconds: 300));

    _animationController.forward();
    super.initState();
  }
  
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals.where((element) =>
        element.categories.contains(category.id)).toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) =>
        MealsScreen(title: category.title, meals: filteredMeals,)));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      builder: (context,child) {
        return SlideTransition(position: Tween(
            begin: const Offset(0, 0.30),
            end: const Offset(0, 0)
        ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)),child: child);
      },

    );
  }
}
