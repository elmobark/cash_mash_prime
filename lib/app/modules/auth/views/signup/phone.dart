import 'package:cash_mash_prime/app/components/buttons/white_button.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/helpers/app_decoration.dart';
import 'package:cash_mash_prime/app/helpers/app_styles.dart';
import 'package:cash_mash_prime/app/modules/auth/controllers/signupcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneSignUp extends StatelessWidget {
  static final String path = 'signup/phone';
  const PhoneSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Text('Please enter your phone number',
              style: AppStyles.p.copyWith(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.normal)),
          SizedBox(
            height: 38,
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            style: TextStyle(color: Colors.white),
            decoration: AppDecorations.preSigunUpDecoration('Phone number',
                prefix: IntrinsicHeight(
                  child: Row(
                    children: [
                      Text(
                        '+249',
                        style: TextStyle(color: AppColors.grey),
                      ),
                      VerticalDivider(
                        color: AppColors.grey,
                      )
                    ],
                    mainAxisSize: MainAxisSize.min,
                  ),
                )),
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
