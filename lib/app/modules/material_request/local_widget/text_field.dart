

import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/material.dart';

Widget textInput(String title, String value, {int num = 1}) => Container(
  margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
  width: Dimens.screenWidth,
  height: num == 1 ? Dimens.eighty : Dimens.hundred * 1.32,
  child: Column(
    children: [
      Container(
        height: num == 1 ? Dimens.fourtyEight : Dimens.hundred,
        width: Dimens.screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xffFFFFFF)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextFormField(
            maxLines: num,
            style: Styles.black16.copyWith(color: const Color(0xff747378)),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: value,
            ),
            // initialValue: value,
          ),
        ),
      )
    ],
  ),
);
