import 'package:flutter_application_1/Providers/MyRecipeProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'Models/User.dart';
import 'main.dart';

class SharedPref {
  MyRecipeProvider myRecipeProvider = MyRecipeProvider();
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await json.decode(prefs.getString(key) ?? "");
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }


}