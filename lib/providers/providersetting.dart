import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingProvider extends ChangeNotifier {
  ThemeMode cuurrenttheme = ThemeMode.light;
  static SharedPreferences? prefs;

  changecurrenttheme(ThemeMode newtheme) {

     cuurrenttheme = newtheme;
     if(newtheme == ThemeMode.light ){
       prefs?.setString('themee', 'light');
     }
     else{
       prefs?.setString('themee', 'dark');
     }

    notifyListeners();
  }

  gettheme()
  {
    String themee = prefs?.getString('themee')??'light';
    if(themee == 'light'){
      cuurrenttheme = ThemeMode.light;
    }
    else{
      cuurrenttheme = ThemeMode.dark;
    }

  }

}
