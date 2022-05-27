import 'package:cash_mash_prime/app/components/buttons/white_button.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/helpers/app_decoration.dart';
import 'package:cash_mash_prime/app/helpers/app_styles.dart';
import 'package:cash_mash_prime/app/modules/auth/controllers/auth_controller.dart';
import 'package:cash_mash_prime/app/modules/auth/controllers/signupcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountInfoSignUp extends StatelessWidget {
  static final String path = 'signup/info';
  const AccountInfoSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Text('Please enter your personal information',
              style: AppStyles.p.copyWith(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.normal)),
          SizedBox(
            height: 38,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.white),
            decoration: AppDecorations.preSigunUpDecoration(
              'Username',
            ),
          ),
          SizedBox(
            height: 38,
          ),
          Obx(() => TextFormField(
                obscureText: Get.find<AuthController>().showPass.value,
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(color: Colors.white),
                decoration: AppDecorations.preSigunUpDecoration(
                  'Password',
                  suffix: GestureDetector(
                    onTap: Get.find<AuthController>().showPass.toggle,
                    child: Icon(
                      Get.find<AuthController>().showPass.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 38,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: AppDecorations.preSigunUpDecoration(
              'Email',
            ),
          ),
          SizedBox(
            height: 38,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.white),
            decoration: AppDecorations.preSigunUpDecoration(
              'Full Name',
            ),
          ),
          Spacer(),
          WhiteButton(
              onPressed: () {
                Get.find<SignUpController>().handleNext();
              },
              title: 'NEXT'),
          SizedBox(
            height: 38,
          ),
        ],
      ),
    );
  }
}
