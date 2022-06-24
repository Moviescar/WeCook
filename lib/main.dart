import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/RecipeMaker.dart';
import 'package:flutter_application_1/Providers/UserProvider.dart';
import 'package:flutter_application_1/Pages/Signup.dart';
import 'package:hive/hive.dart';
import 'package:pedometer/pedometer.dart';
import 'package:provider/provider.dart';
import './Stats.dart';
import 'Pages/Login.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  static const urlPrefix = 'https://4fb1-2001-1c00-1102-7900-64ff-79d0-7405-96a5.ngrok.io/api';

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'SourceSansPro',
        ),
        home: RecipeMaker(),
      ),
    );
  }
}

