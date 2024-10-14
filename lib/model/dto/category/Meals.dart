/// strMeal : "Baked salmon with fennel & tomatoes"
/// strMealThumb : "https://www.themealdb.com/images/media/meals/1548772327.jpg"
/// idMeal : "52959"

class Meal {
  Meal({
      String? strMeal, 
      String? strMealThumb, 
      String? idMeal,}){
    _strMeal = strMeal;
    _strMealThumb = strMealThumb;
    _idMeal = idMeal;
}

  Meal.fromJson(dynamic json) {
    _strMeal = json['strMeal'];
    _strMealThumb = json['strMealThumb'];
    _idMeal = json['idMeal'];
  }
  String? _strMeal;
  String? _strMealThumb;
  String? _idMeal;

  String? get strMeal => _strMeal;
  String? get strMealThumb => _strMealThumb;
  String? get idMeal => _idMeal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['strMeal'] = _strMeal;
    map['strMealThumb'] = _strMealThumb;
    map['idMeal'] = _idMeal;
    return map;
  }

}