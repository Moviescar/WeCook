import 'package:flutter/material.dart';
import 'package:flutter_application_1/BackendService.dart';
import 'package:flutter_application_1/Models/Recipe.dart';
import 'package:flutter_application_1/Models/User.dart';
import 'package:flutter_application_1/Models/UserAndRecipe.dart';
import 'package:provider/provider.dart';

import '../Providers/MyRecipeProvider.dart';
import '../Providers/RecipeListProvider.dart';
import '../Widgets/Header.dart';

class MyRecipeElement extends StatefulWidget {
  const MyRecipeElement({Key? key}) : super(key: key);

  @override
  State<MyRecipeElement> createState() => _MyRecipeElementState();
}

class _MyRecipeElementState extends State<MyRecipeElement> {
  late User currentUser;
  late Recipe currentRecipe;



  @override
  Widget build(BuildContext context) {
    RecipeListProvider recipeListProvider = Provider.of(context, listen: true);
    MyRecipeProvider myRecipeProvider = Provider.of(context, listen: true);
    var userAndRecipe = ModalRoute.of(context)!.settings.arguments as UserAndRecipe;
    userAndRecipe.recipe.step.sort((a, b) => a.stepNumber.compareTo(b.stepNumber));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Text(userAndRecipe.recipe.recipeName,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: const Text("Ingredients needed for the recipe.",
                              style: TextStyle(
                                color: Colors.orangeAccent,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: userAndRecipe.recipe.ingredient.length,
                              itemBuilder: (_,index) =>
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 8,
                                        child: Text(userAndRecipe.recipe.ingredient[index].ingredientName),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(userAndRecipe.recipe.ingredient[index].amount.toString()),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(userAndRecipe.recipe.ingredient[index].amountType),
                                      ),
                                    ],
                                  )
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: const Text("Instructions for the recipe.",
                              style: TextStyle(
                                color: Colors.orangeAccent,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: userAndRecipe.recipe.step.length,
                              itemBuilder: (_,index) =>
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text((userAndRecipe.recipe.step[index].stepNumber+1).toString()),
                                      ),
                                      Expanded(
                                        flex: 9,
                                        child: Text(userAndRecipe.recipe.step[index].instruction),
                                      ),
                                    ],
                                  )
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/recipeList');
                  },
                  child: const Text('Back'),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pushNamed(context, '/myRecipe');
                    BackendService backendService = BackendService(recipeListProvider, myRecipeProvider);
                    await backendService.delete(userAndRecipe.recipe.id, context);
                  },
                  child: const Text('Delete'),
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
