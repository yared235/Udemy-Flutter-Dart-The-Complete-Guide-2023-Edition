import 'package:flutter/material.dart';
import 'package:sec11_handling_user_input/models/grocery_item.dart';

class GroceryItemDisplay extends StatelessWidget {
  const GroceryItemDisplay({super.key, required this.groceryItem});
  final GroceryItem groceryItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListTile(
        title: Text(
            groceryItem.name,
          ),
          leading: Container(
            color: groceryItem.category.cantagoryColor,
            height: 15,
            width: 15,
          ),
          trailing: Text(groceryItem.quantity.toString()),
          
      )
      
      /*Row(
        children: [
          Container(
            color: groceryItem.category.cantagoryColor,
            height: 15,
            width: 15,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            groceryItem.name,
          ),
          const Spacer(),
          Text(groceryItem.quantity.toString())
        ],
      ), */
    );
  }
}
