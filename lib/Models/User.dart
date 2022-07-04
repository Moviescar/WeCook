import 'dart:convert';

import 'Recipe.dart';

List<User> userListFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userListToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.recipe,
  });

  int? id;
  String email;
  String firstName;
  String lastName;
  List<Recipe> recipe;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    recipe: List<Recipe>.from(json["recipe"].map((x) => Recipe.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "recipe": List<dynamic>.from(recipe.map((x) => x.toJson())),
  };
}