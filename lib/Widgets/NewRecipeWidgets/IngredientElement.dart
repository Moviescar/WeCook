import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/NewRecipeProvider.dart';

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
                          child: Text(newRecipeProvider.ingredients[index].ingredientname,
                            style: const TextStyle(fontSize: 16),
                            maxLines: 2,
                          ),
                        ),
                        const Spacer(),
                        Text(newRecipeProvider.ingredients[index].amount.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(width: 5),
                        Text(newRecipeProvider.ingredients[index].amountType,
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
  );
}