import 'package:flutter/material.dart';
import 'package:food_app/provider/cart_provider.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../model/addCart/Cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(

        body: SafeArea(
          child: Consumer<CartProvider>(builder: (BuildContext context, CartProvider provider, Widget? child) {
            return ListView.separated(itemBuilder: (context, index) => Card(
              margin: const EdgeInsets.all(10.0),
              color: Colors.grey.shade200,
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(provider.cartList[index].meals!.strMealThumb!,width: 50,fit: BoxFit.fill,),
                    const Gap(10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(provider.cartList[index].meals!.strMeal!,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Gap(10),
                        Row(
                          children: [
                            GestureDetector(
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5.0)
                                ),
                                child: const Icon(Icons.remove,color: Colors.white,),
                              ),
                              onTap: () => provider.cartList[index].qty-=1,
                            ),
                            Consumer<CartProvider>(builder: (context, value1, child) => SizedBox(
                                width: 30,
                                height: 30,
                                child: Center(
                                    child: Text('${value1.cartList[index].qty}',
                                      style: const TextStyle(
                                          fontSize: 16
                                      ),
                                    )
                                )
                            ) ,),
                            GestureDetector(
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5.0)
                                ),
                                child: const Icon(Icons.add,color: Colors.white,),
                              ),
                              onTap: () => provider.cartList[index].qty+=1,
                            )
                          ],
                        )

                      ],
                    ),

                  ],
                ),
              ),
            ),
                separatorBuilder: (context, index) => const Gap(5.0), itemCount: provider.cartList.length);
          },

          ),
        ),
      ),
    );
  }
}
