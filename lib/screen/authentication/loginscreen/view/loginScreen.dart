import "package:e_learning/routes/routes.dart";
import "package:e_learning/screen/authentication/loginscreen/view_model/logincontroller.dart";
import "package:e_learning/widget/coustomtextfield.dart";
import "package:e_learning/widget/coutomButton.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:get/get.dart";

class StudentLogin extends StatefulWidget {
  const StudentLogin({super.key});

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  LoginController loginController = LoginController();
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
              hintText: "Email",
              icon: Icons.email,
              obscureText: false,
              controller: _emailController,
            ).paddingOnly(top: MediaQuery.of(context).size.height * 0.03),
            CoutomTextField(
              hintText: "password",
              icon: Icons.lock,
              obscureText: true,
              controller: _passwordController,
            ).paddingOnly(top: MediaQuery.of(context).size.height * 0.03),
            GestureDetector(
              onTap: () {
                Get.toNamed(routerRegisterScreen);
              },
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                      text: "Don't have account?",
                      style: TextStyle(fontSize: 15, color: Colors.black)),
                  TextSpan(
                      text: "Register",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ]),
              ).paddingOnly(top: MediaQuery.of(context).size.height * 0.05),
            ),
            CoutomButton(
                    onPressed: () {
                      // Get.toNamed(routeHomeScreen);
                      loginController.login(_emailController.text.trim(),
                          _passwordController.text.trim());
                    },
                    icon: Icons.login,
                    text: "login")
                .paddingOnly(top: MediaQuery.of(context).size.height * 0.04)
          ],
        ),
      ),
    );
  }
}
