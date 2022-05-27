import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/helpers/app_styles.dart';
import 'package:flutter/material.dart';

enum PrimeIconPadding {
  small,
  medium,
  large,
}

class PrimeIconButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final Widget icon;
  final String? text;
  final PrimeIconPadding padding;
  const PrimeIconButton(
      {Key? key,
      required this.color,
      required this.icon,
      this.text,
      required this.padding,
      required this.onPressed})
      : super(key: key);

  double getPaddingFromPrimeIconPadding() {
    switch (padding) {
      case PrimeIconPadding.small:
        return 8;
      case PrimeIconPadding.medium:
        return 16;
      case PrimeIconPadding.large:
        return 24;
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconBuild = ClipOval(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Padding(
            padding: EdgeInsets.all(getPaddingFromPrimeIconPadding()),
            child: icon,
          ),
        ),
      ),
    );
    if (text != null) {
      return Column(
        children: [
          iconBuild,
          SizedBox(
            height: 8,
          ),
          Text(text!, style: AppStyles.p.copyWith(color: AppColors.dark)),
        ],
      );
    } else {
      return iconBuild;
    }
  }
}
