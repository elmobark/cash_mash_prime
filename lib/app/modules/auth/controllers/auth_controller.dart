import 'package:animations/animations.dart';
import 'package:cash_mash_prime/app/components/minirouter/index.dart';
import 'package:cash_mash_prime/app/modules/auth/views/lock_view.dart';
import 'package:cash_mash_prime/app/modules/auth/views/login_view.dart';
import 'package:cash_mash_prime/app/modules/auth/views/recovery_view.dart';
import 'package:cash_mash_prime/app/modules/auth/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  
RxString path = '/'.obs;
   final Map<List<String>, StackRouteBuilder> _routes = {
    [LockView.path, 'lock/']: LockView().buildStackRoute(maintainState: false),
    [LoginView.path, 'login/']: LoginView().buildStackRoute(maintainState: false),
    [RecoveryView.path, 'recovery/']:
        RecoveryView().buildStackRoute(maintainState: false),
    [SignupView.path, 'signup/']:
        SignupView().buildStackRoute(maintainState: false),
  };
  Widget buildPanel() {
    return Obx(() => PathStack(
          routes: _routes,
          transitionBuilder:
              (context, child, primaryAnimation, secondaryAnimation) {
            return SharedAxisTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child);
          },
          path: path.value,
        ));
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
