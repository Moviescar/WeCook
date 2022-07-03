import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/NewRecipeProvider.dart';
import 'InstructionElement.dart';

Visibility RecipeInstructionsView(BuildContext context) {
  NewRecipeProvider newRecipeProvider = Provider.of(context, listen: true);
  return Visibility(
    maintainSize: true,
    maintainAnimation: true,
    maintainState: true,
    visible: newRecipeProvider.stepVisible,
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
          style: TextStyle(height: 2.0),
          controller: newRecipeProvider.stepInstruction,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Instruction',
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: newRecipeProvider.amountOfSteps,
              itemBuilder: (_,index) =>
                  Column(
                      children: [
                        SizedBox(width: 20),
                        Container(
                          child: Column(
                            children: [
                              InstructionElement(context, index)
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,
                        ),
                      ]
                  ),
            ),
          ),
        ),
      ],
    ),
  );
}