import 'dart:ui';

import 'package:cash_mash_prime/app/components/buttons/white_button.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/helpers/app_styles.dart';
import 'package:cash_mash_prime/app/modules/auth/controllers/signupcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:slide_countdown/slide_countdown.dart';

class OTPSignUp extends GetView<SignUpController> {
  static final String path = 'signup/otp';
  const OTPSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Center(
            child: Text('Please enter your OTP',
                style: AppStyles.p.copyWith(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.normal)),
          ),
          SizedBox(
            height: 38,
          ),
          Center(
            child: Pinput(
              length: 6,
              pinAnimationType: PinAnimationType.slide,
              defaultPinTheme: PinTheme(
                width: Get.width,
                padding: EdgeInsets.all(10),
                textStyle: TextStyle(color: Colors.white),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: AppColors.blue, width: 4)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 38,
          ),
          Row(
            children: [
              Text('Did not receive OTP?',
                  style: AppStyles.p.copyWith(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.normal)),
              Obx(() => controller.isCountDownDone.value
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: GestureDetector(
                        onTap: controller.isCountDownDone.toggle,
                        child: Text('Resend the OTP',
                            style: AppStyles.p.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  : SlideCountdown(
                      duration: const Duration(minutes: 3),
                      decoration: BoxDecoration(),
                      onDone: () {
                        controller.isCountDownDone.toggle();
                      },
                    ))
            ],
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
