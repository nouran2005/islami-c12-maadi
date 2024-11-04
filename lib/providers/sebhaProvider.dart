import 'package:flutter/cupertino.dart';

class SebhaProvider extends ChangeNotifier{
  int tasbeehCount = 0;
  int tasbeehIndex = 0;
  double turns = 0.0; 
  bool isButtonDisabled = false;
  final List<String> tasbeehs = [
    'استغفر الله',
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
  ];
   void incrementTasbeeh() {
    if (isButtonDisabled) return; 
      tasbeehCount++;
      if (tasbeehCount % 30 == 0) {
        tasbeehIndex = (tasbeehIndex + 1) % tasbeehs.length;
        tasbeehCount = 0;
      }
      turns += 0.05;
      isButtonDisabled = true;
    Future.delayed(const Duration(seconds: 1), () {

        isButtonDisabled = false;

    });
    notifyListeners();
  }
}