import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LabelTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final bool? obscureText;
  const LabelTextField({super.key,this.label,this.controller,this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label??""),
        Gap(5.0),
        Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(5.0),

          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText??false,
            decoration: InputDecoration(
              border: InputBorder.none
            ),
          ),
        )
      ],
    );
  }
}
