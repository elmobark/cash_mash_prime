import 'package:cached_network_image/cached_network_image.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:local_hero/local_hero.dart';

class SettingsHomePage extends StatelessWidget {
  static final String path = '/settings';
  const SettingsHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.darkBlue,
          ),
          child: Column(children: [
            Spacer(),
            LocalHero(
              tag: 'userprofile',
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  'https://pbs.twimg.com/profile_images/1502550846067814403/S4vd4uIH_400x400.jpg',
                ),
                radius: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Ali',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            )
          ]),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.blueish,
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView(children: [
                settingsItem(
                  'Messages',
                  Icon(Icons.message_rounded, color: AppColors.blue, size: 18),
                  () {},
                ),
                settingsItem(
                  'Notifications',
                  Icon(Icons.notifications_rounded,
                      color: AppColors.blue, size: 18),
                  () {
                    Get.toNamed(Routes.NOTIFICATIONS);
                  },
                ),
                settingsItem(
                  'Account Details',
                  Icon(Icons.account_box_rounded,
                      color: AppColors.blue, size: 18),
                  () {},
                ),
                settingsItem(
                  'Services History',
                  SvgPicture.asset('assets/images/services.svg',
                      color: AppColors.blue, height: 18),
                  () {},
                ),
                settingsItem(
                  'Application Settings',
                  Icon(Icons.settings_rounded, color: AppColors.blue, size: 18),
                  () {},
                ),
                SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () {
                    Get.offAndToNamed(Routes.AUTH);
                  },
                  child: Text('Logout',
                      style: TextStyle(
                          color: AppColors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w900)),
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }

  Widget settingsItem(
      [String title = '',
      Widget icon = const Icon(Icons.settings),
      VoidCallback? onPress,
      bool isDivide = true]) {
    Widget tile = GestureDetector(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              icon,
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.blue,
                ),
              ),
            ],
          ),
        ));
    if (isDivide) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          tile,
          SizedBox(
            height: 13,
          ),
          Divider(
            color: AppColors.blue,
            thickness: .3,
          )
        ],
      );
    }
    return tile;
  }
}
