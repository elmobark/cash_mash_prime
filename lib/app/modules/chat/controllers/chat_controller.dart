import 'package:get/get.dart';

class ChatController extends GetxController {
  late Map user;
  @override
  void onInit() {
    super.onInit();
    user = Get.arguments[0]['user'];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
