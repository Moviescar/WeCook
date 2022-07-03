import 'package:flutter/material.dart';

class SignupValidity {
  bool _emailAvailable = true;
  bool _allFieldsFilled= true;
  bool _formReady= true;

  SignupValidity(){}

  bool get formReady => _formReady;

  set formReady(bool value) {
    _formReady = value;
  }

  bool get allFieldsFilled => _allFieldsFilled;

  set allFieldsFilled(bool value) {
    _allFieldsFilled = value;
  }

  bool get emailAvailable => _emailAvailable;

  set emailAvailable(bool value) {
    _emailAvailable = value;
  }
}