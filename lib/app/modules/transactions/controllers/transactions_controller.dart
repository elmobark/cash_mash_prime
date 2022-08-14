import 'dart:math';

import 'package:get/get.dart';

class TransactionsController extends GetxController {
  final Random r = Random(0);
  List<int> transactions = [];
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    transactions = List.generate(
      100,
      (index) {
        return r.nextInt(100);
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
