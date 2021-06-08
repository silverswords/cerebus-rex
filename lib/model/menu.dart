import 'package:flutter/material.dart';

class MenuModel with ChangeNotifier {
  int _selectIndex = 0;
  bool _collapsed = false;

  int get selectIndex => _selectIndex;
  bool get collapsed => _collapsed;

  void select(int index) {
    _selectIndex = index;
    notifyListeners();
  }

  void changeCollapsed() {
    _collapsed = !_collapsed;
    notifyListeners();
  }
}