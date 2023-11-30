import 'package:flutter/material.dart';
import 'package:truth_or_truth/components/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(pageTitle: 'Home'),
      body: const Center(
        child: Text('Content of Home Page'),
      ),
    );
  }
}
