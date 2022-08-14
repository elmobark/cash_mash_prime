import 'package:cash_mash_prime/app/components/buttons/blue_button.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/routes/app_pages.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCardHomePage extends StatelessWidget {
  static final String path = '/addcard';
  const AddCardHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color:Colors.white,
      child: Column(
        children: [
          // Spacer(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text('Transfare to Prime account',
                style: TextStyle(
                    color: AppColors.darkBlue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
          ),
          Txt('you can press the icon below to scan the QR code for quick payment or fill the receiver details below it',
              style: TxtStyle()
                ..fontSize(18)
                ..alignment.center()
                ..textAlign.center()
                ..background.color(AppColors.blueish)
                ..padding(all: 12)
                ..borderRadius(all: 12)
                ..margin(all: 12)
                ..textColor(AppColors.darkBlue)
                ..fontWeight(FontWeight.w500)),
          Spacer(),
          Text(
            'scan the QR code',
          ),
          Image.asset(
            'assets/images/qrv.png',
            height: 200,
          ),
          Spacer(),
          Text(
            'receiver details',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'User ID or Phone Number',
                hintText: '9xxxxxxxx , #xxxxxxx',
                labelStyle: TextStyle(
                    color: AppColors.darkBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                // enabledBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: AppColors.darkBlue),
                // ),
                // focusedBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: AppColors.darkBlue),
                // ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'IPAN',
                labelStyle: TextStyle(
                    color: AppColors.darkBlue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                // enabledBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: AppColors.darkBlue),
                // ),
                // focusedBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: AppColors.darkBlue),
                // ),
              ),
            ),
          ),
          Spacer(),
          BlueButton(
              onPressed: () {
                Get.toNamed(Routes.PAYCONFORM);
              },
              title: 'Transfer'),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}