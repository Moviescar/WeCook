
import 'dart:convert';

import 'package:flutter_application_1/Models/Ingredient.dart';
import 'package:flutter_application_1/Models/Instruction.dart';

Recipe recipeFromJson(String str) => Recipe.fromJson(json.decode(str));

String recipeToJson(Recipe data) => json.encode(data.toJson());

class Recipe {
  Recipe({
    required this.ownerId,
    required this.recipeName,
    required this.ingredients,
    required this.steps,
  });

  int ownerId;
  String recipeName;
  List<Ingredient> ingredients;
  List<Instruction> steps;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    ownerId: json["ownerId"],
    recipeName: json["recipeName"],
    ingredients: List<Ingredient>.from(json["ingredients"].map((x) => x)),
    steps: List<Instruction>.from(json["steps"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "ownerId": ownerId,
    "recipeName": recipeName,
    "ingredients": List<Ingredient>.from(ingredients.map((x) => x)),
    "steps": List<Instruction>.from(steps.map((x) => x)),
  };
}
