import 'package:cash_mash_prime/app/components/buttons/blue_button.dart';
import 'package:cash_mash_prime/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullDialogPage extends StatefulWidget {
  @override
  _FullDialogPageState createState() => _FullDialogPageState();
}

class _FullDialogPageState extends State<FullDialogPage>
    with TickerProviderStateMixin {
  late AnimationController _primary, _secondary;
  late Animation<double> _animationPrimary, _animationSecondary;

  @override
  void initState() {
    //Primaty
    _primary = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationPrimary = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _primary, curve: Curves.easeOut));
    //Secondary
    _secondary =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationSecondary = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _secondary, curve: Curves.easeOut));
    _primary.forward();
    super.initState();
  }

  @override
  void dispose() {
    _primary.dispose();
    _secondary.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoFullscreenDialogTransition(
      primaryRouteAnimation: _animationPrimary,
      secondaryRouteAnimation: _animationSecondary,
      linearTransition: true,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: kToolbarHeight,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Transaction Details',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.check_circle_rounded,
                  size: 180,
                  color: Colors.green,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Successful',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Name:',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        Text(
                          'Alex Salazar',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Phone:',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        Text(
                          '+1 (917) 585-5678',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Amount:',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        Text(
                          '73,650 SDG',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Transaction no.',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        Text(
                          '13542142301',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Date:',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        Text(
                          '17,fab,22-3:22',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Account no.',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        Text(
                          '3422224095',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {},
                      label: Text('share'),
                      icon: Icon(Icons.ios_share_outlined),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      label: Text('Save as PDF'),
                      icon: Icon(Icons.save_alt_rounded),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                BlueButton(
                    onPressed: () {
                      _primary.reverse();
                      Get.offAndToNamed(Routes.HOME);
                    },
                    title: 'Close'),
                SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
