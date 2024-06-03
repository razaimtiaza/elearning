import 'package:e_learning/routes/routes.dart';
import 'package:e_learning/screen/authentication/registerscreen/view_model/registercontroller.dart';
import 'package:e_learning/widget/coustomtextfield.dart';
import 'package:e_learning/widget/coutomButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentRegister extends StatefulWidget {
  const StudentRegister({super.key});

  @override
  State<StudentRegister> createState() => _StudentRegisterState();
}

class _StudentRegisterState extends State<StudentRegister> {
  final RegisterController _registerController = Get.put(RegisterController());
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
              child: Image.asset(
            "asset/images/login.png",
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.height * 0.4,
          )).paddingOnly(top: MediaQuery.of(context).size.height * 0.1),
          CoutomTextField(
            hintText: "Enter a Name",
            icon: Icons.email,
            obscureText: false,
            controller: _nameController,
          ).paddingOnly(top: MediaQuery.of(context).size.height * 0.03),
          CoutomTextField(
            hintText: "Enter a Email",
            icon: Icons.email,
            obscureText: false,
            controller: _emailController,
          ).paddingOnly(top: MediaQuery.of(context).size.height * 0.03),
          CoutomTextField(
            hintText: "Enter a Password",
            icon: Icons.lock,
            obscureText: true,
            controller: _passwordController,
          ).paddingOnly(top: MediaQuery.of(context).size.height * 0.03),
          CoutomTextField(
            hintText: "Enter a Confrim Password",
            icon: Icons.lock,
            obscureText: true,
            controller: _confrimpasswordController,
          ).paddingOnly(top: MediaQuery.of(context).size.height * 0.03),
          CoutomButton(
                  onPressed: () {
                    _registerController.register(
                        _nameController.text.trim(),
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                        _confrimpasswordController.text.trim());
                  },
                  icon: Icons.login,
                  text: "Register")
              .paddingOnly(top: MediaQuery.of(context).size.height * 0.04)
        ],
      ),
    ));
  }
}
