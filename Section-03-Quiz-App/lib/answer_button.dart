import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({required this.onTap, required this.text, super.key});
  final void Function() onTap;
  final String text;
  @override
  Widget build(context) {
    return OutlinedButton(
      
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        backgroundColor: const Color.fromARGB(255, 22, 20, 119),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
