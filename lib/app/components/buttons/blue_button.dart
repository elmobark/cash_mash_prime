import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class BlueButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const BlueButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.symmetric(
                    horizontal: Get.size.width / 5, vertical: 20),
                primary: AppColors.darkBlue),
            onPressed: onPressed,
            child: Text(title)));
  }
}
