import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_truth/auth/auth_page.dart';
import 'package:truth_or_truth/home/home_controller.dart';
import 'package:truth_or_truth/home/home_page.dart';

class AuthController extends GetxController {
  final TextEditingController usernameController = TextEditingController();

  void saveUser() {
    String username = usernameController.text;

    if (username.isNotEmpty) {
      Get.snackbar('Sucessfully registered!', 'Hello, $username');
      Get.offAll(() => const HomePage());
    } else {
      Get.snackbar('Who\'s your name?', 'Username must be filled in.');
    }
  }

  void logout() {
    Get.find<HomePageController>().resetHomePageValues();
    Get.offAll(() => AuthPage());
  }
}
