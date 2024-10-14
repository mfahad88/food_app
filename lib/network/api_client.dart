import 'dart:async';
import 'dart:convert';
import 'package:food_app/model/dto/category/MealCategory.dart';
import 'package:food_app/model/dto/dashboard/Meals.dart';
import 'package:food_app/model/dto/dashboard/Categories.dart';
import 'package:food_app/model/dto/dashboard/FoodCategory.dart';
import 'package:food_app/model/dto/dashboard/RandomFood.dart';
import 'package:food_app/model/dto/dashboard/SearchMeal.dart';
import 'package:http/http.dart' as http;

import '../model/dto/category/Meals.dart';
import '../model/dto/dashboard/Meals.dart';
class ApiClient{
  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';
  static Future<List<Categories>?> fetchCategory() async{
    final response = await http.get(Uri.parse('$_baseUrl/categories.php'));
    print('------------------------Request------------------------');
    print(response.request.toString());
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      print(body);
      print('------------------------Request------------------------');
      return FoodCategory.fromJson(body).categories;

    } else {

      throw Exception('Failed to load Indices');
    }
  }

  static Future<List<Meals>> randomFood() async{
    final apiCalls=List.generate(10, (index) => http.get(Uri.parse('$_baseUrl/random.php')),);
    final responses = await Future.wait(apiCalls);
    List<Meals>? meals=List.empty(growable: true);
    responses.forEach((element) {
      final data=json.decode(element.body);
      meals.addAll(RandomFood.fromJson(data).meals!.toList());
    },);
    return meals;
  }

  static Future<List<Meals>?> searchMeal(String query) async {
    final response= await http.get(Uri.parse('$_baseUrl/search.php?s=$query'));
    final data=json.decode(response.body);
    print('------------------------Request------------------------');
    print(response.request.toString());
    if(response.statusCode == 200){
      print(data);
      print('------------------------Request------------------------');
      return SearchMeal.fromJson(data).meals;
    }else{
      throw Exception(response.body);
    }
  }

  static Future<List<Meals>?> searchMealById(String query) async {
    final response= await http.get(Uri.parse('$_baseUrl/lookup.php?i=$query'));
    final data=json.decode(response.body);
    print('------------------------Request------------------------');
    print(response.request.toString());

    if(response.statusCode == 200){
      print(data);
      print('------------------------Request------------------------');
      return SearchMeal.fromJson(data).meals;
    }else{
      throw Exception(response.body);
    }
  }

  static Future<List<Meal>?> searchMealByCategory(String query) async {
    final response= await http.get(Uri.parse('$_baseUrl/filter.php?c=$query'));
    final data=json.decode(response.body);
    print('------------------------Request------------------------');
    print(response.request.toString());

    if(response.statusCode == 200){
      print(data);
      print('------------------------Request------------------------');
      return MealCategory.fromJson(data).meals;
    }else{
      throw Exception(response.body);
    }
  }
}