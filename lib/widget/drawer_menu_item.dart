import 'package:flutter/material.dart';

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem({Key? key, required this.icon, required this.itemTitle, required this.onSelectScreen}) : super(key: key);
  final IconData icon;
  final String itemTitle;
  final void Function() onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,size: 26,color: Theme.of(context).colorScheme.onBackground,),
      title: Text(
        itemTitle,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 24),
      ),
      onTap:onSelectScreen,
    );
  }
}
