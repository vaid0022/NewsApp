import 'package:flutter/material.dart';
import 'package:newsspp/Providers/Provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sharedprefrence{
  static Future<void> SetTheme({required bool value })async{
    var pref = await SharedPreferences.getInstance();
    pref.setBool("Theme", value);
  }
  static void GetTheme({required BuildContext context})async{
    var pref =await SharedPreferences.getInstance();
    bool? Theme = pref.getBool("Theme");

    if(Theme != null){
      Provider.of<ThemeProvider>(context,listen: false).setTheme(Value: Theme);
    }
  }


}