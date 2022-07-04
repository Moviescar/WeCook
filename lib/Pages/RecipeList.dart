import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/User.dart';
import 'package:flutter_application_1/Models/UserAndRecipe.dart';
import 'package:flutter_application_1/Providers/MyRecipeProvider.dart';
import 'package:flutter_application_1/Providers/RecipeListProvider.dart';
import 'package:flutter_application_1/SharedPrefs.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/Header.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({Key? key}) : super(key: key);

  @override
  State<RecipeList> createState() => _RecipeListState();
}


BoxDecoration myBoxDecoration() {
  return const BoxDecoration(
    color: Colors.blueAccent,
    borderRadius: BorderRadius.all(
        Radius.circular(5.0)
    ),
  );
}

class _RecipeListState extends State<RecipeList> {

  TextEditingController searchInput = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    RecipeListProvider recipeListProvider = Provider.of(context, listen: true);
    MyRecipeProvider myRecipeProvider = Provider.of(context, listen: false);
    SharedPref sharedPref = SharedPref();

    getUserAndRecipe(int? id){
      var users = recipeListProvider.users;
      for (var user in users){
        for(var recipe in user.recipe){
          if(recipe.id == id){
            return UserAndRecipe(user, recipe);
          }
        }
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Visibility(
                visible: MediaQuery.of(context).orientation == Orientation.portrait,
                child: Container(
                  height: 100,
                  padding: EdgeInsets.only(top: 30),
                  child: const Text("Recipe's made by the community",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.orangeAccent
                    ),
                  ),
                ),
              ),
              TextField(
                controller: searchInput,
                onSubmitted: (String value) {
                  recipeListProvider.updateSearchInput(value);
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
                  itemCount: recipeListProvider.recipe.length,
                  itemBuilder: (_,index) =>
                  Visibility(
                    visible: recipeListProvider.recipe[index].recipeName != '' &&
                        recipeListProvider.recipe[index].ingredient.isNotEmpty  &&
                        recipeListProvider.recipe[index].step.isNotEmpty && (
                        recipeListProvider.recipe[index].recipeName.contains(recipeListProvider.searchInput) || recipeListProvider.searchInput == ""),
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
                                                  Text(recipeListProvider.recipe[index].recipeName,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  SizedBox(height: 20),
                                                  Text("${recipeListProvider.recipe[index].ingredient.length} ingredients needed",
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text("${recipeListProvider.recipe[index].step.length} Instructions",
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
                                          Navigator.pushNamed(context, '/recipeElement', arguments: getUserAndRecipe(recipeListProvider.recipe[index].id));
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
                    onPressed: () async {
                      myRecipeProvider.user = userFromJson(await sharedPref.read("user"));
                      Navigator.pushNamed(context, '/myRecipe');
                    },
                    child: const Text("My Recipe's"),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      SharedPreferences preferences = await SharedPreferences.getInstance();
                      await preferences.clear();
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text("Logout"),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      myRecipeProvider.user = userFromJson(await sharedPref.read("user"));
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
