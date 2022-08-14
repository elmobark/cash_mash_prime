import 'package:get/get.dart';

import '../controllers/payconform_controller.dart';

class PayconformBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PayconformController>(
      () => PayconformController(),
    );
  }
}
