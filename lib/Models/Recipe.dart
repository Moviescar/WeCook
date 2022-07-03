import 'package:flutter/material.dart';

import 'Ingredient.dart';
import 'Instruction.dart';

class Recipe {
  Recipe({
    this.id,
    required this.recipeName,
    required this.ingredient,
    required this.step,
  });

  int? id;
  String recipeName;
  List<Ingredient> ingredient;
  List<Instruction> step;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    id: json["id"],
    recipeName: json["recipeName"],
    ingredient: List<Ingredient>.from(json["ingredient"].map((x) => Ingredient.fromJson(x))),
    step: List<Instruction>.from(json["step"].map((x) => Instruction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "recipeName": recipeName,
    "ingredient": List<dynamic>.from(ingredient.map((x) => x.toJson())),
    "step": List<dynamic>.from(step.map((x) => x.toJson())),
  };
}