import 'package:cash_mash_prime/app/components/landing/last_transaction_card.dart';
import 'package:cash_mash_prime/app/components/landing/service_balt.dart';
import 'package:cash_mash_prime/app/components/landing/topbar.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLandingPage extends GetView<HomeController> {
  static final String path = '/';
  const HomeLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: AppColors.darkBlue,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.blueish,
                ),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              LandingTopBar(),
              SizedBox(
                height: 38,
              ),
              LastTransactionsCard(),
              ServicBelt()
            ],
          ),
        ),
      ],
    );
  }
}
