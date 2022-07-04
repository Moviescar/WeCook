import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/User.dart';
import '../Models/Recipe.dart';

class RecipeListProvider with ChangeNotifier{
  List<User> _users = [];
  List<Recipe> _recipe = [];
  List<User> get users => _users;

  var _searchInput= "";

  set users(List<User> users) {
    _users = [];
    _recipe = [];
    _users = users;
    for(final user in _users){
      for(final recipe in user.recipe){
        _recipe.add(recipe);
      }
    }
    notifyListeners();
  }

  List<Recipe> get recipe => _recipe;


  updateSearchInput(String newInput){
    _searchInput = newInput;
    notifyListeners();
  }

  get searchInput => _searchInput;
}