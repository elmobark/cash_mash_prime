import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RecoveryView extends GetView {
  static final String path = '/recovery';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RecoveryView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RecoveryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
