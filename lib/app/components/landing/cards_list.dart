import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cash_mash_prime/app/components/card.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/helpers/app_styles.dart';
import 'package:cash_mash_prime/app/modules/home/controllers/chat_controller.dart';
import 'package:cash_mash_prime/app/modules/home/controllers/home_controller.dart';
import 'package:cash_mash_prime/app/modules/home/views/pages/landing.dart';
import 'package:cash_mash_prime/app/routes/app_pages.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardsList extends StatelessWidget {
  const CardsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text("Your cards",
                style: AppStyles.p.copyWith(color: AppColors.darkBlue)),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Map<String, dynamic> card = cards[index];
                return GestureDetector(
                    onTap: () => Get.toNamed(Routes.CARD, arguments: [
                          {
                            "card": card,
                          }
                        ]),
                    child: CardItem(card: card));
              },
              itemCount: cards.length,
            ),
          )
        ],
      ),
    );
  }
}
