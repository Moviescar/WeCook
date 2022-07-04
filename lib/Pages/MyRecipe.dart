import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/UserAndRecipe.dart';
import '../Providers/MyRecipeProvider.dart';
import '../Widgets/Header.dart';

class MyRecipe extends StatelessWidget {
  MyRecipe({Key? key}) : super(key: key);

  TextEditingController searchInput = TextEditingController(text: "");

  BoxDecoration myBoxDecoration() {
    return const BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.all(
          Radius.circular(5.0)
      ),
    );
  }

  getUserAndRecipe(int? id, MyRecipeProvider myRecipeProvider){
    for(var recipe in myRecipeProvider.user.recipe){
      if(recipe.id == id){
        return UserAndRecipe(myRecipeProvider.user, recipe);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    MyRecipeProvider myRecipeProvider = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 100,
                padding: EdgeInsets.only(top: 30),
                child: const Text("Recipe's made by you",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.orangeAccent
                  ),
                ),
              ),
              TextField(
                controller: searchInput,
                onSubmitted: (String value) {
                  myRecipeProvider.updateSearchInput(value);
                },
                enableSuggestions: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search ',
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: myRecipeProvider.user.recipe.length,
                  itemBuilder: (_,index) =>
                      Visibility(
                        visible: myRecipeProvider.user.recipe[index].recipeName.contains(myRecipeProvider.searchInput),
                        child: Column(
                            children: [
                              SizedBox(width: 20),
                              Container(
                                constraints: BoxConstraints(
                                    minHeight: 55, minWidth: double.infinity, maxHeight: 400),
                                child: InkWell(
                                  child: Card(
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                    elevation: 2,
                                    child: IntrinsicHeight(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 4,
                                            child: InkWell(
                                              onTap: () {

                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 15),
                                                child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(myRecipeProvider.user.recipe[index].recipeName,
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      SizedBox(height: 20),
                                                      Text("${myRecipeProvider.user.recipe[index].ingredient.length} ingredients needed",
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      Text("${myRecipeProvider.user.recipe[index].step.length} Instructions",
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 80,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(context, '/myRecipeElement', arguments: getUserAndRecipe(myRecipeProvider.user.recipe[index].id, myRecipeProvider));
                                              },
                                              child: Container(
                                                constraints: const BoxConstraints(
                                                    minHeight: 55),
                                                decoration: myBoxDecoration(),
                                                child: const Icon(
                                                  Icons.navigate_next,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,
                              ),
                            ]
                        ),
                      ),
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/recipeList');
                    },
                    child: const Text("Community Recipe's"),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/newRecipe');
                    },
                    child: const Text('New Recipe'),
                  ),
                ],
              ),
              SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
