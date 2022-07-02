import 'dart:convert';

Ingredient ingredientFromJson(String str) => Ingredient.fromJson(json.decode(str));

String ingredientToJson(Ingredient data) => json.encode(data.toJson());

class Ingredient {
  Ingredient({
    required this.ingredientName,
    required this.amount,
    required this.amountType,
  });

  String ingredientName;
  int amount;
  String amountType;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    ingredientName: json["ingredientName"],
    amount: json["amount"],
    amountType: json["amountType"],
  );

  Map<String, dynamic> toJson() => {
    "ingredientName": ingredientName,
    "amount": amount,
    "amountType": amountType,
  };
}
