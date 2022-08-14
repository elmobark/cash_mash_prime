import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transactions_controller.dart';

class TransactionsView extends GetView<TransactionsController> {
  TransactionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        expandedHeight: 150,
        pinned: true,
        // title: Text(
        //   'Current balance',
        //   // style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        // ),
        // actions: [
        //   Hero(
        //     tag: 'userprofile',
        //     child: CircleAvatar(
        //       backgroundImage: CachedNetworkImageProvider(
        //         'https://pbs.twimg.com/profile_images/1502550846067814403/S4vd4uIH_400x400.jpg',
        //       ),
        //       radius: 22,
        //     ),
        //   ),
        // ],

        flexibleSpace: FlexibleSpaceBar(
          //hide title on expanded

          background: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.blue,
                  AppColors.darkBlue.withOpacity(0.5),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 22,
                ),
                Text(
                  'Current balance',
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '14,222 SDG',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // title: Text('14,222 SDG'),
          // centerTitle: true,
          // title: Column(mainAxisSize: MainAxisSize.min, children: [
          // Text(
          //   'Current balance',
          //   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          // ),
          //   Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Text(
          //       '14,222 SDG',
          // style: TextStyle(
          //     color: Colors.black,
          //     fontSize: 32,
          //     fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ]),
        ),
      ),
      SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8)
            .add(EdgeInsets.only(top: 38)),
        sliver: SliverToBoxAdapter(
          child: Row(children: [
            Icon(Icons.history),
            Text(
              'Last Transactions',
            ),
          ]),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            int t = controller.transactions[index];
            print(t);
            return ListTile(
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  '${t + 100} SDG',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 10),
                Icon(
                  (t % 2 == 0)
                      ? Icons.call_made_rounded
                      : Icons.call_received_rounded,
                  color: (t % 2 == 0) ? Colors.green : Colors.red,
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
                          switch (t % 2) {
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
                      Text('#${t * 8974}')
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
          childCount: controller.transactions.length,
        ),
      )
    ]));
  }
}
