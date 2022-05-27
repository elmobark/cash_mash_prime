import 'package:get/get.dart';

import 'package:cash_mash_prime/app/modules/auth/controllers/signupcontroller.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
  }
}
