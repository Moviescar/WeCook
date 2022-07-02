import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/NewRecipeProvider.dart';
import 'IngredientElement.dart';

Visibility RecipeIngredientsView(BuildContext context) {
  NewRecipeProvider newRecipeProvider = Provider.of(context, listen: false);
  return Visibility(
    maintainSize: true,
    maintainAnimation: true,
    maintainState: true,
    visible: newRecipeProvider.ingredientVisible,
    child: Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          'Recipe Creator' ,style: TextStyle(
          fontSize: 24,
          color: Colors.orangeAccent,
        ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: newRecipeProvider.ingredientName,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Ingredient Name',
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            SizedBox(
              width: 270.0,
              child: TextField(
                controller: newRecipeProvider.ingredientAmount,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'amount',
                ),
              ),
            ),
            const SizedBox(width: 20),
            DropdownButton<String>(
              value: newRecipeProvider.ingredientType,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.blueAccent),
              underline: Container(
                height: 2,
                color: Colors.blueAccent,
              ),
              onChanged: (String? value) {
                newRecipeProvider.ingredientType = value!;
              },
              items: <String>['KG', 'Gram', 'Liter', 'CL', 'ML']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
        IngredientElement(context),
      ],
    ),
  );
}

