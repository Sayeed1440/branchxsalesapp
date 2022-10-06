import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({Key? key, required this.child, required this.radius, }) : super(key: key);
  final Widget child;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimens.screenWidth,
      decoration: BoxDecoration(
        boxShadow: Styles.greyBoxShadow,
        gradient: Styles.greyLinearGradient,
        borderRadius: BorderRadius.circular(radius)
      ),
      child: child,
    );
  }
}
