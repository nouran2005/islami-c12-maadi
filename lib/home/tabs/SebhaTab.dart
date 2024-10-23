import 'package:flutter/material.dart';
import 'widgets/BuildSebhaImage.dart';
import 'widgets/BuildTasbeehButton.dart';
import 'widgets/BuildTasbeehCounter.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int tasbeehCount = 0;
  int tasbeehIndex = 0;
  double turns = 0.0; 
  bool isButtonDisabled = false;
  final List<String> tasbeehs = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
    'استغفر الله',
  ];
  void _incrementTasbeeh() {
    if (isButtonDisabled) return; 
    setState(() {
      tasbeehCount++;
      if (tasbeehCount % 33 == 0) {
        tasbeehIndex = (tasbeehIndex + 1) % tasbeehs.length;
        tasbeehCount = 0;
      }
      turns += 0.05;
      isButtonDisabled = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isButtonDisabled = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SebhaImage(
                  turns: turns,
                  incrementTasbeeh: _incrementTasbeeh,
                ),
                SizedBox(height: height * 0.09), 
                TasbeehCounter(
                  tasbeehCount: tasbeehCount,
                  tasbeehText: tasbeehs[tasbeehIndex],
                ),
                SizedBox(height: height * 0.03),
                TasbeehButton(
                  incrementTasbeeh: _incrementTasbeeh,
                  tasbeehText: tasbeehs[tasbeehIndex],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
