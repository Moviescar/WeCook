import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/user.dart';

class UserProvider with ChangeNotifier {
  User _user = User(1, 'email', 'firstName', 'lastName');

  getUser(){
    return _user;
  }
  setUser(User user){
    _user = user;
    notifyListeners();
  }
}