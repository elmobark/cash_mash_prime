import 'package:cash_mash_prime/app/modules/home/controllers/chat_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<HomeChatController>(
      () => HomeChatController(),
    );
  }
}
