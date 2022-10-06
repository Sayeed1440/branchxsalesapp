

import 'package:branchx/app/global_widget/primary_button.dart';
import 'package:branchx/app/global_widget/sort_by_indicator.dart';
import 'package:branchx/app/modules/home/home_controller.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

void takeLeaveBottomSheet() => Get.bottomSheet(
  barrierColor: ColorsValue.barrierColor,
  GetBuilder<HomeController>(
    builder: (logic) {
      return Container(
        height: Dimens.hundred*4.4,
        width: Dimens.screenWidth,
        color: Colors.transparent,
        child: ListView(
          children: [
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
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Center(
                      child: Icon(
                        CupertinoIcons.clear,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
                    'LEAVE REQUEST',
                    style: Styles.black14,
                  )
                ],
              ),
            ),
            Container(
              // height: Dimens.hundred*4.28,
              color: ColorsValue.lightGray,
              child: Column(
                children: [
                  _textInputBottom('Type', logic.lea),
                  Dimens.boxHeight20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Dimens.hundred * 1.57,
                          height: Dimens.eighty,
                          child: Column(
                            children: [
                              SizedBox(
                                height: Dimens.thirtyTwo,
                                width: Dimens.screenWidth,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'From Date',
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
                                    style: Styles.black16.copyWith(
                                        color: const Color(0xff747378)),
                                    readOnly: false,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        suffixIcon: Icon(Icons.calendar_month, color: Colors.black,),
                                      hintText: '_/_/__',
                                    ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [DateInputFormatter(),]
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Dimens.hundred * 1.57,
                          height: Dimens.eighty,
                          child: Column(
                            children: [
                              SizedBox(
                                height: Dimens.thirtyTwo,
                                width: Dimens.screenWidth,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'TO Date',
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
                                    style: Styles.black16.copyWith(
                                        color: const Color(0xff747378)),
                                    readOnly: false,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        suffixIcon: Icon(Icons.calendar_month, color: Colors.black,),
                                      hintText: '_/_/__',
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [DateInputFormatter(),],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  _textInput('Reason', 'Description'),
                  Dimens.boxHeight15,
                  Container(
                      height: 40,
                      width: Dimens.screenWidth,
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: PrimaryButton(
                        text: 'REQUEST LEAVE',
                        onPress: () {},
                      ))
                ],
              ),
            )
          ],
        ),
      );
    }
  ),
);

void selectMaterialBottomSheet() => Get.bottomSheet(
    GetBuilder<HomeController>(builder: (logic) {
      return Container(
        width: Dimens.screenWidth,
        color: Colors.transparent,
        margin: EdgeInsets.only(bottom: Dimens.seventy),
        child: Column(
          children: [
            const Spacer(),
            Container(
              // height: Dimens.hundred * 2.40,
              width: Dimens.screenWidth,
              padding: const EdgeInsets.fromLTRB(20,4,20,20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Column(
                  children: List.generate(logic.leaveType.length, (index) => Padding(
                    padding:
                    const EdgeInsets.only(top: 16),
                    child:   InkWell(
                      onTap: (){
                        logic.onChangedMachineType(index);
                        Get.back();
                      },
                      child: Row(
                        children: [
                          Text(
                            logic.leaveType[index],
                            style: Styles.blackGrey14,
                          ),
                          const Spacer(),
                          sortByIndicator(logic.selectLeaveType == index?ColorsValue.green: Colors.black,)
                        ],
                      ),
                    ),
                  ),)
              ),
            )
          ],
        ),
      );
    }
    ),
    barrierColor: ColorsValue.barrierColor
);

Widget _textInputBottom(String title, String value) => Container(
  margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
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
      InkWell(
        onTap: () {
          selectMaterialBottomSheet();
        },
        child: Container(
            height: Dimens.fourtyEight,
            width: Dimens.screenWidth,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffFFFFFF)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value,style: Styles.blackGrey16.copyWith(color: const Color(0xFF747378)),),
                const Icon(Icons.arrow_drop_down_outlined, color: Colors.black,),
              ],
            )
        ),
      )
    ],
  ),
);// _textInput('Joining Date', 'DD/MM/YYYY', TextInputType.number, [DateInputFormatter(),]),
Widget _textInput(String title, String value) => Container(
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
            style: Styles.black16.copyWith(color: Color(0xff747378)),
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