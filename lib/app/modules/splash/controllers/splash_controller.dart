import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // go to login afet 3 seconds
    print('splash init');
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(Routes.AUTH);
    });
  }

  Widget buildSplash() {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              AppColors.blue,
              AppColors.darkBlue,
            ])),
        child: Center(child: SvgPicture.asset('assets/icons/logo.svg')));
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
