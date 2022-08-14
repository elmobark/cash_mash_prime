import 'package:cash_mash_prime/app/components/buttons/white_button.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdditionalsController extends GetxController {
  List<AdditionalServices> serives = [];
  @override
  void onInit() {
    super.onInit();
    serives = [
      AdditionalServices(
          image: 'assets/images/academic.svg',
          title: 'Academic',
          expanded: expanded(title: 'Academic bill')),
      AdditionalServices(
          image: 'assets/images/thunder.svg',
          title: 'electricity',
          expanded: expanded(title: 'electricity bill')),
      AdditionalServices(
          image: 'assets/images/e15.svg',
          title: 'E15',
          expanded: expanded(title: 'E15 bill')),
      AdditionalServices(
          image: 'assets/images/mtn.svg',
          title: '',
          expanded: expandedPhone(title: 'MTN bill')),
      AdditionalServices(
          image: 'assets/images/zain.svg',
          title: '',
          expanded: expandedPhone(title: 'Zain bill')),
      AdditionalServices(
          image: 'assets/images/sudani.svg',
          title: '',
          expanded: expandedPhone(title: 'Sudani bill')),
      AdditionalServices(
          image: 'assets/images/canar.svg',
          title: '',
          expanded: expandedPhone(title: 'Canar bill')),
    ];
  }

  Rx<String?> bank = Rx<String?>('fas');
  Widget expanded({required String title}) {
    return Container(
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.grey,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Please fill all feild\'s',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text('Choose Payment method', softWrap: true)),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: Obx(() => DropdownButton<String>(
                                onChanged: (value) => bank(value),
                                value: bank.value,
                                items: [
                                  DropdownMenuItem(
                                      value: 'acc',
                                      child: Text('Cash Mash Prime')),
                                  DropdownMenuItem(
                                      value: 'blad', child: Text('Blad Bank')),
                                  DropdownMenuItem(
                                      value: 'fas',
                                      child: Text('Faisal Islamic Bank')),
                                  DropdownMenuItem(
                                      value: 'BA',
                                      child: Text('Faisal Islamic Bank')),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'bill number',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'contact number',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'amount',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                WhiteButton(onPressed: () {}, title: 'PAY')
              ],
            ),
          ),
        ));
  }

  Widget expandedPhone({required String title}) {
    return Container(
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.blueish,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Please fill all feild\'s'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text('Choose payment method', softWrap: true)),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: Obx(() => DropdownButton<String>(
                                onChanged: (value) => bank(value),
                                value: bank.value,
                                items: [
                                  DropdownMenuItem(
                                      value: 'acc',
                                      child: Text('Cash Mash Prime')),
                                  DropdownMenuItem(
                                      value: 'blad', child: Text('Blad Bank')),
                                  DropdownMenuItem(
                                      value: 'fas',
                                      child: Text('Faisal Islamic Bank')),
                                  DropdownMenuItem(
                                      value: 'BA',
                                      child: Text('Faisal Islamic Bank')),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Card(
                            child: RadioListTile(
                      value: 1,
                      groupValue: 1,
                      onChanged: (v) {},
                      title: Text('prepaid'),
                    ))),
                    Expanded(
                        child: Card(
                            child: RadioListTile(
                      value: 0,
                      groupValue: 1,
                      onChanged: (v) {},
                      title: Text('postpaid'),
                    ))),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Phone number',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Amount',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                WhiteButton(onPressed: () {}, title: 'PAY')
              ],
            ),
          ),
        ));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class AdditionalServices {
  final String image;
  final String title;
  final Widget expanded;

  AdditionalServices(
      {required this.image, required this.title, required this.expanded});
}
