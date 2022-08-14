import 'package:cash_mash_prime/app/components/landing/cards_list.dart';
import 'package:cash_mash_prime/app/components/landing/last_transaction_card.dart';
import 'package:cash_mash_prime/app/components/landing/service_balt.dart';
import 'package:cash_mash_prime/app/components/landing/topbar.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLandingPage extends GetView<HomeController> {
  static final String path = '/';
  const HomeLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: AppColors.darkBlue,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.blueish,
                ),
              ),
            ),
          ],
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: kToolbarHeight,
                ),
                LandingTopBar(),
                SizedBox(
                  height: 18,
                ),
                LastTransactionsCard(),
                ServicBelt(),
                SizedBox(
                  height: 12,
                ),
                CardsList(),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

List<Map<String, dynamic>> cards = [
  {
    "id":0,
    "image":
        "https://unsplash.com/photos/E8Ufcyxz514/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8M3x8YWJzdHJhY3R8ZW58MHx8fHwxNjUzODI2Mjg3&force=true&w=640",
    "cardNumber": "4532256143411533",
    "bank": "مصرف البلد",
    "expireDate": "12/20",
    "name": "حسن محمد",
  },
  {
    "id": 1,
    "cardNumber": "4916602420033159",
    "image":
        "https://unsplash.com/photos/RAZU_R66vUc/download?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjUzODI2NTI3&force=true&w=640",
    "bank": "بنك البركة",
    "expireDate": "12/20",
    "name": "حسن محمد",
  },
  {
    "id": 2,
    "image":
        "https://unsplash.com/photos/_nWaeTF6qo0/download?force=true&w=640",
    "cardNumber": "4916559525544268",
    "bank": "بنك الصادرات",
    "expireDate": "12/20",
    "name": "حسن محمد",
  },
  {
    "id": 3,
    "cardNumber": "4539884806604558",
    "image":
        "https://unsplash.com/photos/cPccYbPrF-A/download?force=true&w=640",
    "bank": "بنك الخليج",
    "expireDate": "12/20",
    "name": "حسن محمد",
  },
  {
    "id": 4,
    "cardNumber": "4929587003500903",
    "image":
        "https://unsplash.com/photos/-xI7IFIp5Wo/download?force=true&w=640",
    "bank": "بنك النيل",
    "expireDate": "12/20",
    "name": "حسن محمد",
  },
  {
    "id": 5,
    "cardNumber": "4485285652482384",
    "image":
        "https://unsplash.com/photos/u8Jn2rzYIps/download?force=true&w=640",
    "bank": "بنك الشرق",
    "expireDate": "12/20",
    "name": "حسن محمد",
  },
];
