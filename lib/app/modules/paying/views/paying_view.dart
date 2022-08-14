import 'dart:io';

import 'package:cash_mash_prime/app/components/buttons/blue_button.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/routes/app_pages.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controllers/paying_controller.dart';

class PayingView extends StatefulWidget {
  const PayingView({Key? key}) : super(key: key);

  @override
  State<PayingView> createState() => _PayingViewState();
}

class _PayingViewState extends State<PayingView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;
  @override
  void initState() {
    Future.delayed(3.seconds, () {
      Get.toNamed(Routes.PAYCONFORM);
    });
    super.initState();
  }

  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Pay the cost'),
          centerTitle: true,
        ),
        body: QRView(
          key: qrKey,
          onQRViewCreated: _onQRViewCreated,
        ));
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
