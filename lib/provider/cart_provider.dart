import 'package:flutter/material.dart';

import '../model/addCart/Cart.dart';
import '../model/dto/dashboard/Meals.dart';

class CartProvider extends ChangeNotifier{

  List<Cart> cartList=List.empty();

  void addToCart(Cart cart){
    final exists=cartList.firstWhere((element) => element.meals!.idMeal==cart.meals!.idMeal,orElse: null);
    if(exists!=null){
      exists.qty+=cart.qty;
    }else{
      cartList.add(cart);
    }
  }
}