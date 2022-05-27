import 'package:animations/animations.dart';
import 'package:cash_mash_prime/app/modules/auth/views/signup/create_card.dart';
import 'package:cash_mash_prime/app/modules/auth/views/signup/info.dart';
import 'package:cash_mash_prime/app/modules/auth/views/signup/otp.dart';
import 'package:cash_mash_prime/app/modules/auth/views/signup/trem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cash_mash_prime/app/components/stepper.dart';
import 'package:cash_mash_prime/app/modules/auth/controllers/auth_controller.dart';
import 'package:cash_mash_prime/app/modules/auth/views/login_view.dart';
import 'package:cash_mash_prime/app/modules/auth/views/signup/phone.dart';

import '../../../components/minirouter/index.dart';

class RouteSetup {
  StepType step;
  String path;
  RouteSetup({
    required this.step,
    required this.path,
  });
}

class SignUpController extends GetxController {
  RxMap<String, dynamic> cardInfo = <String, dynamic>{
    'number':'',
    'name':'',
    'expire':''
  }.obs;

  RxString path = Get.find<AuthController>().path;
  RxBool isCountDownDone = false.obs;
  int currentStep = 0;
  RxList<RouteSetup> steps = <RouteSetup>[
    RouteSetup(step: StepType.done, path: PhoneSignUp.path),
    RouteSetup(step: StepType.required, path: OTPSignUp.path),
    RouteSetup(step: StepType.required, path: AccountInfoSignUp.path),
    RouteSetup(step: StepType.required, path: TremSignUp.path),
    RouteSetup(step: StepType.optional, path: CreateCardSignUp.path),
  ].obs;
  RxBool showPass = false.obs;
  final Map<List<String>, StackRouteBuilder> _routes = {
    [PhoneSignUp.path, '']: PhoneSignUp().buildStackRoute(maintainState: true),
  };

  void handleNext() {
    if (currentStep == steps.length - 1) {
      print('end');
    } else {
      currentStep++;
      steps[currentStep].step = StepType.done;
      path(steps[currentStep].path);
    }
  }

  void handleBack() {
    if (currentStep == 0) {
      Get.find<AuthController>().path(LoginView.path);
    } else {
      steps[currentStep].step = StepType.required;
      currentStep--;
      path(steps[currentStep].path);
    }
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
