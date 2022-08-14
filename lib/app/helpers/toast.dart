
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ToastHelper {
  static errorSnack({required String message}) {
    Get.snackbar(
      'حدث خطا',
      message,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: AppColors.red2,
      // borderRadius: 10,
      colorText: Colors.white,
      overlayBlur: 3,

      shouldIconPulse: true,

      icon: const Icon(
        Iconsax.close_circle,
        color: Colors.white,
        size: 32,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      margin: EdgeInsets.zero,
    );
  }

  static notificationSnack({required String message}) {
    Get.snackbar(
      'اشعار',
      message,
      duration: const Duration(seconds: 5),
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      overlayColor: Colors.black.withOpacity(.4),
      backgroundColor: Colors.white,
      // borderRadius: 10,
      colorText: Colors.black,
      overlayBlur: 3,
      shouldIconPulse: true,
      icon: const Icon(
        Iconsax.notification,
        color: AppColors.primary,
        size: 32,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      margin: EdgeInsets.zero,
    );
  }

  static infoSnack({required String message}) {
    Get.snackbar(
      'معلومات',
      message,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: AppColors.secondary,
      // borderRadius: 10,
      colorText: Colors.white,
      overlayBlur: 3,
      
      shouldIconPulse: true,
      icon: const Icon(
        Iconsax.info_circle,
        color: Colors.white,
        size: 32,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      margin: EdgeInsets.zero,
    );
  }

  static succusSnack({required String message, VoidCallback? onfinsh}) {
    Get.snackbar(
      'نجاح',
      message,
      snackbarStatus: (states) {
        if (states == SnackbarStatus.CLOSING) {
          onfinsh?.call();
        }
      },
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: AppColors.primary,
      // borderRadius: 10,
      colorText: Colors.white,
      overlayBlur: 3,
      shouldIconPulse: true,
      icon: const Icon(
        Iconsax.tick_circle,
        color: Colors.white,
        size: 32,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      margin: EdgeInsets.zero,
    );
  }
}
