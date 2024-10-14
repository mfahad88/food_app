import 'package:flutter/material.dart';
import 'package:food_app/provider/api_provider.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import 'meal_detail_screen.dart';

class MealListScreen extends StatelessWidget {
  final String category;
  const MealListScreen({super.key,required this.category});

  @override
  Widget build(BuildContext context) {
    ApiProvider provider=Provider.of(context,listen: false);
    provider.fetchmealByCategory(category);
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Consumer<ApiProvider>(
            builder: (BuildContext context, ApiProvider value, Widget? child) {
              return value.isLoading?const Center(child: CircularProgressIndicator()):SingleChildScrollView(
                child: Column(
                
                  children: [
                    Gap(10.0),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(category,
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.orangeAccent.shade200,
                            decorationThickness:3.0,
                          decorationStyle: TextDecorationStyle.dashed
                        ),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10
                      ),
                      itemCount: provider.categoryMeal?.length??0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MealDetailScreen(id: provider.categoryMeal?[index].idMeal??"0"),)),
                          child: Card(
                            color: Colors.grey.shade100,
                            elevation: 5.0,
                            child: LayoutBuilder(builder: (context, constraints) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0),topRight:Radius.circular(10.0) ),
                                    child: Image.network(provider.categoryMeal?[index].strMealThumb??"",width: constraints.maxWidth,height: constraints.maxHeight*0.7,fit: BoxFit.fill,)
                                ),
                                const Gap(5.0),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(provider.categoryMeal?[index].strMeal??"No name found",
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              );
            },
          
          ),
        )
      ),
    );
  }
}
