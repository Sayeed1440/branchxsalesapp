
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/material.dart';

Widget sortByIndicator(Color color)=>Stack(
  children: [
    Container(
      height: Dimens.sixTeen,
      width: Dimens.sixTeen,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
              width: 2, color: color)),
    ),
    Positioned(
      left: Dimens.four,
      right: Dimens.four,
      top: Dimens.four,
      bottom: Dimens.four,
      child: Container(
        height: Dimens.eight,
        width: Dimens.eight,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color),
      ),
    ),
  ],
);