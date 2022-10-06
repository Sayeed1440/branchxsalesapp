import 'package:branchx/app/global_widget/circular_cancel_button.dart';
import 'package:branchx/app/global_widget/primary_button.dart';
import 'package:branchx/app/modules/material_request/bottom_sheets/reason_to_declined.dart';
import 'package:branchx/app/modules/material_request/local_widget/text_field.dart';
import 'package:branchx/app/modules/material_request/material_request_controller.dart';
import 'package:branchx/app/modules/material_request/material_request_view.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

void materialRequestBottomSheet() => Get.bottomSheet(
  barrierColor: ColorsValue.barrierColor,
  Container(
    // height: Dimens.hundred*3.28,
    width: Dimens.screenWidth,
    color: Colors.transparent,
    child: Column(
      children: [
        const Spacer(),
        const CircularCancelButton(),
        Container(
          // height: Dimens.hundred * 4.21,
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
                      'MATERIAL REQUEST DETAILS',
                      style: Styles.black14,
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                // height: Dimens.hundred * 4.88,
                width: Dimens.screenWidth,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: Dimens.fourtyEight,
                      width: Dimens.screenWidth,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Adeeb',
                                    style: Styles.blackGrey16.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff323139)),
                                  ),
                                  Text(
                                    'Sales Executive',
                                    style: Styles.black12.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff747378)),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_outlined, size: 14, color: Color(0xFf323139),),
                              const Spacer(),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Moin',
                                    style: Styles.blackGrey16.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff323139)),
                                  ),
                                  Text(
                                    'Distributor',
                                    style: Styles.black12.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff747378)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Dimens.boxHeight12,
                    const Divider(
                      color: Color(0xffE4E4E4),
                      thickness: 1,
                      height: 0,
                    ),
                    Dimens.boxHeight12,
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'MATM',
                            style: Styles.black14.copyWith(
                              color: const Color(0xff525255),
                            ),
                          ),
                          Text(
                            'Qty: 10',
                            style: Styles.black14.copyWith(
                              color: const Color(0xff525255),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Dimens.boxHeight12,
                    const Divider(
                      color: Color(0xffE4E4E4),
                      thickness: 1,
                      height: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: Dimens.sixTeen,
                                    width: Dimens.sixTeen,
                                    child: const Dot1(),
                                  ),
                                  Container(
                                    height: Dimens.twentyEight,
                                    width: Dimens.two,
                                    color: ColorsValue.pink,
                                  )
                                ],
                              ),
                              Dimens.boxWidth12,
                              Text(
                                'Sayeed (Clusters)',
                                style: Styles.blackGrey16.copyWith(height: 1, color: const Color(0xFF525255)),
                              ),
                              const Spacer(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: Dimens.sixTeen,
                                    width: Dimens.sixTeen,
                                    child: const Dot1(),
                                  ),
                                ],
                              ),
                              Dimens.boxWidth12,
                              Text(
                                'Kiran (District Head)',
                                style: Styles.blackGrey16.copyWith(height: 1, color: const Color(0xFF525255)),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                              reasonDeclinedBottomSheet();
                            },
                            child: Container(
                              height: Dimens.fourty,
                              width: Dimens.hundred * 1.38,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1, color: ColorsValue.primaryColor),
                                  color: Colors.white),
                              child: Center(
                                  child: Text(
                                    'DECLINE',
                                    style: Styles.white16.copyWith(
                                        color: ColorsValue.primaryColor,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Container(
                              height: Dimens.fourty,
                              width: Dimens.hundred * 1.38,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorsValue.loginButtonColor),
                              child: Center(
                                  child: Text('ACCEPT',
                                      style: Styles.white16
                                          .copyWith(fontWeight: FontWeight.w600))),
                            ),
                          ),
                        ],
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
  ),
);
