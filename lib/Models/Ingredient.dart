import 'dart:convert';

Ingredient ingredientFromJson(String str) => Ingredient.fromJson(json.decode(str));

String ingredientToJson(Ingredient data) => json.encode(data.toJson());

class Ingredient {
  Ingredient({
    required this.ingredientname,
    required this.amount,
    required this.amountType,
  });

  String ingredientname;
  int amount;
  String amountType;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    ingredientname: json["ingredientname"],
    amount: json["amount"],
    amountType: json["amountType"],
  );

  Map<String, dynamic> toJson() => {
    "ingredientname": ingredientname,
    "amount": amount,
    "amountType": amountType,
  };
}
