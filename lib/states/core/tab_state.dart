import 'package:flutter/material.dart';

class TabControllerData extends ChangeNotifier {
  late int _tabIndex;

  int get tabIndex => _tabIndex;

  void incrmentIndex() {
    _tabIndex = _tabIndex + 1;
    notifyListeners();
  }

  void initialIndex() {
    _tabIndex = 0;
    notifyListeners();
  }
}
