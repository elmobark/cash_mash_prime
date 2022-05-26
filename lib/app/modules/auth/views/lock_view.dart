import 'package:cash_mash_prime/app/components/app_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LockView extends GetView {
  static final String path = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimeBar(),
      body: Center(
        child: Text(
          'LockView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
