import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/NewRecipeProvider.dart';

Visibility RecipeNameView(BuildContext context) {
  NewRecipeProvider newRecipeProvider = Provider.of(context, listen: false);
  return Visibility(
    maintainSize: true,
    maintainAnimation: true,
    maintainState: true,
    visible: newRecipeProvider.nameVisible,
    child: Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          'Recipe Creator' ,style: TextStyle(
          fontSize: 24,
          color: Colors.orangeAccent,
        ),
        ),
        SizedBox(height: 20),
        TextField(
          controller: newRecipeProvider.recipeName,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Recipe Name',
          ),
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}