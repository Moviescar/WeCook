import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Recipe.dart';
import 'package:flutter_application_1/Providers/UserProvider.dart';
import 'package:provider/provider.dart';

import '../Models/Ingredient.dart';

class RecipeMaker extends StatefulWidget {
  RecipeMaker({Key? key}) : super(key: key);

  @override
  State<RecipeMaker> createState() => _RecipeMakerState();
}

class _RecipeMakerState extends State<RecipeMaker> {
  final recipeName = TextEditingController();
  final ingredientName = TextEditingController();
  final ingredientAmount = TextEditingController();
  var amountOfIngredients = 0;
  var amountOfSteps = 0;
  String ingredientType = "Gram";
  List<Ingredient> ingredients = [];
  List<Step> steps = [];

  var nameVisible = true;
  var ingredientVisible = false;
  var stepVisible = false;

  void toggleNameAndIngredient(){
    setState((){
      nameVisible = !nameVisible;
      ingredientVisible = !ingredientVisible;
    });
  }
  void toggleIngredientAndStep(){
    setState((){
      stepVisible = !stepVisible;
      ingredientVisible = !ingredientVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);


    var recipe = Recipe(userProvider.getUser().id);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
        'WeCook' ,style: TextStyle(
        fontSize: 40,
        color: Colors.orangeAccent,
        ),
      ),
      backgroundColor: Colors.white),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Expanded(
                child: Stack(
                  children: [
                    Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: nameVisible,
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
                            controller: recipeName,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Recipe Name',
                            ),
                          ),
                        const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: ingredientVisible,
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
                            controller: ingredientName,
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
                                  controller: ingredientAmount,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'amount',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              DropdownButton<String>(
                                value: ingredientType,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: const TextStyle(color: Colors.blueAccent),
                                underline: Container(
                                  height: 2,
                                  color: Colors.blueAccent,
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    ingredientType = value!;
                                  });
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
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(top: 20, bottom: 10),
                              height: 200,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: amountOfIngredients,
                                itemBuilder: (_,index) =>
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2.0,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey ,
                                                blurRadius: 2.0,
                                                offset: Offset(2.0,2.0)
                                            )
                                          ]
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/2,
                                            child: Text(ingredients[index].ingredientname,
                                              style: const TextStyle(fontSize: 16),
                                              maxLines: 2,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(ingredients[index].amount.toString(),
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(ingredients[index].amountType,
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                  ]
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: stepVisible,
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
                            controller: ingredientName,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Instruction',
                            ),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(top: 20, bottom: 10),
                              height: 200,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: amountOfSteps,
                                itemBuilder: (_,index) =>
                                    Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 20),
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 2.0,
                                                ),
                                                borderRadius: BorderRadius.circular(10.0),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Colors.grey ,
                                                      blurRadius: 2.0,
                                                      offset: Offset(2.0,2.0)
                                                  )
                                                ]
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context).size.width/2,
                                                  child: Text(ingredients[index].ingredientname,
                                                    style: const TextStyle(fontSize: 16),
                                                    maxLines: 2,
                                                  ),
                                                ),
                                                const Spacer(),
                                                Text(ingredients[index].amount.toString(),
                                                  style: const TextStyle(fontSize: 16),
                                                ),
                                                const SizedBox(width: 5),
                                                Text(ingredients[index].amountType,
                                                  style: const TextStyle(fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 20,),
                                        ]
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Stack(
                  children: [
                    Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: nameVisible,
                      child: Row(
                        children: [
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              toggleNameAndIngredient();
                              recipe.setRecipeName(recipeName.text);
                            },
                            child: const Text('Next Step'),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: ingredientVisible,
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              toggleNameAndIngredient();
                            },
                            child: const Text('Previous Step'),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                ingredients.add(Ingredient(ingredientName.text, int.parse(ingredientAmount.text), ingredientType));
                                amountOfIngredients = amountOfIngredients + 1;
                              });
                              ingredientName.text = "";
                              ingredientAmount.text = "";
                              FocusManager.instance.primaryFocus?.unfocus();

                            },
                            child: const Text('Add Ingredient'),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              toggleIngredientAndStep();
                            },
                            child: const Text('Next Step'),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: stepVisible,
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              toggleIngredientAndStep();
                            },
                            child: const Text('Previous Step'),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {

                            },
                            child: const Text('Next Step'),
                          ),
                        ],
                      ),
                    ),
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
