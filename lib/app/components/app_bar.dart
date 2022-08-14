import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class PrimeBar extends StatelessWidget with PreferredSizeWidget {
  const PrimeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'CashMash ',
                style: TextStyle(
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 27),
              ),
              Text(
                'Prime',
                style: TextStyle(
                    color: AppColors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 27),
              ),
            ]),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
