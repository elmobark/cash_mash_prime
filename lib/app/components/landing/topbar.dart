import 'package:cached_network_image/cached_network_image.dart';
import 'package:cash_mash_prime/app/helpers/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';

class LandingTopBar extends StatelessWidget {
  const LandingTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Hero(

                  tag: 'userprofile',
              child: LocalHero(
                tag: 'userprofile',
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    'https://pbs.twimg.com/profile_images/1502550846067814403/S4vd4uIH_400x400.jpg',
                  ),
                  radius: 19,
                  
                ),
              ),
            ),
          ),
          Column(
            children: [
              Text('Welcome , Ali',
                  style: AppStyles.h1.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
