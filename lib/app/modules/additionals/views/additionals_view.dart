import 'package:cash_mash_prime/app/components/app_bar.dart';
import 'package:cash_mash_prime/app/helpers/app_styles.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/additionals_controller.dart';

class AdditionalsView extends GetView<AdditionalsController> {
  const AdditionalsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(Get.width, kToolbarHeight * 2),
            child: Row(
              children: [
                SizedBox(
                  width: 18,
                ),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                Spacer(),
                PrimeBar(),
                SizedBox(
                  width: 18,
                )
              ],
            )),
        body: ListView.builder(
          // maxOpened: 1,
          padding: EdgeInsets.all(18),

          itemBuilder: (context, index) {
            var service = controller.serives[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Card(
                elevation: 10,
                child: ExpandedTile(
                  controller: ExpandedTileController(),
                  theme: const ExpandedTileThemeData(
                      titlePadding: EdgeInsets.all(18),
                      headerColor: Colors.transparent,
                      // headerColor: Colors.green,
                      // headerRadius: 24.0,
                      // headerPadding: EdgeInsets.all(24.0),
                      // // headerSplashColor: Colors.red,
                      // //
                      // contentBackgroundColor: Colors.blue,
                      // contentPadding: EdgeInsets.all(24.0),
                      // contentRadius: 12.0,
                      contentPadding: EdgeInsets.zero),
                  // controller: controller,
                  title: service.title == ''
                      ? SvgPicture.asset(
                          service.image,
                          height: 44,
                          width: 44,
                        )
                      : Row(
                          children: [
                            SvgPicture.asset(
                              service.image,
                              height: 54,
                              width: 54,
                            ),
                            Spacer(),
                            Text(
                              service.title,
                              style: AppStyles.h1,
                            ),
                            Spacer(),
                          ],
                        ),
                  // leading: service.title == ''
                  //     ? null
                  // : SvgPicture.asset(
                  //     service.image,
                  //     height: 64,
                  //     width: 64,
                  //   ),
                  trailing: SizedBox(),
                  content: service.expanded,
                ),
              ),
            );
          },
          itemCount: controller.serives.length,
        ));
  }
}
