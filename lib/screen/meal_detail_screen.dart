import 'package:flutter/material.dart';
import 'package:food_app/model/addCart/Cart.dart';
import 'package:food_app/provider/api_provider.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class MealDetailScreen extends StatelessWidget {
  final String? id;
  const MealDetailScreen({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    ApiProvider provider=Provider.of(context,listen: false);
    provider.fetchmealById(id??"0");

    CartProvider cartProvider = Provider.of(context,listen: false);

    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back ,color: Colors.white,)),
        ),
        body:Consumer<ApiProvider>(
          builder: (context, value, child) =>  value.isLoading?const Center(child: CircularProgressIndicator(),):Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: SingleChildScrollView(

                  child: Column(

                    mainAxisSize: MainAxisSize.max,
                    children: [

                      Image.network(value.mealById!.first.strMealThumb!),

                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0,bottom: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(10.0),
                            Text(value.mealById!.first.strMeal!,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            const Gap(5.0),
                            Text(value.mealById!.first.strInstructions!,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600
                              ),
                            ),
                            const Gap(10),


                            Row(
                              mainAxisSize: MainAxisSize.max,

                              children: [
                                GestureDetector(
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5.0)
                                    ),
                                    child: const Icon(Icons.remove,color: Colors.white,),
                                  ),
                                  onTap: () => cartProvider.removeQty(1),
                                ),
                               Consumer<CartProvider>(builder: (context, value1, child) => SizedBox(
                                   width: 40,
                                   height: 40,
                                   child: Center(
                                       child: Text('${value1.qty}',
                                         style: const TextStyle(
                                             fontSize: 16
                                         ),
                                       )
                                   )
                               ) ,),
                                GestureDetector(
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5.0)
                                    ),
                                    child: const Icon(Icons.add,color: Colors.white,),
                                  ),
                                  onTap: () => cartProvider.addQty(1),
                                ),
                                const Spacer(),
                                FilledButton(
                                  onPressed: () => cartProvider.addToCart(Cart(value.mealById!.first, cartProvider.qty)),
                                  style: FilledButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0)
                                      )
                                  ),
                                  child: const Text('Add to Cart',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white
                                    ),
                                  ),
                                )
                              ],
                            )

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
