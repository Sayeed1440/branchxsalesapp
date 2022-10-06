import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget customTextInput(String title, String value, TextInputType? keyboardType,
        List<TextInputFormatter> format) =>
    Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      width: Dimens.screenWidth,
      height: Dimens.eighty,
      child: Column(
        children: [
          SizedBox(
            height: Dimens.thirtyTwo,
            width: Dimens.screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Styles.blackGrey16,
                )
              ],
            ),
          ),
          Container(
            height: Dimens.fourtyEight,
            width: Dimens.screenWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffFFFFFF)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextFormField(
                  style:
                      Styles.black16.copyWith(color: const Color(0xff747378)),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: value,
                  ),
                  // initialValue: value,
                  keyboardType: keyboardType,
                  inputFormatters: format),
            ),
          )
        ],
      ),
    );
