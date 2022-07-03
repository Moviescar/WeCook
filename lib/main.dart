import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/NewRecipeMaker.dart';
import 'package:flutter_application_1/Pages/RecipeElement.dart';
import 'package:flutter_application_1/Pages/RecipeList.dart';
import 'package:flutter_application_1/Pages/Signup.dart';
import 'package:flutter_application_1/Providers/NewRecipeProvider.dart';
import 'package:flutter_application_1/Providers/RecipeListProvider.dart';
import 'package:provider/provider.dart';
import 'Pages/Login.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NewRecipeProvider()),
      ChangeNotifierProvider(create: (_) => RecipeListProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  static const urlPrefix = 'http://3135-2001-1c00-1102-7900-3435-cfa8-c1d8-927e.ngrok.io/api';

  Widget build(BuildContext context) {
      return MaterialApp(
        initialRoute: "/",
        routes: {
          '/login': (context) => Login(),
          '/signup': (context) => Signup(),
          '/newRecipe': (context) => RecipeMaker(),
          '/recipeList': (context) => RecipeList(),
          '/recipeElement': (context) => RecipeElement()
        },
        theme: ThemeData(
          fontFamily: 'SourceSansPro',
        ),
        home: Login(),
      );
  }
}

