import 'Meals.dart';

/// meals : [{"idMeal":"53050","strMeal":"Ayam Percik","strDrinkAlternate":null,"strCategory":"Chicken","strArea":"Malaysian","strInstructions":"In a blender, add the ingredients for the spice paste and blend until smooth.\r\nOver medium heat, pour the spice paste in a skillet or pan and fry for 10 minutes until fragrant. Add water or oil 1 tablespoon at a time if the paste becomes too dry. Don't burn the paste. Lower the fire slightly if needed.\r\nAdd the cloves, cardamom, tamarind pulp, coconut milk, water, sugar and salt. Turn the heat up and bring the mixture to boil. Turn the heat to medium low and simmer for 10 minutes. Stir occasionally. It will reduce slightly. This is the marinade/sauce, so taste and adjust seasoning if necessary. Don't worry if it's slightly bitter. It will go away when roasting.\r\nWhen the marinade/sauce has cooled, pour everything over the chicken and marinate overnight to two days.\r\nPreheat the oven to 425 F.\r\nRemove the chicken from the marinade. Spoon the marinade onto a greased (or aluminum lined) baking sheet. Lay the chicken on top of the sauce (make sure the chicken covers the sauce and the sauce isn't exposed or it'll burn) and spread the remaining marinade on the chicken. Roast for 35-45 minutes or until internal temp of the thickest part of chicken is at least 175 F.\r\nLet chicken rest for 5 minutes. Brush the chicken with some of the oil. Serve chicken with the sauce over steamed rice (or coconut rice).","strMealThumb":"https://www.themealdb.com/images/media/meals/020z181619788503.jpg","strTags":null,"strYoutube":"https://www.youtube.com/watch?v=9ytR28QK6I8","strIngredient1":"Chicken Thighs","strIngredient2":"Challots","strIngredient3":"Ginger","strIngredient4":"Garlic Clove","strIngredient5":"Cayenne Pepper","strIngredient6":"Turmeric","strIngredient7":"Cumin","strIngredient8":"Coriander","strIngredient9":"Fennel","strIngredient10":"Tamarind Paste","strIngredient11":"Coconut Milk","strIngredient12":"Sugar","strIngredient13":"Water","strIngredient14":"","strIngredient15":"","strIngredient16":"","strIngredient17":"","strIngredient18":"","strIngredient19":"","strIngredient20":"","strMeasure1":"6","strMeasure2":"16","strMeasure3":"1 1/2 ","strMeasure4":"6","strMeasure5":"8","strMeasure6":"2 tbs","strMeasure7":"1 1/2 ","strMeasure8":"1 1/2 ","strMeasure9":"1 1/2 ","strMeasure10":"2 tbs","strMeasure11":"1 can ","strMeasure12":"1 tsp ","strMeasure13":"1 cup ","strMeasure14":" ","strMeasure15":" ","strMeasure16":" ","strMeasure17":" ","strMeasure18":" ","strMeasure19":" ","strMeasure20":" ","strSource":"http://www.curiousnut.com/roasted-spiced-chicken-ayam-percik/","strImageSource":null,"strCreativeCommonsConfirmed":null,"dateModified":null}]

class RandomFood {
  RandomFood({
      List<Meals>? meals,}){
    _meals = meals;
}

  RandomFood.fromJson(dynamic json) {
    if (json['meals'] != null) {
      _meals = [];
      json['meals'].forEach((v) {
        _meals?.add(Meals.fromJson(v));
      });
    }
  }
  List<Meals>? _meals;

  List<Meals>? get meals => _meals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meals != null) {
      map['meals'] = _meals?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}