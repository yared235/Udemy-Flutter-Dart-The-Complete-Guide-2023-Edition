import 'package:flutter/material.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onScreenSelect});
  final void Function(String identifier) onScreenSelect;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primary
            ])),
            child: Row(
              children: [
                const Icon(
                  Icons.fastfood,
                  size: 48,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'Cooking Up',
                  style: TextStyle(
                      fontSize: 26,
                      color: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .backgroundColor),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'Meals',
              style: TextStyle(
                  fontSize: 28,
                  color:
                      Theme.of(context).textTheme.titleSmall!.backgroundColor),
            ),
            onTap: () {onScreenSelect('Meals');},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'Filter',
              style: TextStyle(
                  fontSize: 28,
                  color:
                      Theme.of(context).textTheme.titleSmall!.backgroundColor),
            ),
            onTap: () {onScreenSelect('Filter');},
          )
        ],
      ),
    ); // Replace with your desired widget.
  }
}
