import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/NewRecipeProvider.dart';
import 'package:provider/provider.dart';
import 'Pages/Login.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NewRecipeProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  static const urlPrefix = 'http://0fd1-2001-1c00-1102-7900-b065-a2f9-4d96-738b.ngrok.io/api';

  Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData(
          fontFamily: 'SourceSansPro',
        ),
        home: Login(),
      );
  }
}

