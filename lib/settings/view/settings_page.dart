import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_truth/auth/controller/auth_controller.dart';
import 'package:truth_or_truth/components/custom_appbar.dart';
import 'package:truth_or_truth/components/custom_button.dart';
import 'package:truth_or_truth/utils/const.dart';

class SettingsPage extends StatelessWidget {
  final AuthController authC = Get.find<AuthController>();

  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(pageTitle: 'Settings'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, ${authC.usernameController.text}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: Sizes.s50),
            CustomButton(
              buttonLabel: "Logout",
              onPressed: () {
                Get.offAndToNamed('/auth');
              },
            ),
          ],
        ),
      ),
    );
  }
}
