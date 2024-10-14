import 'package:flutter/material.dart';
import 'package:food_app/screen/signin_screen.dart';
import 'package:food_app/screen/signup_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Sign-In',),
                Tab(text: 'Sign-Up',),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              SigninScreen(),
              SignupScreen()
            ],
          ),
        ),
      ),
    );
  }
}
