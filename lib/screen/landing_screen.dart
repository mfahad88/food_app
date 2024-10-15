import 'package:flutter/material.dart';
import 'package:food_app/provider/home_provider.dart';
import 'package:food_app/screen/cart_screen.dart';
import 'package:food_app/screen/dashboard_screen.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer<HomeProvider>(builder: (BuildContext context, HomeProvider provider, Widget? child) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
            ],
            currentIndex: provider.selectedIndex,
            onTap: (value) {

              provider.selectedIndex=value;
            },
          ),
          body: Container(
            child: Builder(builder: (context) {
              print(provider.selectedIndex);
              if(provider.selectedIndex==0){
                return DashboardScreen();
              }else if(provider.selectedIndex==1){
                return CartScreen();
            }else{
                return Text('Not found');
              }
            },),
          ),
        );
      },),
    );
  }
}
