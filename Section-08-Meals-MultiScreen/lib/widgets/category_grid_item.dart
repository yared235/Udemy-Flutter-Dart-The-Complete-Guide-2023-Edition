import 'package:flutter/material.dart';
import 'package:sec8_multiscreen_app/models/category.dart';
class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category, required this.selectCatagory});
  final Category category;
  final void Function() selectCatagory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectCatagory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.55),
            category.color.withOpacity(0.9)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    ); // Replace with your desired widget.
  }
}
