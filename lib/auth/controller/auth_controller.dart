import 'package:flutter/material.dart';

class AuthController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  void register() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      print('Registrasi berhasil! Username: $username, Password: $password');
    } else {
      print('Username dan password harus diisi.');
    }
  }

  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
  }
}
