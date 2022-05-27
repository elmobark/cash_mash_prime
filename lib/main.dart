import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/helpers/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
   PrimeApp()
  );
}
class PrimeApp extends StatelessWidget {
  const PrimeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: "Cash Mash Prime",
      initialRoute: AppPages.INITIAL,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.tajawalTextTheme(),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                primary: AppColors.darkBlue,
                textStyle: TextStyle(fontWeight: FontWeight.bold))),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: AppPages.routes,
    );
  }
}
