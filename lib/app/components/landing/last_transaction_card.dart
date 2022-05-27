import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/helpers/app_styles.dart';
import 'package:flutter/material.dart';

class LastTransactionsCard extends StatelessWidget {
  const LastTransactionsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0xff2e517a).withOpacity(.12),
              blurRadius: 30,
              spreadRadius: 5,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(children: [
            Row(
              children: [
                Text('Last Transactions',
                    style: AppStyles.p.copyWith(color: AppColors.darkBlue)),
                Spacer(),
                Icon(Icons.more_horiz, color: AppColors.grey),
              ],
            ),
            transactionItem(
                cardNumber: '*37265', cost: '350', title: 'رصيد زين (مقدم)'),
            Divider(),
            transactionItem(
                cardNumber: '*37264', cost: '3,750', title: 'شراء كهرباء'),
          ]),
        ),
      ),
    );
  }

  Widget transactionItem(
      {required String title,
      required String cost,
      required String cardNumber}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppStyles.p.copyWith(color: AppColors.blue)),
              SizedBox(
                height: 10,
              ),
              Text(cardNumber,
                  style: AppStyles.p.copyWith(color: AppColors.grey)),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text('$cost SDG',
                style: AppStyles.p.copyWith(
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
          ),
          Icon(Icons.arrow_forward_ios, color: AppColors.grey, size: 13),
        ],
      ),
    );
  }
}
