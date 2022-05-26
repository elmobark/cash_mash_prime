import 'package:flutter/material.dart';

class PrimeBar extends StatelessWidget with PreferredSizeWidget {
  const PrimeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Text('CashMash')
      ]),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}