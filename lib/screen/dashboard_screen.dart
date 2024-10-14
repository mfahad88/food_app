import 'package:flutter/material.dart';
import 'package:food_app/model/dto/dashboard/Categories.dart';
import 'package:food_app/provider/api_provider.dart';
import 'package:food_app/screen/meal_detail_screen.dart';
import 'package:food_app/screen/meal_list_screen.dart';
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
              child: Consumer<ApiProvider>(
                builder: (context, value, child) => value.isLoading? const Center(child: CircularProgressIndicator(),):SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Autocomplete<String>(
                         /* optionsViewBuilder: (context, onSelected, options)
                          => ListView.builder(
                            itemCount: options.toList().length,
                            itemBuilder: (context, index) => Container(
                              color: Colors.white,
                              child: GestureDetector(
                                onTap: () => onSelected(options.toList()[index]),
                                child: Row(
                                  children: [
                                    Image.network(provider.searchMeals?.where((element) => element.strMeal==options.toList()[index],).first.strMealThumb??"",width: 40,height: 40,fit: BoxFit.cover,),
                                    const Gap(5.0),
                                    Text(provider.searchMeals?.where((element) => element.strMeal==options.toList()[index],).first.strMeal??""),
                                    const Gap(5.0)
                                  ],
                                ),
                              ),
                            ),

                          ),*/
                          optionsBuilder: (textEditingValue) {
                          if(textEditingValue.text == '') {
                            return const Iterable.empty();
                          }else{
                            provider.fetchsearchMeals(textEditingValue.text);

                           return provider.searchMeals!.map((e) => e.strMeal!,).toList();
                          }
                        },
                        fieldViewBuilder: (context, textEditingController, focusNode, onSubmitted) {
                          return TextField(

                            controller: textEditingController,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MealDetailScreen(id: provider.searchMeals?.where((element) => element.strMeal==textEditingController.text,).first.idMeal),));

                              }, icon: const Icon(Icons.search)),
                              border: const OutlineInputBorder(),
                              hintText: 'Search any meal'
                            ),
                          );
                        },
                        onSelected: (option) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MealDetailScreen(id: provider.searchMeals?.where((element) => element.strMeal==option,).first.idMeal),)),
                        ),
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
                            itemCount: value.categories?.length??0,
                            itemBuilder: (context, index) => Padding(
                              padding: index<value.categories!.length?const EdgeInsets.only(right: 8.0):EdgeInsets.zero,
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MealListScreen(category: value.categories![index].strCategory!),)),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 50.0,
                                      backgroundColor: Colors.grey.shade300,
                                      child: Image.network(value.categories?[index].strCategoryThumb??"" ,width: 75, fit: BoxFit.fill,),
                                    ),
                                    Text(value.categories?[index].strCategory??"No name found",
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
                        ),
                        const Gap(20.0),
                        const Text('Top 10 Foods',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),),
                        const Gap(10.0),

                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10
                          ),
                          itemCount: provider.meals?.length??0,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MealDetailScreen(id: provider.meals?[index].idMeal??"0"),)),
                              child: Card(
                                color: Colors.grey.shade100,
                                elevation: 5.0,
                                child: LayoutBuilder(builder: (context, constraints) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0),topRight:Radius.circular(10.0) ),
                                        child: Image.network(provider.meals?[index].strMealThumb??"",width: constraints.maxWidth,height: constraints.maxHeight*0.7,fit: BoxFit.fill,)
                                    ),
                                    const Gap(5.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Text(provider.meals?[index].strMeal??"No name found",
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
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}
