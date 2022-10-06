import 'package:branchx/app/global_widget/circular_cancel_button.dart';
import 'package:branchx/app/global_widget/primary_button.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

void leaveRequestDeclinedBottomSheet() => Get.bottomSheet(
  barrierColor: ColorsValue.barrierColor,
  Container(
    width: Dimens.screenWidth,
    height: Dimens.hundred * 2.50,
    color: Colors.transparent,
    child: Column(
      children: [
        const CircularCancelButton(),
        Container(
          height: Dimens.hundred * 1.98,
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('There is shortage of MATM Machine it may take time to get it delivered.', style: Styles.blackGrey14.copyWith(color: const Color(0xFF525255)),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,20),
                child: PrimaryButton(text: 'GOT IT', onPress: (){Get.back();},),
              )
            ],
          ),
        )
      ],
    ),
  ),
);
