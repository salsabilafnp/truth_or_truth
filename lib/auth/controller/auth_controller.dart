import 'dart:developer';

import 'package:flutter/material.dart';

class AuthController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  void register() {
    String username = usernameController.text;
    String password = passwordController.text;
    // if (passwordController == rePasswordController) {
    // }

    if (username.isNotEmpty && password.isNotEmpty) {
      inspect('Registrasi berhasil! Username: $username, Password: $password');
    } else {
      inspect('Username dan password harus diisi.');
    }
  }

  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
  }
}
