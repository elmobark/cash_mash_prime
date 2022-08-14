import 'package:get/get.dart';

import '../controllers/additionals_controller.dart';

class AdditionalsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdditionalsController>(
      () => AdditionalsController(),
    );
  }
}
