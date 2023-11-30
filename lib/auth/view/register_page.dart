import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_truth/auth/controller/auth_controller.dart';
import 'package:truth_or_truth/auth/view/login_page.dart';
import 'package:truth_or_truth/components/custom_button.dart';
import 'package:truth_or_truth/components/custom_text_button.dart';
import 'package:truth_or_truth/components/custom_text_field.dart';
import 'package:truth_or_truth/utils/const.dart';
import 'package:truth_or_truth/utils/theme.dart';

class RegisterPage extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double containerHeight = screenHeight * 2 / 3;

    return Scaffold(
      backgroundColor: AppColor.tersier,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
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
              ),
              Container(
                width: screenWidth,
                height: containerHeight,
                margin: const EdgeInsets.all(Sizes.s15),
                padding: const EdgeInsets.all(Sizes.s15),
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
                    // const SizedBox(height: Sizes.s30),
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
                      'Who\'s your name?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: AppColor.primary),
                    ),
                    const SizedBox(height: Sizes.s30),
                    CustomTextField(
                      controller: controller.usernameController,
                      inputLabel: 'Username',
                    ),
                    CustomTextField(
                      controller: controller.usernameController,
                      inputLabel: 'Password',
                    ),
                    CustomTextField(
                      controller: controller.usernameController,
                      inputLabel: 'Re-Password',
                    ),
                    const SizedBox(height: Sizes.s20),
                    CustomButton(
                      buttonLabel: 'Register',
                      onPressed: () {
                        Get.to(() => LoginPage());
                      },
                    ),
                    const SizedBox(height: Sizes.s15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColor.secondary),
                        ),
                        const SizedBox(width: Sizes.s15),
                        CustomTextButton(
                          buttonLabel: 'Login',
                          onPressed: () {
                            Get.to(() => LoginPage());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
