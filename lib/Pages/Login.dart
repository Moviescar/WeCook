import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/User.dart';
import 'package:flutter_application_1/Pages/NewRecipeMaker.dart';
import 'package:flutter_application_1/Providers/MyRecipeProvider.dart';
import 'package:flutter_application_1/Providers/RecipeListProvider.dart';
import 'package:flutter_application_1/Widgets/Header.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../BackendService.dart';
import '../main.dart';
import 'Signup.dart';
import '../SharedPrefs.dart';


class Login extends StatefulWidget {

  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();
  SharedPref sharedPref = SharedPref();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
  }



  @override
  Widget build(BuildContext context) {
    MyRecipeProvider myRecipeProvider = Provider.of(context, listen: false);
    RecipeListProvider recipeListProvider = Provider.of(context, listen: false);
    BackendService backendService = BackendService(recipeListProvider, myRecipeProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(),
      body: SingleChildScrollView(
        child:Container(
          margin: new EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              SizedBox(height: 100),
              const Text(
                'Login' ,style: TextStyle(
                fontSize: 24,
                color: Colors.orangeAccent,
              ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',

                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160,
                    child: ElevatedButton(
                      onPressed: () async {
                        if(await backendService.login(email.text, password.text)){
                          Navigator.pushNamed(context, '/recipeList');
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ),
                  Container(
                    width: 160,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: const Text('Sign up'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

