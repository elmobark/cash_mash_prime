import 'package:cached_network_image/cached_network_image.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/helpers/app_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: AppColors.blueish,
      child: Column(
        children: [
          Container(
            height: kToolbarHeight * 2,
            color: AppColors.darkBlue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Hero(
                      tag: 'userprofile',
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                          'https://pbs.twimg.com/profile_images/1502550846067814403/S4vd4uIH_400x400.jpg',
                        ),
                        radius: 19,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          ))),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text('Notifications',
                        style: AppStyles.h1.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
          // TextButton(
          //     onPressed: controller.getDummyUsers, child: Text('getUsers')),
          Expanded(
            child: RefreshIndicator(
              onRefresh: controller.getDummyUsers,
              child: Obx(() {
                if (controller.isUsersLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        child: GestureDetector(
                          onTap: () {
                            // Get.toNamed(Routes.CHAT, arguments: [
                            //   {'user': controller.users[index]}
                            // ]);
                          },
                          child: Container(
                            color: Colors.white,
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 13),
                                child: Hero(
                                  tag: 'user_${controller.users[index]["id"]}',
                                  child: CircleAvatar(
                                    backgroundImage: CachedNetworkImageProvider(
                                      controller.users[index]['picture'],
                                    ),
                                    radius: 25,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        'You Recieved a 130 SDG',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        '${controller.users[index]["firstName"]} ${controller.users[index]["lastName"]}',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '2 days ago',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12),
                                ),
                              )
                            ]),
                          ),
                        ),
                      );
                    },
                    itemCount: controller.users.length,
                  );
                }
              }),
            ),
          )
        ],
      ),
    ));
  }
}
