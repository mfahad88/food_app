import 'package:flutter/material.dart';
import 'package:food_app/model/dto/dashboard/Categories.dart';
import 'package:food_app/network/api_client.dart';

import '../model/dto/dashboard/Meals.dart';

class ApiProvider extends ChangeNotifier{
  List<Categories>? categories=List.empty(growable: true);
  List<Meals>? meals=List.empty(growable: true);
  Future<void> fetchCategory() async {

    categories=await ApiClient.fetchCategory();
    notifyListeners();
  }

  Future<void> fetchRandomFood() async {
    meals = await ApiClient.randomFood();
    notifyListeners();
  }
}