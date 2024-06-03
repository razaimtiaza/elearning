import "dart:async";

import "package:e_learning/routes/routes.dart";
import "package:e_learning/screen/authentication/loginscreen/view/loginScreen.dart";
import "package:e_learning/utililts/colors/color.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:get/get.dart";

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StudentLogin(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
              child: Image.asset(
            "asset/images/ellipse1.png",
            color: barcolor,
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.height * 0.45,
          )),
          Center(
              child: Image.asset("asset/images/ellipse2.png",
                  color: circlebar,
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.height * 0.7)),
          Center(
              child: Image.asset("asset/images/splash1.png",
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.height * 0.7))
        ],
      ),
    );
  }
}
