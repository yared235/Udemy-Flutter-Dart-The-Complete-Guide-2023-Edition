import 'package:flutter/material.dart';
import 'flutter_container.dart';
void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradiantContainer([Colors.deepPurple, Color.fromARGB(255, 77, 255, 107)]),
      ),
    ),
  );
}

