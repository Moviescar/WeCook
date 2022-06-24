
import 'Step.dart';
import 'Ingredient.dart';

class Recipe {
  late final int ownerId;
  late final String recipeName;
  late final List<Ingredient> ingredients;
  late final List<Step> steps;

  Recipe(
      this.ownerId,
      );

  setRecipeName(recipeName){
    this.recipeName = recipeName;
  }
  setIngredients(ingredients){
    this.ingredients = ingredients;
  }
  setSteps(steps){
    this.steps = steps;
  }
}