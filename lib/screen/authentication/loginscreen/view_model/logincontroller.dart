import 'package:e_learning/screen/persondetails/role/student&teacher.dart';
import 'package:e_learning/utililts/snakbar/snakbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  void login(String email, String password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    if (email.isEmpty || password.isEmpty) {
      SnackbarUtil.showError("Please fill in all fields");
      return;
    }
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      SnackbarUtil.showSuccess("Login successful");
      Get.to(StudentTeacher());
    } catch (e) {
      SnackbarUtil.showError("Invalid Email and password");
    }
  }
}
