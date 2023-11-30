import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_truth/auth/auth_controller.dart';
import 'package:truth_or_truth/auth/auth_page.dart';
import 'package:truth_or_truth/home/home_page.dart';
import 'package:truth_or_truth/settings/settings_page.dart';
import 'package:truth_or_truth/utils/theme.dart';

void main() {
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Truth or Truth',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.apptheme,
      getPages: [
        GetPage(
          name: '/settings',
          page: () => SettingsPage(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/auth',
          page: () => AuthPage(),
        ),
      ],
      home: AuthPage(),
    );
  }
}
