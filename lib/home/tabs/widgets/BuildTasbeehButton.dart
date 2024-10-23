import 'package:flutter/material.dart';

class TasbeehButton extends StatelessWidget {
  final VoidCallback incrementTasbeeh;
  final String tasbeehText;

  const TasbeehButton({
    required this.incrementTasbeeh,
    required this.tasbeehText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: incrementTasbeeh,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), 
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      child: Text(
        tasbeehText,
        style: TextStyle(
          fontSize: 24,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}