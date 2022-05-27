import 'package:cash_mash_prime/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimeExtBar extends StatelessWidget {
  final String image;
  final String backPath;
  PrimeExtBar({Key? key, required this.image, required this.backPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: IconButton(
              onPressed: () => Get.find<AuthController>().path(backPath),
              icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
        )
      ],
    );
  }
}
