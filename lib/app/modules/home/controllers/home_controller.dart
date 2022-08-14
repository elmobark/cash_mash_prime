import 'package:animations/animations.dart';
import 'package:cash_mash_prime/app/components/minirouter/index.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/modules/home/views/pages/add_card.dart';
import 'package:cash_mash_prime/app/modules/home/views/pages/chat.dart';
import 'package:cash_mash_prime/app/modules/home/views/pages/landing.dart';
import 'package:cash_mash_prime/app/modules/home/views/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString path = '/'.obs;
  RxInt selectedIndex = 0.obs;
  final Map<List<String>, StackRouteBuilder> _routes = {
    [HomeLandingPage.path, 'landing/']:
        HomeLandingPage().buildStackRoute(maintainState: true),
    [ChatHomePage.path, 'chat/']:
        ChatHomePage().buildStackRoute(maintainState: true),
    [SettingsHomePage.path, 'settings/']:
        SettingsHomePage().buildStackRoute(maintainState: true),
    [AddCardHomePage.path, 'addcard/']:
        AddCardHomePage().buildStackRoute(maintainState: true),
  };
  Widget buildPanel() {
    return Obx(() => PathStack(
          routes: _routes,
          transitionBuilder:
              (context, child, primaryAnimation, secondaryAnimation) {
            return SharedAxisTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                fillColor: AppColors.blueish,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child);
          },
          path: path.value,
        ));
  }

  Widget bottomBarItem(
      {required int id, required String seletPath, required String svg}) {
    return GestureDetector(
      onTap: () {
        path(seletPath);
        selectedIndex.value = id;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/images/$svg.svg',
            color: selectedIndex.value == id ? AppColors.darkBlue : null,
          ),
          if (selectedIndex.value == id)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  color: AppColors.darkBlue,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget bottomBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              bottomBarItem(
                  id: 0, seletPath: HomeLandingPage.path, svg: 'home'),
              bottomBarItem(
                  id: 1, seletPath: SettingsHomePage.path, svg: 'settings'),
              bottomBarItem(
                  id: 2, seletPath: AddCardHomePage.path, svg: 'more'),
              bottomBarItem(id: 3, seletPath: ChatHomePage.path, svg: 'chat'),
            ],
          )),
    );
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
