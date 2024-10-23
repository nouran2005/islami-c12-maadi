import 'package:flutter/material.dart';

class SebhaImage extends StatelessWidget {
  final double turns;
  final VoidCallback incrementTasbeeh;

  const SebhaImage({
    required this.turns,
    required this.incrementTasbeeh,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          'assets/images/headseb7a.png',
          width: 100,
          height: 100,
        ),
        Transform.translate(
          offset: const Offset(0, 41), 
          child: GestureDetector(
            onTap: incrementTasbeeh,
            child: AnimatedRotation(
              turns: turns, 
              duration: const Duration(seconds: 1),
              child: Image.asset(
                "assets/images/bodyseb7a.png",
                width: 230,
                height: 233,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
