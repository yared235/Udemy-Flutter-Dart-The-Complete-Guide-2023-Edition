import 'package:flutter/material.dart';
enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  spices,
  weets,
  carbs,
  other,hygiene,convenience,sweets,

}
class MyCategory {
  const MyCategory( this.cantagoryName, this.cantagoryColor);
  final String cantagoryName;
  final Color cantagoryColor;
}
// Categories.dairy: Category(
//     'Dairy',
//     Color.fromARGB(255, 0, 208, 255),
//   ),
//   Categories.carbs: Category(
//     'Carbs',
//     Color.fromARGB(255, 0, 60, 255),
//   ),
//   Categories.sweets: Category(
//     'Sweets',
//     Color.fromARGB(255, 255, 149, 0),
//   ),
  // Categories.spices: Category(
//     'Spices',
//     Color.fromARGB(255, 255, 187, 0),
//   ),
//   Categories.convenience: Category(
//     'Convenience',
//     Color.fromARGB(255, 191, 0, 255),
//   ),
//   Categories.hygiene: Category(
//     'Hygiene',
//     Color.fromARGB(255, 149, 0, 255),
//   ),
//   Categories.other: Category(
//     'Other',
//     Color.fromARGB(255, 0, 225, 255),
//   ),