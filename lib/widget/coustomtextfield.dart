import "package:e_learning/utililts/colors/color.dart";
import "package:e_learning/widget/padding.dart";
import "package:flutter/material.dart";

class CoutomTextField extends StatelessWidget {
  String hintText;
  IconData icon;
  bool obscureText;
  TextEditingController controller;

  CoutomTextField(
      {super.key,
      required this.hintText,
      required this.icon,
      required this.obscureText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: circlebar,
        ),
        hintText: hintText,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), // Change the color here
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue), // Same color as above
        ),
      ),
    ).paddingOnly(
      left: MediaQuery.of(context).size.height * 0.03,
      right: MediaQuery.of(context).size.height * 0.03,
    );
  }
}
