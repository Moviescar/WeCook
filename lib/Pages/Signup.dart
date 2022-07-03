import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/SignupValidity.dart';
import 'package:flutter_application_1/Pages/Login.dart';
import 'package:http/http.dart' as http;
import '../Widgets/Header.dart';
import '../main.dart';



class Signup extends StatefulWidget {


  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final email = TextEditingController();

  final password = TextEditingController();

  final firstName = TextEditingController();

  final lastName = TextEditingController();

  var valid = SignupValidity();



  @override
  void dispose() {
    email.dispose();
    password.dispose();
    firstName.dispose();
    lastName.dispose();
  }

  checkEmailAvailable() async {
    final response = await http.post(
      Uri.parse('${MyApp.urlPrefix}/user/exist'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email.text,
      }),
    );
    setState(() {
      if(response.body == 'true'){
        valid.emailAvailable = false;
        valid.formReady = false;
      }
    });

  }
  checkEmptyField(){
    setState(() {
      if ([email.text, password.text, firstName.text, lastName.text].any((element) => element == '')) {
        valid.allFieldsFilled = false;
        valid.formReady = false;
      }
    });
  }

  validityCheck() async {
    resetValidity();
    await checkEmailAvailable();
    checkEmptyField();
  }

  resetValidity(){
    setState((){
      valid.emailAvailable = true;
      valid.allFieldsFilled = true;
      valid.formReady = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      resizeToAvoidBottomInset : true,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100),
              const Text(
                'Sign up' ,style: TextStyle(
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

              const SizedBox(height: 20),
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
              TextField(
                controller: firstName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'First name',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: lastName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Last name',
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 50,
                child: Column(
                  children: [
                    Visibility(
                      visible: !valid.emailAvailable,
                      child: const Text("Email not available.",style: TextStyle(color: Colors.red)),
                    ),
                    Visibility(
                      visible: !valid.allFieldsFilled,
                      child: const Text("All fields are required.",style: TextStyle(color: Colors.red),),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: const Text('Login'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 160,
                    child: ElevatedButton(
                      onPressed: () async {
                        await validityCheck();
                        if (valid.formReady){
                          http.post(
                            Uri.parse('${MyApp.urlPrefix}/user'),
                            headers: <String, String>{
                              'Content-Type': 'application/json; charset=UTF-8',
                            },
                            body: jsonEncode(<String, String>{
                              'email': email.text,
                              'password': password.text,
                              'firstName': firstName.text,
                              'lastName': lastName.text
                            }),
                          );
                          Navigator.push(context,MaterialPageRoute(builder: (context) => Login()),
                          );
                        }
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
