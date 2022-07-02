import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/NewRecipeProvider.dart';

Visibility RecipeNameButtons(BuildContext context) {
  NewRecipeProvider newRecipeProvider = Provider.of(context, listen: false);
  return Visibility(
    maintainSize: true,
    maintainAnimation: true,
    maintainState: true,
    visible: newRecipeProvider.nameVisible,
    child: Row(
      children: [
        Spacer(),
        ElevatedButton(
          onPressed: () {
            newRecipeProvider.toggleNameAndIngredients();
          },
          child: const Text('Next Step'),
        ),
      ],
    ),
  );
}