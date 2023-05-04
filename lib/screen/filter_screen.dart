import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filters_provider.dart';


class FilterScreen extends ConsumerWidget {
  const FilterScreen({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilters =ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your filters"),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier){
      //   Navigator.of(context).pop();
      //   if(identifier == 'meals'){
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const TabScreen()));
      //   }
      // }),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked){
             ref.read(filterProvider.notifier).setFilter(Filter.glutenFree, isChecked);
            },
            title: Text(
              "Gluten-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle:  Text("Only include gluten-free meals.",style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34,right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked){
              ref.read(filterProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
            },
            title: Text(
              "Lactose-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle:  Text("Only include Lactose-free meals.",style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34,right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked){
              ref.read(filterProvider.notifier).setFilter(Filter.vegetarian, isChecked);
            },
            title: Text(
              "Vegeterian",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle:  Text("Only include Vegeterian meals.",style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34,right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked){
              ref.read(filterProvider.notifier).setFilter(Filter.vegan, isChecked);
            },
            title: Text(
              "Vegan",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle:  Text("Only include Vegan meals.",style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground)),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34,right: 22),
          ),
        ],
      ),
    );
  }
}
