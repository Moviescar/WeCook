import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/RecipeListProvider.dart';
import 'package:provider/provider.dart';

import '../Widgets/Header.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({Key? key}) : super(key: key);

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {

  @override
  Widget build(BuildContext context) {
    RecipeListProvider recipeListProvider = Provider.of(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: recipeListProvider.recipe.length,
            itemBuilder: (_,index) =>
            Column(
              children: [
                SizedBox(width: 20),
                Container(
                  child: InkWell(
                    child: Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
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
                                    child: Text(recipeListProvider.recipe[index].recipeName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
    );;
  }


}
