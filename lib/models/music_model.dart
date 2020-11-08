import 'package:flutter/material.dart';

class MusicModel extends ChangeNotifier {
  var index = 2;

  void changeIndex(int num) {
    index = num;
    notifyListeners();
  }
}