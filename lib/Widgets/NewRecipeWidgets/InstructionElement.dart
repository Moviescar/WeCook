import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/NewRecipeProvider.dart';

BoxDecoration myBoxDecoration() {
  return const BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.all(
        Radius.circular(5.0) //         <--- border radius here
    ),
  );
}

Widget InstructionElement(BuildContext context, index) {
  NewRecipeProvider newRecipeProvider = Provider.of(context, listen: false);
  return InkWell(
    onTap: () {
      newRecipeProvider.toggleElementVisible();
    },
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
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(newRecipeProvider.instructions[index].instruction,
                  maxLines: newRecipeProvider.maxlines,
                  overflow: newRecipeProvider.overflow,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                constraints: BoxConstraints(
                    minHeight: 55),
                decoration: myBoxDecoration(),
                width: 30,
                child: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}