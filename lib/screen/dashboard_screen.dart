import 'package:flutter/material.dart';
import 'package:food_app/model/dto/dashboard/Categories.dart';
import 'package:food_app/provider/api_provider.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../model/dto/dashboard/Meals.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiProvider provider = Provider.of(context,listen: false);
    provider.fetchCategory();
    provider.fetchRandomFood();
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(20.0),
                    const Text('Categories',style: TextStyle(
                      fontSize: 24,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                    const Gap(10.0),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.categories?.length??0,
                        itemBuilder: (context, index) => Padding(
                          padding: index<provider.categories!.length?const EdgeInsets.only(right: 8.0):EdgeInsets.zero,
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 50.0,
                                backgroundColor: Colors.grey.shade100,
                                child: Image.network(provider.categories?[index].strCategoryThumb??"" , fit: BoxFit.cover,),
                              ),
                              Text(provider.categories?[index].strCategory??"No name found",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black45
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Gap(20.0),
                    const Text('Top Foods',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),),
                    const Gap(10.0),

                   SizedBox(
                     height: 120,
                     child: Expanded(
                       child: GridView.builder(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100.0,mainAxisExtent: 100.0),
                         itemCount: provider.meals?.length??0,
                         itemBuilder: (context, index) {
                           return Card(
                             color: Colors.grey.shade100,
                             elevation: 5.0,
                             child: Column(
                                  children: [
                                    Image.network(provider.meals?[index].strMealThumb??"",width: 70,height: 70,fit: BoxFit.cover,),
                                    Gap(5.0),
                                    Text(provider.meals?[index].strMeal??"No name found")
                                  ],
                             ),
                           );
                         },),
                     ),
                   )

                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
