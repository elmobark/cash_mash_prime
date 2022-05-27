import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhiteButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double padding;
  const WhiteButton({Key? key, this.padding = 5, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: EdgeInsets.symmetric(
                    horizontal: Get.size.width / padding, vertical: 20),
                primary: Colors.white),
            onPressed: onPressed,
            child: Text(title, style: TextStyle(color: AppColors.darkBlue))));
  }
}
