

import 'package:branchx/app/global_widget/circular_cancel_button.dart';
import 'package:branchx/app/global_widget/primary_button.dart';
import 'package:branchx/app/modules/material_request/local_widget/text_field.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

void reasonDeclinedBottomSheet() => Get.bottomSheet(
  barrierColor: ColorsValue.barrierColor,
  Container(
    width: Dimens.screenWidth,
    height: Dimens.hundred * 3.03,
    color: Colors.transparent,
    child: ListView(
      children: [
        const CircularCancelButton(),
        Container(
          height: Dimens.hundred * 2.52,
          width: Dimens.screenWidth,
          color: ColorsValue.lightGray,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: Dimens.fourty,
                width: Dimens.screenWidth,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'REASON TO DECLINE',
                      style: Styles.black14,
                    )
                  ],
                ),
              ),
              textInput('', 'Type here', num: 3),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: PrimaryButton(
                  text: 'SUBMIT',
                  onPress: () {

                  },
                ),
              )
            ],
          ),
        )
      ],
    ),
  ),
);
