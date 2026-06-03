
  import 'package:flutter/material.dart';

  class ThemeProvider extends ChangeNotifier{
  bool _isDarkMode = false;



    void setTheme({required bool Value}){
      _isDarkMode =Value;
      notifyListeners();
    }

    bool getTheme() => _isDarkMode;
  }