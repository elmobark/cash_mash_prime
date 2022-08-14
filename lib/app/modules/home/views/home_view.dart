import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:local_hero/local_hero.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LocalHeroScope(
          curve: Curves.easeOutQuart,
          createRectTween: (Rect? begin, Rect? end) {
            RectTween rectTween = RectTween(begin: begin, end: end);
            return rectTween;
          },
          duration: Duration(milliseconds: 250),
          child: controller.buildPanel()),
      bottomNavigationBar: controller.bottomBar(),
    );
  }
}
