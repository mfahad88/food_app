import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{
  TextEditingController phone_controller=TextEditingController();
  TextEditingController password_controller=TextEditingController();
  int _selectedIndex=0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }
}