import 'package:cash_mash_prime/app/helpers/app_colors.dart';
import 'package:cash_mash_prime/app/modules/auth/controllers/signupcontroller.dart';
import 'package:flutter/material.dart';

enum StepType {
  optional,
  required,
  done,
}

class SignUpStepper extends StatelessWidget {
  final List<RouteSetup> steps;
  const SignUpStepper({Key? key, required this.steps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (var i = 0; i < steps.length; i++) {
      StepType step = steps[i].step;
      if (i == steps.length || i == 0) {
        children.add(buildCircle(step));
      } else {
        children.add(buildLine(step));
        children.add(buildCircle(step));
      }
    }
    return Row(
      children: children,
    );
  }

  Widget buildLine(StepType type) {
    BoxDecoration decoration;
    switch (type) {
      case StepType.optional:
      case StepType.required:
        decoration = BoxDecoration(
          color: AppColors.grey,
        );
        break;
      case StepType.done:
        decoration = BoxDecoration(color: Colors.white);
        break;
    }
    return Expanded(
        child: Container(
            width: double.infinity,
            height: 3,
            decoration:
                decoration.copyWith(borderRadius: BorderRadius.circular(3))));
  }

  Widget buildCircle(StepType type) {
    double iconSize = 7;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: () {
        switch (type) {
          case StepType.optional:
            return Icon(
              Icons.brightness_1_outlined,
              color: AppColors.grey,
              size: iconSize,
            );
          case StepType.required:
            return Icon(
              Icons.brightness_1,
              color: AppColors.grey,
              size: iconSize,
            );
          case StepType.done:
            return Icon(
              Icons.brightness_1,
              color: Colors.white,
              size: iconSize,
            );
        }
      }(),
    );
  }
}
