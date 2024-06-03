import "package:e_learning/screen/homepage/homepage.dart";
import "package:e_learning/widget/coustomtextfield.dart";
import "package:e_learning/widget/coutomButton.dart";

import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TeacherProfile extends StatefulWidget {
  const TeacherProfile({super.key});

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confrimpasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
                child: Container(
              height: 150,
              width: 200,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Image.asset("asset/images/profile.png"),
            )).paddingOnly(top: 150),
            CoutomTextField(
              hintText: "Enter a Nanme",
              icon: Icons.email,
              obscureText: false,
              controller: _nameController,
            ).paddingOnly(top: MediaQuery.of(context).size.height * 0.03),
            CoutomTextField(
              hintText: "Email",
              icon: Icons.lock,
              obscureText: true,
              controller: _emailController,
            ).paddingOnly(top: MediaQuery.of(context).size.height * 0.03),
            CoutomTextField(
              hintText: "Teaching Subject",
              icon: Icons.lock,
              obscureText: true,
              controller: _passwordController,
            ).paddingOnly(top: MediaQuery.of(context).size.height * 0.03),
            CoutomButton(
                    onPressed: () {
                      Get.to(Homepage());
                    },
                    icon: Icons.login,
                    text: "Next")
                .paddingOnly(top: MediaQuery.of(context).size.height * 0.04)
          ],
        ),
      ),
    );
  }
}
