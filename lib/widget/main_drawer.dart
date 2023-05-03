import 'package:flutter/material.dart';
import 'package:meal_app/widget/drawer_menu_item.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key, required this.onSelectScreen}) : super(key: key);
  final void Function(String indentifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 4,
      child: Column(
        children: [
          DrawerHeader(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Row(
                children: [
                  Icon(
                    Icons.fastfood,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    'Cooking Up!',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  )
                ],
              )),
          DrawerMenuItem(icon: Icons.restaurant, itemTitle: "Meals",onSelectScreen: (){
            onSelectScreen('meals');
          },),
          DrawerMenuItem(icon: Icons.settings, itemTitle: "Filters",onSelectScreen: (){
            onSelectScreen('filters');
          },),
        ],
      ),
    );
  }
}
