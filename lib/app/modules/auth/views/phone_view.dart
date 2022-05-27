import 'package:cash_mash_prime/app/components/app_ext_bar.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/helpers/app_decoration.dart';
import 'package:cash_mash_prime/app/helpers/app_styles.dart';
import 'package:cash_mash_prime/app/modules/auth/controllers/auth_controller.dart';
import 'package:cash_mash_prime/app/modules/auth/views/lock_view.dart';
import 'package:cash_mash_prime/app/modules/auth/views/login_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PhoneView extends GetView<AuthController> {
  static final String path = '/login/phone';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PrimeExtBar(
              image: 'assets/images/authbg.png', backPath: LockView.path),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter your phone number',
                    style: AppStyles.h1.copyWith(color: AppColors.dark),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                      'We will send you a code to verify your phone number or you can login with your email'),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: AppDecorations.preLoginDecoration(
                      'Phone number',
                    ),
                  ),
                  Spacer(),
                  TextButton(
                      onPressed: () => controller.path(LoginView.path),
                      child: Text('Login with Username')),
                  Spacer()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
