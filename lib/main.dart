import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Models/User.dart';
import 'package:flutter_application_1/Pages/MyRecipe.dart';
import 'package:flutter_application_1/Pages/MyRecipeElement.dart';
import 'package:flutter_application_1/Pages/NewRecipeMaker.dart';
import 'package:flutter_application_1/Pages/RecipeElement.dart';
import 'package:flutter_application_1/Pages/RecipeList.dart';
import 'package:flutter_application_1/Pages/Signup.dart';
import 'package:flutter_application_1/Pages/SplashScreen.dart';
import 'package:flutter_application_1/Providers/MyRecipeProvider.dart';
import 'package:flutter_application_1/Providers/NewRecipeProvider.dart';
import 'package:flutter_application_1/Providers/RecipeListProvider.dart';
import 'package:flutter_application_1/SharedPrefs.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/Login.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var initialRoute;
  final prefs = await SharedPreferences.getInstance();
  final user = prefs.getString('user');

  if(user != null){
    initialRoute = '/splashScreen';
  }else{
    initialRoute = '/login';
  }
  final MyApp myApp = MyApp(
    initialRoute: initialRoute,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NewRecipeProvider()),
      ChangeNotifierProvider(create: (_) => RecipeListProvider()),
      ChangeNotifierProvider(create: (_)=> MyRecipeProvider())
    ],
    child: myApp,
  ));
}

class MyApp extends StatelessWidget {
  SharedPref sharedPref = SharedPref();
  late final initialRoute;
  MyApp({this.initialRoute});
  static const urlPrefix = 'http://9af2-2001-1c00-1102-7900-b84f-13ca-efd5-7d65.ngrok.io/api';

  Widget build(BuildContext context) {
      return MaterialApp(
        initialRoute: initialRoute,
        routes: {
          '/splashScreen': (context) =>
            FutureBuilder(future: sharedPref.read("users"), builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              RecipeListProvider recipeListProvider = Provider.of(context, listen: false);
              recipeListProvider.users = userListFromJson(snapshot.data.toString());
              return const RecipeList();
            }else{
              return SplashScreen();
            }
          }),
          '/login': (context) => Login(),
          '/signup': (context) => Signup(),
          '/newRecipe': (context) => RecipeMaker(),
          '/recipeList': (context) => RecipeList(),
          '/recipeElement': (context) => RecipeElement(),
          '/myRecipeElement': (context) => MyRecipeElement(),
          '/myRecipe': (context) => MyRecipe()
        },
        theme: ThemeData(
          fontFamily: 'SourceSansPro',
        ),
      );
  }
}

