import 'dart:convert';

import 'package:flutter_application_1/Providers/MyRecipeProvider.dart';
import 'package:flutter_application_1/Providers/RecipeListProvider.dart';
import 'package:http/http.dart' as http;
import 'Models/User.dart';
import 'SharedPrefs.dart';
import 'main.dart';

class BackendService {
  RecipeListProvider recipeListProvider;
  SharedPref sharedPref = SharedPref();
  MyRecipeProvider myRecipeProvider;

  BackendService(this.recipeListProvider, this.myRecipeProvider);

  getAllUserRecipes() async {
    SharedPref sharedPref = SharedPref();
    final response = await http.get(
      Uri.parse('${MyApp.urlPrefix}/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if(response.statusCode == 200){
      List<User> userList = [];
      var parsedJson = json.decode(response.body);
      for(var user in parsedJson){
        userList.add(User.fromJson(user));
      }
      final jsonList = userListToJson(userList);
      await sharedPref.save('users', jsonList);
      recipeListProvider.users = userListFromJson(await sharedPref.read("users"));
    }else{
      recipeListProvider.users = userListFromJson(await sharedPref.read("users"));
    }

  }

  getUserRecipe() async {
    int? id = userFromJson(await sharedPref.read("user")).id;
    final response = await http.post(
      Uri.parse('${MyApp.urlPrefix}/user/one'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int?>{
        'id': id
      }
      ),
    );
    if(response.statusCode == 201){
      await sharedPref.save('user', response.body);
      myRecipeProvider.user = userFromJson(await sharedPref.read('user'));
    }else{
      myRecipeProvider.user = userFromJson(await sharedPref.read('user'));
    }
  }

  login(email,password) async {
    final response = await http.post(
      Uri.parse('${MyApp.urlPrefix}/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }
      ),
    );
    if(response.body.isNotEmpty){
      await sharedPref.save('user', response.body);
      myRecipeProvider.user = userFromJson(await sharedPref.read('user'));
      await updateAllData();
      return true;
    }
    return false;
  }

  updateAllData() async {
    await getAllUserRecipes();
    await getUserRecipe();
  }
}