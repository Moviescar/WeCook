import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/User.dart';
import 'package:flutter_application_1/SharedPrefs.dart';
import '../Models/Recipe.dart';
import '../main.dart';

class RecipeListProvider with ChangeNotifier{
  List<User> _users = [];
  List<Recipe> _recipe = [];
  List<User> get users => _users;

  var _searchInput;

  set users(List<User> users) {
    _users = [];
    _recipe = [];
    _users = users;
    for(final user in _users){
      for(final recipe in user.recipe){
        _recipe.add(recipe);
      }
    }
  }

  List<Recipe> get recipe => _recipe;

  getAllUserRecipes() async {
    SharedPref sharedPref = SharedPref();
    final response = await http.get(
      Uri.parse('${MyApp.urlPrefix}/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    List<User> userList = [];
    var parsedJson = json.decode(response.body);
    for(var user in parsedJson){
      userList.add(User.fromJson(user));
    }
    sharedPref.save('users', userList);
    users = userList;
    notifyListeners();
  }
  updateSearchInput(newInput){
    _searchInput = newInput;
    notifyListeners();
  }

  get searchInput => _searchInput;
}