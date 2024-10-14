import 'package:flutter/material.dart';
import 'package:food_app/model/dto/dashboard/Categories.dart';
import 'package:food_app/network/api_client.dart';

import '../model/dto/category/Meals.dart';
import '../model/dto/dashboard/Meals.dart';

class ApiProvider extends ChangeNotifier{
  bool _isLoading=false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  List<Categories>? categories=List.empty(growable: true);
  List<Meals>? meals=List.empty(growable: true);
  List<Meals>? searchMeals=List.empty(growable: true);
  List<Meals>? mealById= List.empty(growable: true);
  List<Meal>? categoryMeal=List.empty(growable: true);
  Future<void> fetchCategory() async {

    categories=await ApiClient.fetchCategory();
    notifyListeners();
  }

  Future<void> fetchRandomFood() async {
    try {
      _isLoading=true;
      meals = await ApiClient.randomFood();
    }catch(e){
      _isLoading=false;
      throw Exception(e);
    }
    _isLoading=false;
    notifyListeners();
  }

  Future<void> fetchsearchMeals(String query) async {
    searchMeals = await ApiClient.searchMeal(query);
    notifyListeners();
  }

  Future<void> fetchmealById(String id) async {
    _isLoading=true;
    mealById = await ApiClient.searchMealById(id);
    _isLoading=false;
    notifyListeners();
  }

  Future<void> fetchmealByCategory(String category) async {
    _isLoading=true;
    categoryMeal = await ApiClient.searchMealByCategory(category);
    _isLoading=false;
    notifyListeners();
  }
}