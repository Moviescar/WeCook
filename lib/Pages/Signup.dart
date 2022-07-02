import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Login.dart';
import 'package:http/http.dart' as http;
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

  var emailExists = false;
  var oneFieldEmpty = false;
  var formReady = true;



  @override
  void dispose() {
    email.dispose();
    password.dispose();
    firstName.dispose();
    lastName.dispose();
  }

  void update() {
    setState(() {
    });
  }

  Future<bool> emailExist() async {
    final response = await http.post(
      Uri.parse('${MyApp.urlPrefix}/user/exist'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email.text,
      }),
    );
    print(response.body);
    return response.body == 'true';
  }

  validityCheck() async {
    emailExists = false;
    oneFieldEmpty = false;
    formReady = true;

    if(email.text.isEmpty) {
      oneFieldEmpty = true;
      formReady = false;
    }else{
      if(await emailExist()){
        emailExists = true;
        formReady = false;
      }else{
        emailExists = false;
      }
    }
    if(password.text.isEmpty){
      oneFieldEmpty = true;
      formReady = false;
    }
    if(firstName.text.isEmpty){
      oneFieldEmpty = true;
      formReady = false;
    }
    if(lastName.text.isEmpty){
      oneFieldEmpty = true;
      formReady = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: emailExists,
                child: const Text("Email not available.",style: TextStyle(color: Colors.red)),
              ),
              Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: oneFieldEmpty,
                child: const Text("All fields are required.",style: TextStyle(color: Colors.red),),
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
                        validityCheck();
                        if (formReady){
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
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
