import 'package:cash_mash_prime/app/components/app_bar.dart';
import 'package:cash_mash_prime/app/components/app_icon_button.dart';
import 'package:cash_mash_prime/app/components/avatar.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/helpers/app_decoration.dart';
import 'package:cash_mash_prime/app/helpers/app_styles.dart';
import 'package:cash_mash_prime/app/modules/auth/views/phone_view.dart';
import 'package:cash_mash_prime/app/modules/auth/views/recovery_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class LockView extends GetView<AuthController> {
  static final String path = '/';

  Widget topPart() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              UserAvatar(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: PrimeIconButton(
                    color: AppColors.darkBlue,
                    padding: PrimeIconPadding.small,
                    icon: Icon(Icons.compare_arrows_rounded,
                        color: AppColors.light),
                    onPressed: () {
                      controller.path(PhoneView.path);
                    }),
              ),
            ],
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Welcome , Ali',
              style: AppStyles.h1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => controller.path(PhoneView.path),
              child: Text(
                'Not you ?',
                style: AppStyles.p,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => TextFormField(
                  obscureText: controller.showPass.value,
                  decoration: AppDecorations.preLoginDecoration(
                    'Enter your password',
                    suffix: IconButton(
                      onPressed: controller.showPass.toggle,
                      icon: Icon(
                        controller.showPass.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ),
                )),
          ),
          TextButton(
              onPressed: () {
                controller.path(RecoveryView.path);
              },
              child: Text('Forgot Password ?')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimeBar(),
      body: Column(
        children: [
          Spacer(),
          topPart(),
          Spacer(),
          bottomPart(),
          Container(
            color: AppColors.darkBlue,
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget bottomPart() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          bottomItemBuilder(
              onPressed: () {},
              svg: 'assets/images/account_issue.svg',
              title: 'Account Issue?'),
          bottomItemBuilder(
              onPressed: () {},
              svg: 'assets/images/qrcode.svg',
              title: 'Scan QR Code'),
          bottomItemBuilder(
              onPressed: () {},
              svg: 'assets/images/hotline.svg',
              title: 'Call Hotline'),
        ],
      ),
    );
  }

  Widget bottomItemBuilder(
      {required String title,
      required String svg,
      required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            SvgPicture.asset(svg),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(color: AppColors.darkBlue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
