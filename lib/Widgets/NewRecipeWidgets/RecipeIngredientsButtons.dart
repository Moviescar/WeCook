import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/Ingredient.dart';
import '../../Providers/NewRecipeProvider.dart';

Visibility RecipeIngredientsButtons(BuildContext context) {
  NewRecipeProvider newRecipeProvider = Provider.of(context, listen: false);
  return Visibility(
    maintainSize: true,
    maintainAnimation: true,
    maintainState: true,
    visible: newRecipeProvider.ingredientVisible,
    child: Row(
      children: [
        ElevatedButton(
          onPressed: () {
            newRecipeProvider.toggleNameAndIngredients();
          },
          child: const Text('Previous Step'),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            newRecipeProvider.addIngredient(
                Ingredient(ingredientname: newRecipeProvider.ingredientName.text,amount: int.parse(newRecipeProvider.ingredientAmount.text),amountType: newRecipeProvider.ingredientType)
            );
            newRecipeProvider.incrementAmountOfIngredients();
            newRecipeProvider.ingredientName.text = "";
            newRecipeProvider.ingredientAmount.text = "";
            FocusManager.instance.primaryFocus?.unfocus();

          },
          child: const Text('Add Ingredient'),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            newRecipeProvider.toggleIngredientAndInstructions();
          },
          child: const Text('Next Step'),
        ),
      ],
    ),
  );
}