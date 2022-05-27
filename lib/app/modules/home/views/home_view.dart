import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.buildPanel(),
      bottomNavigationBar: controller.bottomBar(),
    );
  }
}
