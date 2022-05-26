import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SignupView extends GetView {
  static final String path = '/signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignupView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SignupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
