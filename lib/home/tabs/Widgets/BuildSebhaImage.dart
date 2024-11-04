import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:islami_c12_maadi/providers/SettingsProvider.dart';

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
    final settingsProvider = Provider.of<SettingsProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.07),
          child: Image.asset(
            settingsProvider.themeMode == ThemeMode.light
              ? 'assets/images/headseb7a.png'
              : 'assets/images/head_of_seb7a_dark.png', 
              width: 100,
            height: 100,
          ),
        ),
        Transform.translate(
          offset: const Offset(0, 41),
          child: GestureDetector(
            onTap: incrementTasbeeh,
            child: AnimatedRotation(
              turns: turns,
              duration: const Duration(seconds: 1),
              child: Padding(
                padding:  EdgeInsets.only(top: height * 0.01),
                child: Image.asset(
                  settingsProvider.themeMode == ThemeMode.light
                  ?"assets/images/bodyseb7a.png"
                  :"assets/images/body_of_seb7a_dark.png",
                  width: 200, 
                  height: 200, 
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}



