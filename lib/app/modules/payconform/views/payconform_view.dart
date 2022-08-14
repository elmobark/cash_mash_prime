import 'package:cached_network_image/cached_network_image.dart';
import 'package:cash_mash_prime/app/components/buttons/blue_button.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/modules/payconform/views/donepage.dart';
import 'package:division/division.dart';
import 'package:flutter/cupertino.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payconform_controller.dart';

class PayconformView extends GetView<PayconformController> {
  const PayconformView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conform Payment to Alex'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 50,
                backgroundImage:
                    CachedNetworkImageProvider('https://i.pravatar.cc/300'),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Name:',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            Text(
              'Alex Salazar',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Phone:',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            Text(
              '+1 (917) 585-5678',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'ID:',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            Text(
              '#123456789',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 24,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
              ),
            ),
            Spacer(),
            BlueButton(
                onPressed: () async {
                  await Get.showOverlay(
                      asyncFunction: () async {
                        await Future.delayed(Duration(seconds: 2));
                        // Get.back();
                      },
                      loadingWidget: Parent(
                          style: ParentStyle()
                            ..background.blur(30)
                            ..borderRadius(all: 0),
                          child: Center(child: CircularProgressIndicator())));
                  // CupertinoFullscreenDialogTransition(
                  //   primaryRouteAnimation: ,
                  // )
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (context, _, __) {
                        return FullDialogPage();
                      },
                    ),
                  );
                },
                title: 'Confirm'),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
