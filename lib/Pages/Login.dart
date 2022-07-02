import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/NewRecipeMaker.dart';
import 'package:http/http.dart' as http;
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text(
            'WeCook' ,style: TextStyle(
            fontSize: 40,
            color: Colors.orangeAccent,
          ),
          ),
          backgroundColor: Colors.white),
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
                         final response = await http.post(
                            Uri.parse('${MyApp.urlPrefix}/user/login'),
                            headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                            },
                            body: jsonEncode(<String, String>{
                              'email': email.text,
                              'password': password.text,
                              }
                            ),
                          );
                        if(response.body.isNotEmpty){
                          sharedPref.save('user', response.body);
                          print(await sharedPref.read('user'));
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RecipeMaker()),
                          );
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ),
                  Container(
                    width: 160,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
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

