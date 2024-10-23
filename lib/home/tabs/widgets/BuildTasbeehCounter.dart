
import 'package:flutter/material.dart';

class TasbeehCounter extends StatelessWidget {
  final int tasbeehCount;
  final String tasbeehText;

  const TasbeehCounter({
    required this.tasbeehCount,
    required this.tasbeehText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Text(
          'عدد التسبيحات',
          style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).colorScheme.onSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: height*0.05),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            '$tasbeehCount',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      ],
    );
  }
}