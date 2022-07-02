import 'package:flutter/material.dart';

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


  var _nameVisible = true;
  var _ingredientVisible = false;
  var _stepVisible = false;

  SharedPref _sharedPref = SharedPref();

  var _visible = false;
  int? _maxlines = 3;
  TextOverflow? _overflow = TextOverflow.ellipsis;

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

  get visible => _visible;

  set visible(value) {
    _visible = value;
    notifyListeners();
  }

  int? get maxlines => _maxlines;

  set maxlines(int? value) {
    _maxlines = value;
    notifyListeners();
  }

  TextOverflow? get overflow => _overflow;

  set overflow(TextOverflow? value) {
    _overflow = value;
    notifyListeners();
  }

  addIngredient(Ingredient value) {
    _ingredients.add(value);
    notifyListeners();
  }

  addInstruction(Instruction value) {
    _instructions.add(value);
    notifyListeners();
  }

  incrementAmountOfIngredients(){
    amountOfIngredients++;
    notifyListeners();
  }
  incrementAmountOfInstructions(){
    amountOfSteps++;
    notifyListeners();
  }

  void toggleNameAndIngredients(){
    nameVisible = !nameVisible;
    ingredientVisible = !ingredientVisible;
    notifyListeners();
  }
  void toggleIngredientAndInstructions(){
    stepVisible = !stepVisible;
    ingredientVisible = !ingredientVisible;
    notifyListeners();
  }
  void toggleElementVisible(){
    _visible = !_visible;
    if(visible){
      maxlines = 3;
      overflow = TextOverflow.ellipsis;
    }else{
      maxlines = null;
      overflow = null;
    }
    notifyListeners();
  }
}