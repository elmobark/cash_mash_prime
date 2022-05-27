import 'package:bubble/bubble.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/helpers/app_styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueish,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.grey)),
        title: Row(
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(controller.user["firstName"],
                      style: AppStyles.h1.copyWith(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text('Offline',
                      style: AppStyles.h1.copyWith(
                          color: Colors.black26,
                          fontSize: 10,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            Hero(
              tag: 'user_${controller.user["id"]}',
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  controller.user['picture'] ?? '',
                ),
                radius: 19,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.center,
              child: Bubble(
                margin: BubbleEdges.only(top: 10),
                nip: BubbleNip.no,
                color: Color.fromRGBO(212, 234, 244, 1.0),
                child: Text('4 days ago',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11.0)),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Bubble(
                margin: BubbleEdges.only(top: 10),
                nip: BubbleNip.rightBottom,
                color: AppColors.darkBlue,
                child: Text('Hello, ${controller.user["firstName"]}',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    height: 160,
                    width: 160,
                    imageUrl: controller.user['picture'],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Bubble(
                margin: BubbleEdges.all(0),
                nip: BubbleNip.leftBottom,
                color: AppColors.grey,
                child: Text(
                  'Hi, Ali ! , long time no see',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Bubble(
                margin: BubbleEdges.only(top: 10),
                nip: BubbleNip.no,
                color: Color.fromRGBO(212, 234, 244, 1.0),
                child: Text('Today',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11.0)),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Bubble(
                margin: BubbleEdges.only(top: 10),
                nip: BubbleNip.rightBottom,
                color: AppColors.darkBlue,
                child: Text('look at my profile image, it\'s 3D ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    height: 160,
                    width: 160,
                    imageUrl:
                        'https://pbs.twimg.com/profile_images/1502550846067814403/S4vd4uIH_400x400.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Bubble(
                margin: BubbleEdges.all(0),
                nip: BubbleNip.leftBottom,
                
                color: AppColors.grey,
                child: Text(
                  'i Like it',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xff2e517a).withOpacity(.12),
              blurRadius: 30,
              spreadRadius: 5,
              offset: Offset(0, -5),
            )
          ],
        ),
        child: Row(children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.attachment_rounded,
                color: AppColors.grey,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.tag_faces_rounded,
                color: AppColors.grey,
              )),
          Expanded(
              child: TextFormField(
            decoration: InputDecoration(
                hintText: 'Type someting', border: InputBorder.none),
          )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send_rounded,
                color: AppColors.darkBlue,
              )),
        ]),
      ),
    );
  }
}
