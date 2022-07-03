import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/ShowElement.dart';
import 'package:provider/provider.dart';

import '../../Models/Instruction.dart';
import '../../Models/User.dart';
import '../../Providers/NewRecipeProvider.dart';
import '../../Providers/RecipeListProvider.dart';
import '../../main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/SharedPrefs.dart';

getUserId() async{
  SharedPref sharedPref = SharedPref();
  String userPref = await sharedPref.read('user');
  int? id =  userFromJson(userPref).id;
  return id;
}

Visibility RecipeInstructionsButtons(BuildContext context){
  NewRecipeProvider newRecipeProvider = Provider.of(context, listen: false);
  RecipeListProvider recipeListProvider = Provider.of(context, listen: false);
  return Visibility(
    maintainSize: true,
    maintainAnimation: true,
    maintainState: true,
    visible: newRecipeProvider.stepVisible,
    child: Row(
      children: [
        ElevatedButton(
          onPressed: () {
            newRecipeProvider.toggleIngredientAndInstructions();
          },
          child: const Text('Previous Step'),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            newRecipeProvider.addInstruction(Instruction(stepNumber: newRecipeProvider.amountOfSteps, instruction:newRecipeProvider.stepInstruction.text));
            newRecipeProvider.incrementAmountOfInstructions();
            newRecipeProvider.addShowInstruction(ShowElement(TextOverflow.ellipsis, 3));
            newRecipeProvider.stepInstruction.text = "";
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: const Text('Add Instruction'),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () async {
            int ownerId = await getUserId();
            final response = await http.post(
              Uri.parse('${MyApp.urlPrefix}/recipe'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, dynamic>{
                "account": ownerId,
                "recipeName": newRecipeProvider.recipeName.text,
                "ingredient": newRecipeProvider.ingredients,
                "step": newRecipeProvider.instructions
              }
              ),
            );
            recipeListProvider.getAllUserRecipes();
            Navigator.pushNamed(context, '/recipeList');
          },
          child: const Text('Next Step'),
        ),
      ],
    ),
  );
}
