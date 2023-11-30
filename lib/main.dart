import 'package:flutter/material.dart';
import 'package:truth_or_truth/auth/view/register_page.dart';
import 'package:truth_or_truth/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Truth or Truth',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.apptheme,
      home: RegisterPage(),
    );
  }
}
