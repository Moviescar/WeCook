class Ingredient {
  Ingredient({
    this.id,
    required this.ingredientName,
    required this.amount,
    required this.amountType,
  });

  int? id;
  String ingredientName;
  int amount;
  String amountType;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    id: json["id"],
    ingredientName: json["ingredientName"],
    amount: json["amount"],
    amountType: json["amountType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ingredientName": ingredientName,
    "amount": amount,
    "amountType": amountType,
  };
}