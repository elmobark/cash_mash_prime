import 'package:get/get.dart';

import '../controllers/paying_controller.dart';

class PayingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PayingController>(
      () => PayingController(),
    );
  }
}
