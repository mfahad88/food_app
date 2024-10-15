import 'package:flutter/material.dart';
import 'package:food_app/provider/home_provider.dart';
import 'package:food_app/screen/dashboard_screen.dart';
import 'package:food_app/screen/landing_screen.dart';
import 'package:food_app/widget/label_text_field.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
        child: Column(
          children: [
            LabelTextField(label: 'PhoneNo. ',controller:provider.phone_controller),
            const Gap(30.0),
            LabelTextField(label: 'Password ',controller:provider.password_controller),
            const Gap(20.0),
            FilledButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LandingScreen(),));
                },
                child:const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Login'),
                    Gap(5.0),
                    Icon(Icons.arrow_forward)
                  ],
                )
            )
          ],
        ),
      );
    },);
  }
}
