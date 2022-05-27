import 'package:cash_mash_prime/app/components/app_ext_bar.dart';
import 'package:cash_mash_prime/app/components/buttons/blue_button.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/helpers/app_decoration.dart';
import 'package:cash_mash_prime/app/helpers/app_styles.dart';
import 'package:cash_mash_prime/app/modules/auth/controllers/auth_controller.dart';
import 'package:cash_mash_prime/app/modules/auth/views/phone_view.dart';
import 'package:cash_mash_prime/app/modules/auth/views/signup/phone.dart';
import 'package:cash_mash_prime/app/modules/auth/views/signup_view.dart';
import 'package:cash_mash_prime/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginView extends GetView<AuthController> {
  static final String path = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PrimeExtBar(
                image: 'assets/images/authbg3.png', backPath: PhoneView.path),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: AppStyles.h1.copyWith(color: AppColors.dark),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                    'You can recover your account using your email or phone number'),
                SizedBox(
                  height: 18,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: AppDecorations.preLoginDecoration(
                    'Username',
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Obx(() => TextFormField(
                      obscureText: controller.showPass.value,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: AppDecorations.preLoginDecoration(
                        'Password',
                        suffix: GestureDetector(
                          onTap: controller.showPass.toggle,
                          child: Icon(
                            controller.showPass.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.darkBlue,
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 28,
                ),
                BlueButton(
                    title: 'NEXT',
                    onPressed: () {
                      Get.offAndToNamed(Routes.HOME);
                    }),
                SizedBox(
                  height: 28,
                ),
                TextButton(
                    onPressed: () => controller.path(PhoneSignUp.path),
                    child: Text('Don\'t have an account? Sign up')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
