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

Widget InstructionElement(BuildContext context, index) {
  NewRecipeProvider newRecipeProvider = Provider.of(context, listen: true);

  return InkWell(
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
                    newRecipeProvider.toggleShowInstruction(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(newRecipeProvider.instructions[index].instruction,
                        maxLines: newRecipeProvider.showInstruction[index].maxLines,
                        overflow: newRecipeProvider.showInstruction[index].overflow,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    newRecipeProvider.deleteInstruction(index);
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
    );
}