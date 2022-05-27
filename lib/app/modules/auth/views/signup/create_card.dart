import 'package:cash_mash_prime/app/components/buttons/white_button.dart';
import 'package:cash_mash_prime/app/helpers/app_decoration.dart';
import 'package:cash_mash_prime/app/helpers/app_styles.dart';
import 'package:cash_mash_prime/app/modules/auth/controllers/signupcontroller.dart';
import 'package:cash_mash_prime/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

class CreateCardSignUp extends GetView<SignUpController> {
  static final String path = 'signup/card';
  const CreateCardSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Please enter your credit card details',
              style: AppStyles.p.copyWith(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.normal)),
          Obx(() => CreditCardWidget(
                glassmorphismConfig: Glassmorphism(
                  blurX: 10.0,
                  blurY: 10.0,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Colors.grey.withAlpha(20),
                      Colors.white.withAlpha(20),
                    ],
                    stops: const <double>[
                      0.3,
                      0,
                    ],
                  ),
                ),
                onCreditCardWidgetChange: (CreditCardBrand) {},
                cardHolderName: controller.cardInfo['name'],
                cardNumber: controller.cardInfo['number'],
                isSwipeGestureEnabled: false,
                cvvCode: '4343',
                isChipVisible: true,
                isHolderNameVisible: true,
                obscureCardNumber: true,
                expiryDate: controller.cardInfo['expire'],
                showBackView: false,
              )),
          SizedBox(
            height: 18,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            onChanged: (s) {
              controller.cardInfo['number'] = s;
            },
            style: TextStyle(color: Colors.white),
            decoration: AppDecorations.preSigunUpDecoration(
              'Card Number',
            ),
          ),
          SizedBox(
            height: 18,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            onChanged: (s) {
              controller.cardInfo['name'] = s;
            },
            style: TextStyle(color: Colors.white),
            decoration: AppDecorations.preSigunUpDecoration(
              'Card Holder Name',
            ),
          ),
          SizedBox(
            height: 18,
          ),
          TextFormField(
            keyboardType: TextInputType.datetime,
            onChanged: (s) {
              controller.cardInfo['expire'] = s;
            },
            style: TextStyle(color: Colors.white),
            decoration: AppDecorations.preSigunUpDecoration(
              'Card Expiry Date',
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: () {

                      Get.offAndToNamed(Routes.HOME);
                    },
                    child: Text(
                      'SKIP',
                      style: TextStyle(color: Colors.white),
                    )),
                WhiteButton(
                    onPressed: () {
                      Get.offAndToNamed(Routes.HOME);
                    },
                    title: 'Finish'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
