import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/ShowElement.dart';

import '../Models/Ingredient.dart';
import '../Models/Instruction.dart';
import '../SharedPrefs.dart';

class NewRecipeProvider with ChangeNotifier {
  final recipeName = TextEditingController();
  final ingredientName = TextEditingController();
  final ingredientAmount = TextEditingController();
  final stepInstruction = TextEditingController();

  var _amountOfIngredients = 0;
  var _amountOfSteps = 0;
  String _ingredientType = "Gram";
  List<Ingredient> _ingredients = [];
  List<Instruction> _instructions = [];
  List<ShowElement> _showInstruction = [];
  List<ShowElement> _showIngredient = [];


  var _nameVisible = true;
  var _ingredientVisible = false;
  var _stepVisible = false;

  SharedPref _sharedPref = SharedPref();

  get amountOfIngredients => _amountOfIngredients;

  set amountOfIngredients(value) {
    _amountOfIngredients = value;
    notifyListeners();
  }

  get amountOfSteps => _amountOfSteps;

  set amountOfSteps(value) {
    _amountOfSteps = value;
    notifyListeners();
  }

  String get ingredientType => _ingredientType;

  set ingredientType(String value) {
    _ingredientType = value;
    notifyListeners();
  }

  List<Ingredient> get ingredients => _ingredients;

  set ingredients(List<Ingredient> value) {
    _ingredients = value;
    notifyListeners();
  }

  List<Instruction> get instructions => _instructions;

  set instructions(List<Instruction> value) {
    _instructions = value;
    notifyListeners();
  }

  get nameVisible => _nameVisible;

  set nameVisible(value) {
    _nameVisible = value;
    notifyListeners();
  }

  get ingredientVisible => _ingredientVisible;

  set ingredientVisible(value) {
    _ingredientVisible = value;
    notifyListeners();
  }

  get stepVisible => _stepVisible;

  set stepVisible(value) {
    _stepVisible = value;
    notifyListeners();
  }

  SharedPref get sharedPref => _sharedPref;

  set sharedPref(SharedPref value) {
    _sharedPref = value;
    notifyListeners();
  }

  List<ShowElement> get showInstruction => _showInstruction;
  List<ShowElement> get showIngredient => _showIngredient;

  addIngredient(Ingredient value) {
    _ingredients.add(value);
    notifyListeners();
  }

  addInstruction(Instruction value) {
    _instructions.add(value);
    notifyListeners();
  }

  incrementAmountOfIngredients(){
    _amountOfIngredients++;
    notifyListeners();
  }
  incrementAmountOfInstructions(){
    _amountOfSteps++;
    notifyListeners();
  }

  void toggleNameAndIngredients(){
    nameVisible = !nameVisible;
    ingredientVisible = !ingredientVisible;
    notifyListeners();
  }
  void toggleIngredientAndInstructions(){
    _stepVisible = !_stepVisible;
    _ingredientVisible = !_ingredientVisible;
    notifyListeners();
  }

  void deleteInstruction(int index){
    _instructions.remove(_instructions[index]);
    _amountOfSteps--;
    notifyListeners();
  }

  void deleteIngredient(int index){
    _ingredients.remove(_ingredients[index]);
    _amountOfIngredients--;
    notifyListeners();
  }
  void addShowInstruction(ShowElement value){
    _showInstruction.add(value);
    notifyListeners();
  }

  void addShowIngredient(ShowElement value){
    _showIngredient.add(value);
    notifyListeners();
  }
  void toggleShowInstruction(int index){
    toggleShow(_showInstruction, index);
    notifyListeners();
  }

  void toggleShowIngredient(int index){
    toggleShow(_showIngredient, index);
    notifyListeners();
  }
  
  void toggleShow(List<ShowElement> list, index){
    if(list[index].maxLines == 2){
      list[index].maxLines = null;
      list[index].overflow = null;
    }else{
      list[index].maxLines = 2;
      list[index].overflow = TextOverflow.ellipsis;
    }
  }

  resetControllers(){
    recipeName.text = "";
    ingredientAmount.text = "";
    ingredientName.text = "";
    stepInstruction.text = "";
  }

  resetLists(){
    _ingredients = [];
    _instructions = [];
    _showInstruction = [];
    _showIngredient = [];
    _amountOfIngredients = 0;
    _amountOfSteps = 0;
  }

  resetNewRecipe(){
    resetControllers();
    resetLists();
    toggleIngredientAndInstructions();
    toggleNameAndIngredients();
  }

}