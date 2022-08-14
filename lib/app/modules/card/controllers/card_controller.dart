import 'package:get/get.dart';

class CardController extends GetxController {
  Map<String, dynamic> card = <String, dynamic>{};
  @override
  void onInit() {
    super.onInit();
    card = Get.arguments[0]['card'];
    print(Get.arguments);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
