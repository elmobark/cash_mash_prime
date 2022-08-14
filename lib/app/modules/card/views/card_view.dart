import 'package:cached_network_image/cached_network_image.dart';
import 'package:cash_mash_prime/app/components/card.dart';
import 'package:cash_mash_prime/app/components/landing/service_balt.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/card_controller.dart';

class CardView extends GetView<CardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueish,
      body: Column(
        children: [
          Parent(
            style: ParentStyle()
              ..height(kToolbarHeight * 2)
              ..padding(all: 12),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => Get.back(),
                ),
                Text('Card',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
                Spacer(),
                Hero(
                  tag: 'userprofile',
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      'https://pbs.twimg.com/profile_images/1502550846067814403/S4vd4uIH_400x400.jpg',
                    ),
                    radius: 19,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 200, child: CardItem(card: controller.card)),
          ServicBelt(),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.search_rounded),
                      Spacer(),
                      Text('Last Transactions',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return ListTile(
                        trailing:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          Text(
                            '${index + 100} SDG',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            (index % 2 == 0)
                                ? Icons.call_made_rounded
                                : Icons.call_received_rounded,
                            color: (index % 2 == 0) ? Colors.green : Colors.red,
                          )
                        ]),
                        leading: CircleAvatar(
                          backgroundColor: AppColors.grey,
                          child: Text('ZA'),
                        ),
                        title: Row(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  () {
                                    switch (index % 2) {
                                      case 0:
                                        return 'Card tnx';
                                      case 1:
                                        return 'Account tnx';
                                      default:
                                        return 'N/A';
                                    }
                                  }(),
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text('#${index * 8974}')
                              ],
                            ),
                            Spacer(),
                            Text(
                              '${DateTime.now().year.toString()}/${DateTime.now().month.toString()}/${DateTime.now().day.toString()}',
                            ),
                            Spacer()
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
