import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_truth/auth/auth_controller.dart';
import 'package:truth_or_truth/components/custom_button.dart';
import 'package:truth_or_truth/components/custom_text_field.dart';
import 'package:truth_or_truth/utils/const.dart';
import 'package:truth_or_truth/utils/theme.dart';

class AuthPage extends StatelessWidget {
  final AuthController controller = Get.find();

  AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.tersier,
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.s50),
                  child: Column(
                    children: [
                      Text(
                        'Truth or Truth',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: AppColor.mainColor),
                      ),
                      const SizedBox(height: Sizes.s20),
                      Text(
                        'Random, Things, Question, Thoughts',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColor.mainColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(Sizes.s15),
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.s30,
                    horizontal: Sizes.s15,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColor.mainColor,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(Sizes.s10),
                      right: Radius.circular(Sizes.s10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Before we start the game,',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: AppColor.primary),
                      ),
                      const SizedBox(height: Sizes.s20),
                      Text(
                        'Who\'s your name, buddy?',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: AppColor.primary),
                      ),
                      const SizedBox(height: Sizes.s30),
                      CustomTextField(
                        controller: controller.usernameController,
                        inputLabel: 'Your Name',
                      ),
                      const SizedBox(height: Sizes.s20),
                      CustomButton(
                        buttonLabel: 'Save',
                        onPressed: () {
                          controller.saveUser();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
