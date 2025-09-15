import 'package:flutter/material.dart';

// import 'package:sec8_multiscreen_app/screens/tabs.dart';
// import 'package:sec8_multiscreen_app/widgets/drawer.dart';
enum Filter { glutenFree, lactoseFree, vegiterian, vegan }

class FilterMeals extends StatefulWidget {
  const FilterMeals({super.key, required this.currentFilters});
  final Map<Filter,bool> currentFilters;

  @override
  State<FilterMeals> createState() {
    return _FilterMealsState();
  }
}

class _FilterMealsState extends State<FilterMeals> {
  var glutenFreeFilterSet = false;
  void checkk(bool isChecked) {
    setState(() {
      glutenFreeFilterSet = isChecked;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    var lactoseFreeFilterSet = false;
    var vegiterianFilterSet = false;
    var veaganFilterSet = false;
    glutenFreeFilterSet= widget.currentFilters[Filter.glutenFree]!;
    lactoseFreeFilterSet= widget.currentFilters[Filter.lactoseFree]!;
    vegiterianFilterSet= widget.currentFilters[Filter.vegiterian]!;
    veaganFilterSet= widget.currentFilters[Filter.vegan]!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filterd Items'),
      ),
      // drawer: MainDrawer(
      //   onScreenSelect: (String identifier) {
      //     if (identifier == 'Meals') {
      //       Navigator.pop(context);
      //       Navigator.of(context).pushReplacement(MaterialPageRoute(
      //           builder: (cxt) =>
      //               TabsScreen()));
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: glutenFreeFilterSet,
            Filter.lactoseFree: lactoseFreeFilterSet,
            Filter.vegiterian: vegiterianFilterSet,
            Filter.vegan: veaganFilterSet
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenFreeFilterSet,
              onChanged: (isChecked) {
                checkk(isChecked);
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'only include gluten-free meals',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              value: lactoseFreeFilterSet,
              onChanged: (isChecked) {
                lactoseFreeFilterSet = isChecked;
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'only include Lactose-free meals',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              value: vegiterianFilterSet,
              onChanged: (isChecked) {
                vegiterianFilterSet = isChecked;
              },
              title: Text(
                'Vegiterian',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'only Vegiterian meals',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              value: veaganFilterSet,
              onChanged: (isChecked) {
                veaganFilterSet = isChecked;
              },
              title: Text(
                'Vegan',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'only Vegan meals',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
          ],
        ),
      ),
    );
  }
}
