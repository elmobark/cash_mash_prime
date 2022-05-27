import 'package:animations/animations.dart';
import 'package:cash_mash_prime/app/components/minirouter/index.dart';
import 'package:cash_mash_prime/app/components/stepper.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/modules/auth/views/lock_view.dart';
import 'package:cash_mash_prime/app/modules/auth/views/login_view.dart';
import 'package:cash_mash_prime/app/modules/auth/views/phone_view.dart';
import 'package:cash_mash_prime/app/modules/auth/views/recovery_view.dart';
import 'package:cash_mash_prime/app/modules/auth/views/signup/create_card.dart';
import 'package:cash_mash_prime/app/modules/auth/views/signup/info.dart';
import 'package:cash_mash_prime/app/modules/auth/views/signup/otp.dart';
import 'package:cash_mash_prime/app/modules/auth/views/signup/phone.dart';
import 'package:cash_mash_prime/app/modules/auth/views/signup/trem.dart';
import 'package:cash_mash_prime/app/modules/auth/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxString path = '/'.obs;
  RxBool showPass = false.obs;
  RxList<StepType> steps = <StepType>[
    StepType.required,
    StepType.required,
    StepType.required,
    StepType.required,
    StepType.optional,
  ].obs;

  Map<List<String>, StackRouteBuilder> _routes = {};
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
    _routes = {
      [LockView.path, 'lock/']:
          LockView().buildStackRoute(maintainState: false),
      [LoginView.path, 'login/']:
          LoginView().buildStackRoute(maintainState: false),
      [PhoneView.path, 'phone/login/']:
          PhoneView().buildStackRoute(maintainState: false),
      [RecoveryView.path, 'recovery/']:
          RecoveryView().buildStackRoute(maintainState: false),
      [SignupView.path]: PathStack(
        scaffoldBuilder: (context, child) {
          return SignupView(stack:child);
        },

         transitionBuilder:
            (context, child, primaryAnimation, secondaryAnimation) {
          return SharedAxisTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              fillColor: AppColors.darkBlue,
              transitionType: SharedAxisTransitionType.vertical,
              child: child);
        },

        routes: {
          [PhoneSignUp.path, 'phone']:
              PhoneSignUp().buildStackRoute(maintainState: true,),
              [OTPSignUp.path,'otp']:
              OTPSignUp().buildStackRoute(maintainState: false),
          [AccountInfoSignUp.path,'info']:
              AccountInfoSignUp().buildStackRoute(maintainState: true),
          [TremSignUp.path,'trem']:
              TremSignUp().buildStackRoute(maintainState: true),
          [CreateCardSignUp.path,'card']:
              CreateCardSignUp().buildStackRoute(maintainState: true),
        },
      ).buildStackRoute(maintainState: false,),
    };
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
