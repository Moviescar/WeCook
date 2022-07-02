import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/NewRecipeProvider.dart';
BoxDecoration myBoxDecoration() {
  return const BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.all(
        Radius.circular(5.0)
    ),
  );
}

Expanded IngredientElement(BuildContext context) {
  NewRecipeProvider newRecipeProvider = Provider.of(context, listen: false);
  return Expanded(
    child: Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: newRecipeProvider.amountOfIngredients,
        itemBuilder: (_,index) =>
        Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
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
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 9,
                      child: InkWell(
                        onTap: () {
                          newRecipeProvider.toggleShowIngredient(index);
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(newRecipeProvider.ingredients[index].ingredientName,
                                style: const TextStyle(fontSize: 16),
                                maxLines: newRecipeProvider.showIngredient[index].maxLines,
                                overflow: newRecipeProvider.showIngredient[index].overflow,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(newRecipeProvider.ingredients[index].amount.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(width: 5),
                            Text(newRecipeProvider.ingredients[index].amountType,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          newRecipeProvider.deleteIngredient(index);
                        },
                        child: Container(
                          constraints: const BoxConstraints(
                              minHeight: 55),
                          decoration: myBoxDecoration(),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ]
        ),
      ),
    ),
  );
}