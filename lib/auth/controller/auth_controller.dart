import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_truth/home/view/home_page.dart';

class AuthController extends GetxController {
  final TextEditingController usernameController = TextEditingController();

  void saveUser() {
    String username = usernameController.text;

    if (username.isNotEmpty) {
      Get.snackbar('Registrasi berhasil!', 'Hello, $username');
      Get.offAll(() => const HomePage());
    } else {
      Get.snackbar('Siapa namamu?', 'Username harus diisi.');
    }
  }
}
