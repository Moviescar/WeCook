import 'dart:convert';

import 'package:flutter_application_1/Models/Recipe.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.recipe,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  List<Recipe> recipe;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    recipe: List<Recipe>.from(json["recipe"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "recipe": List<Recipe>.from(recipe.map((x) => x)),
  };
}
