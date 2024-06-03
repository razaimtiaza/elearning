import 'package:e_learning/routes/routes.dart';
import 'package:e_learning/utililts/snakbar/snakbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> register(String name, String email, String password,
      String confirmPassword) async {
    if (email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        name.isEmpty) {
      SnackbarUtil.showError("Please fill in all fields");
      return;
    }

    if (!email.endsWith('@gmail.com')) {
      SnackbarUtil.showError("Invalid email. Please use a @gmail.com email");
      return;
    }

    if (password.length < 6) {
      SnackbarUtil.showError(
          "Weak password. Password should be at least 6 characters");
      return;
    }

    if (password != confirmPassword) {
      SnackbarUtil.showError("Passwords do not match");
      return;
    }

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      SnackbarUtil.showSuccess("Registration successful");
      Get.toNamed(routerLoginScreen);
    } catch (e) {
      SnackbarUtil.showError(e.toString());
    }
  }
}
