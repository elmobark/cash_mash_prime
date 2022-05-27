import 'package:cash_mash_prime/app/components/app_icon_button.dart';
import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServicBelt extends StatelessWidget {
  const ServicBelt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              child: PrimeIconButton(
                  color: AppColors.orange,
                  text: 'Pay the costs',
                  icon: Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                    size: 42,
                  ),
                  padding: PrimeIconPadding.small,
                  onPressed: () {}),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              child: PrimeIconButton(
                  color: Color(0xff4cabce),
                  text: 'Transfer',
                  icon: Icon(
                    Icons.compare_arrows_rounded,
                    color: Colors.white,
                    size: 42,
                  ),
                  padding: PrimeIconPadding.small,
                  onPressed: () {}),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              child: PrimeIconButton(
                  color: Color(0xff49d17c),
                  text: 'Services',
                  icon: SvgPicture.asset(
                    'assets/images/services.svg',
                    color: Colors.white,
                    height: 28,
                  ),
                  padding: PrimeIconPadding.medium,
                  onPressed: () {}),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              child: PrimeIconButton(
                  color: Color(0xff735fda),
                  text: 'Additionals',
                  icon: SvgPicture.asset(
                    'assets/images/settings.svg',
                    color: Colors.white,
                    height: 28,
                  ),
                  padding: PrimeIconPadding.medium,
                  onPressed: () {}),
            )
          ]),
        ),
      ),
    );
  }
}
