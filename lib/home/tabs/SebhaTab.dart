import 'package:flutter/material.dart';
import 'package:islami_c12_maadi/providers/sebhaProvider.dart';
import 'package:provider/provider.dart';
import 'Widgets/BuildSebhaImage.dart';
import 'Widgets/BuildTasbeehButton.dart';
import 'Widgets/BuildTasbeehCounter.dart';

class TasbeehTap extends StatelessWidget {
  const TasbeehTap({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context) => SebhaProvider(),
      child: Consumer<SebhaProvider>(
        builder: (context, value, child) {
          return Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SebhaImage(
                      turns: value.turns,
                      incrementTasbeeh:value.incrementTasbeeh,
                    ),
                    SizedBox(height: height * 0.09), 
                    TasbeehCounter(
                      tasbeehCount: value.tasbeehCount,
                      tasbeehText: value.tasbeehs[value.tasbeehIndex],
                    ),
                    SizedBox(height: height * 0.03),
                    TasbeehButton(
                      incrementTasbeeh: value.incrementTasbeeh,
                      tasbeehText: value.tasbeehs[value.tasbeehIndex],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
        },

      ),
    );
  }
}
