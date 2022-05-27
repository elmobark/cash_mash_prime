import 'package:cash_mash_prime/app/components/stepper.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/helpers/app_styles.dart';
import 'package:cash_mash_prime/app/modules/auth/controllers/signupcontroller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SignupView extends GetView<SignUpController> {
  static final String path = 'signup/';
  final Widget stack;
  SignupView({required this.stack});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed:  controller.handleBack,
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                ),
                Column(
                  children: [
                    Text('Sign Up',
                        style: AppStyles.h1.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => SignUpStepper(steps: controller.steps.value)),
          ),
          Expanded(child: stack)
        ],
      ),
    );
  }
}
