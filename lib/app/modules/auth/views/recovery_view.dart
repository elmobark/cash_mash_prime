import 'package:cash_mash_prime/app/components/app_ext_bar.dart';
import 'package:cash_mash_prime/app/components/buttons/blue_button.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/helpers/app_decoration.dart';
import 'package:cash_mash_prime/app/helpers/app_styles.dart';
import 'package:cash_mash_prime/app/modules/auth/controllers/auth_controller.dart';
import 'package:cash_mash_prime/app/modules/auth/views/lock_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RecoveryView extends GetView<AuthController> {
  static final String path = '/recovery';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PrimeExtBar(
                image: 'assets/images/authbg2.png', backPath: LockView.path),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account Recovery',
                  style: AppStyles.h1.copyWith(color: AppColors.dark),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                    'You can Recover your account by entering your username and phone number'),
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
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: AppDecorations.preLoginDecoration(
                    'Phone',
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                BlueButton(title: 'NEXT', onPressed: () {}),
                SizedBox(
                  height: 28,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
