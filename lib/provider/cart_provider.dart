import 'package:flutter/material.dart';

import '../model/addCart/Cart.dart';
import '../model/dto/dashboard/Meals.dart';

class CartProvider extends ChangeNotifier{

  List<Cart> cartList=[];

  int qty=0;

  void addQty(int value){
    qty+=value;
    notifyListeners();
  }

  void removeQty(int value){
    if(qty>0) {
      qty -= value;
      notifyListeners();
    }
  }



  void addToCart(Cart cart){
    if(cartList.isNotEmpty){
      int index=cartList.indexWhere((element) => element.meals!.idMeal==cart.meals!.idMeal,);
      if(index!=-1){
        cartList[index].qty+=cart.qty;
      }else{
        cartList.add(cart);
      }

    }else{
      cartList.add(cart);
    }
    qty=0;
    notifyListeners();
  }


}