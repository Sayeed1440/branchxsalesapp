import 'package:branchx/app/global_widget/circular_cancel_button.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void birthdayBottomSheet() => Get.bottomSheet(
  barrierColor: ColorsValue.barrierColor,
  Container(
    width: Dimens.screenWidth,
    color: Colors.transparent,

    child: Column(
      children: [
        const Spacer(),
        SizedBox(
          height: Dimens.fifty,
          width: Dimens.screenWidth,
          child: Center(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: Dimens.fourty,
                width: Dimens.fourty,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
                child: const Center(
                  child: Icon(
                    CupertinoIcons.clear,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Dimens.boxHeight20,
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10))
          ),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          height: Dimens.hundred*1.02,
          width: Dimens.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('BirthDay', style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w500),),
              Text('Kiran Singh Birthday', style: Styles.blackGrey14.copyWith(color: const Color(0xFF525255)),)
            ],
          ),
        ),
      ],
    ),
  ),
);

void holidayBottomSheet() => Get.bottomSheet(
  barrierColor: ColorsValue.barrierColor,
  Container(
    width: Dimens.screenWidth,
    color: Colors.transparent,

    child: Column(
      children: [
        const Spacer(),
        SizedBox(
          height: Dimens.fifty,
          width: Dimens.screenWidth,
          child: Center(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: Dimens.fourty,
                width: Dimens.fourty,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
                child: const Center(
                  child: Icon(
                    CupertinoIcons.clear,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Dimens.boxHeight20,
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10))
          ),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          height: Dimens.hundred*1.02,
          width: Dimens.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Holiday', style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w500),),
              Text('Anniversary day of Bank', style: Styles.blackGrey14.copyWith(color: const Color(0xFF525255)),)
            ],
          ),
        ),
      ],
    ),
  ),
);

void loginLocationBottomSheet() => Get.bottomSheet(
  barrierColor: ColorsValue.barrierColor,
  Container(
    width: Dimens.screenWidth,
    color: Colors.transparent,

    child: Column(
      children: [
        const Spacer(),
        SizedBox(
          height: Dimens.fifty,
          width: Dimens.screenWidth,
          child: Center(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: Dimens.fourty,
                width: Dimens.fourty,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
                child: const Center(
                  child: Icon(
                    CupertinoIcons.clear,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Dimens.boxHeight20,
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10))
          ),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          height: Dimens.hundred*1.70,
          width: Dimens.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Login Location', style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w500),),
              Text('Location detail, narpa village', style: Styles.blackGrey14.copyWith(color: const Color(0xFF525255)),),
              Dimens.boxHeight25,
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Punch In', style: Styles.blackGrey16,),
                      Text('10:00 AM', style: Styles.blackGrey14.copyWith(color: const Color(0xFF747378)),)
                    ],
                  ),
                  Dimens.boxWidth60,
                  Dimens.boxWidth40,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Punch Out', style: Styles.blackGrey16,),
                      Text('08:00 PM', style: Styles.blackGrey14.copyWith(color: const Color(0xFF747378)),)
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);

void extraWorkingBottomSheet() => Get.bottomSheet(
  barrierColor: ColorsValue.barrierColor,
  Container(
    width: Dimens.screenWidth,
    color: Colors.transparent,

    child: Column(
      children: [
        const Spacer(),
        SizedBox(
          height: Dimens.fifty,
          width: Dimens.screenWidth,
          child: Center(
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: Dimens.fourty,
                width: Dimens.fourty,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
                child: const Center(
                  child: Icon(
                    CupertinoIcons.clear,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Dimens.boxHeight20,
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10))
          ),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          height: Dimens.hundred*2.25,
          width: Dimens.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Extra Working Day', style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w600, color: const Color(0xFF525255)),),
              Dimens.boxHeight25,
              Text('Login Location', style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w500),),
              Text('Location detail, narpa village', style: Styles.blackGrey14.copyWith(color: const Color(0xFF525255)),),
              Dimens.boxHeight25,
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Punch In', style: Styles.blackGrey16,),
                      Text('10:00 AM', style: Styles.blackGrey14.copyWith(color: const Color(0xFF747378)),)
                    ],
                  ),
                  Dimens.boxWidth60,
                  Dimens.boxWidth40,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Punch Out', style: Styles.blackGrey16,),
                      Text('08:00 PM', style: Styles.blackGrey14.copyWith(color: const Color(0xFF747378)),)
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);