import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/Models/User.dart';

class MyRecipeProvider with ChangeNotifier{

  late User _user;

  var _searchInput= "";

  User get user => _user;

  set user(User value) {
    _user = value;
  }
  get searchInput => _searchInput;

  updateSearchInput(String newInput){
    _searchInput = newInput;
    notifyListeners();
  }


}