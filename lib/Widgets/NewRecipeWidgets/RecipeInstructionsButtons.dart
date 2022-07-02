import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/Instruction.dart';
import '../../Models/User.dart';
import '../../Providers/NewRecipeProvider.dart';
import '../../main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/SharedPrefs.dart';

getUserId() async{
  SharedPref sharedPref = SharedPref();
  String userPref = await sharedPref.read('user');
  int id = userFromJson(userPref).id;
  print(id);
  return id;
}

Visibility RecipeInstructionsButtons(BuildContext context){
  final read = context.read<NewRecipeProvider>();
  final watch = context.watch<NewRecipeProvider>();
  return Visibility(
    maintainSize: true,
    maintainAnimation: true,
    maintainState: true,
    visible: watch.stepVisible,
    child: Row(
      children: [
        ElevatedButton(
          onPressed: () {
            watch.toggleIngredientAndInstructions();
          },
          child: const Text('Previous Step'),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            read.addInstruction(Instruction(stepNumber: read.amountOfSteps, instruction:watch.stepInstruction.text));
            read.incrementAmountOfInstructions();
            read.stepInstruction.text = "";
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
                "recipeName": read.stepInstruction.text,
                "ingredients": read.ingredients,
                "steps": read.instructions
              }
              ),
            );
          },
          child: const Text('Next Step'),
        ),
      ],
    ),
  );
}
