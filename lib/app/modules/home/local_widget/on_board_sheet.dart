import 'package:branchx/app/constants/icons.dart';
import 'package:branchx/app/global_widget/primary_button.dart';
import 'package:branchx/app/modules/home/home_controller.dart';
import 'package:branchx/app/routes/routes_management.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void onBoardBottomSheet() => Get.bottomSheet(
      GetBuilder<HomeController>(builder: (logic) {
        return Container(
          height: Dimens.hundred * 3.10,
          width: Dimens.screenWidth,
          color: Colors.transparent,
          child: Column(
            children: [
              SizedBox(
                height: Dimens.sixty,
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
                height: Dimens.hundred * 2.5,
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
                            'Select User Type',
                            style: Styles.black14,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      width: Dimens.screenWidth,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap:(){
                                  logic.onChangeUsertype(0);
                                },
                                child: Container(
                                  height: Dimens.hundred,
                                  width: Dimens.ninety,
                                  decoration: logic.usertype == 0
                                      ?BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: Styles.greyLinearGradient,
                                      boxShadow: Styles.greyBoxShadow,
                                      border: Border.all(
                                          width: 1,
                                          color: ColorsValue.primaryColor)):BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          gradient: Styles.greyLinearGradient,
                                          boxShadow: Styles.greyBoxShadow),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      AppIcons.userType1,
                                      Dimens.boxHeight10,
                                      Text(
                                        'Master',
                                        style: Styles.black12.copyWith(
                                            color: logic.usertype == 0
                                                ? ColorsValue.primaryColor
                                                : const Color(0xff525255)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap:(){
                                  logic.onChangeUsertype(1);
                                },
                                child: Container(
                                  height: Dimens.hundred,
                                  width: Dimens.ninety,
                                  decoration:  logic.usertype == 1
                                      ?BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: Styles.greyLinearGradient,
                                      boxShadow: Styles.greyBoxShadow,
                                      border: Border.all(
                                          width: 1,
                                          color: ColorsValue.primaryColor)):BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: Styles.greyLinearGradient,
                                      boxShadow: Styles.greyBoxShadow),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      AppIcons.userType2,
                                      Dimens.boxHeight10,
                                      Text(
                                        'Distributor',
                                        style: Styles.black12.copyWith(
                                            color: const Color(0xff525255)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap:(){
                                  logic.onChangeUsertype(2);
                                },
                                child: Container(
                                  height: Dimens.hundred,
                                  width: Dimens.ninety,
                                  decoration:  logic.usertype == 2
                                      ?BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: Styles.greyLinearGradient,
                                      boxShadow: Styles.greyBoxShadow,
                                      border: Border.all(
                                          width: 1,
                                          color: ColorsValue.primaryColor)):BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: Styles.greyLinearGradient,
                                      boxShadow: Styles.greyBoxShadow),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      AppIcons.userType3,
                                      Dimens.boxHeight10,
                                      Text(
                                        'Agent',
                                        style: Styles.black12.copyWith(
                                            color: const Color(0xff525255)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
                            child: PrimaryButton(
                              onPress: () {
                                RoutesManagement.goToonBoardView(logic.usertype);
                              },
                              text: 'SELECT USER',
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
