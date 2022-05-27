import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class AppDecorations {
  static InputDecoration preLoginDecoration(String hintText, {Widget? suffix}) {
    return InputDecoration(
      labelText: hintText,
      floatingLabelStyle: TextStyle(
          color: AppColors.darkBlue, fontSize: 13, fontWeight: FontWeight.bold),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
        color: AppColors.blue,
      )),
      suffix: suffix,
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
        color: AppColors.darkBlue,
      )),
    );
  }

  static InputDecoration preSigunUpDecoration(String hintText,
      {Widget? suffix, Widget? prefix}) {
    return InputDecoration(
      labelText: hintText,
      prefix: prefix,
      labelStyle: TextStyle(color: AppColors.grey),
      floatingLabelStyle: TextStyle(
          color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
        color: AppColors.grey,
      )),
      suffix: suffix,
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
        color: Colors.white,
      )),
    );
  }
}
