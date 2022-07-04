import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/MyRecipe.dart';
import 'package:flutter_application_1/Pages/NewRecipeMaker.dart';
import 'package:flutter_application_1/Pages/RecipeElement.dart';
import 'package:flutter_application_1/Pages/RecipeList.dart';
import 'package:flutter_application_1/Pages/Signup.dart';
import 'package:flutter_application_1/Providers/MyRecipeProvider.dart';
import 'package:flutter_application_1/Providers/NewRecipeProvider.dart';
import 'package:flutter_application_1/Providers/RecipeListProvider.dart';
import 'package:flutter_application_1/SharedPrefs.dart';
import 'package:provider/provider.dart';
import 'Pages/Login.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NewRecipeProvider()),
      ChangeNotifierProvider(create: (_) => RecipeListProvider()),
      ChangeNotifierProvider(create: (_)=> MyRecipeProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  static const urlPrefix = 'http://9af2-2001-1c00-1102-7900-b84f-13ca-efd5-7d65.ngrok.io/api';
  SharedPref sharedPref = SharedPref();
  isLoggedIn(){
    if(sharedPref.read('user')){
      return RecipeList();
    }else{
      return Login();
    }
  }

  Widget build(BuildContext context) {
      return MaterialApp(
        initialRoute: "/",
        routes: {
          '/login': (context) => Login(),
          '/signup': (context) => Signup(),
          '/newRecipe': (context) => RecipeMaker(),
          '/recipeList': (context) => RecipeList(),
          '/recipeElement': (context) => RecipeElement(),
          '/myRecipe': (context) => MyRecipe()
        },
        theme: ThemeData(
          fontFamily: 'SourceSansPro',
        ),
        home: Login(),
      );
  }
}

