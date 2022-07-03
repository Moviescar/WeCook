

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/NewRecipeProvider.dart';
import 'package:flutter_application_1/SharedPrefs.dart';
import 'package:flutter_application_1/Widgets/Header.dart';
import 'package:provider/provider.dart';
import '../Widgets/NewRecipeWidgets/RecipeIngredientsButtons.dart';
import '../Widgets/NewRecipeWidgets/RecipeIngredientsView.dart';
import '../Widgets/NewRecipeWidgets/RecipeInstructionsButtons.dart';
import '../Widgets/NewRecipeWidgets/RecipeInstructionsView.dart';
import '../Widgets/NewRecipeWidgets/RecipeNameButtons.dart';
import '../Widgets/NewRecipeWidgets/RecipeNameView.dart';


class RecipeMaker extends StatefulWidget {

  RecipeMaker({Key? key}) : super(key: key);

  @override
  State<RecipeMaker> createState() => _RecipeMakerState();
}

class _RecipeMakerState extends State<RecipeMaker> {
  SharedPref sharedPref = SharedPref();

  BoxDecoration myBoxDecoration() {
    return const BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.all(
          Radius.circular(5.0) //         <--- border radius here
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Expanded(
                child: Stack(
                  children: [
                    RecipeNameView(context),
                    RecipeIngredientsView(context),
                    RecipeInstructionsView(context),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Stack(
                  children: [
                    RecipeNameButtons(context),
                    RecipeIngredientsButtons(context),
                    RecipeInstructionsButtons(context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}