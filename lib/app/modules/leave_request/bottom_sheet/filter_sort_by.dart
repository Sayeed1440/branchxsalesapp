import 'package:branchx/app/global_widget/circular_cancel_button.dart';
import 'package:branchx/app/modules/leave_request/leave_request_controller.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

void leaveRequestFilterBottomSheet() => Get.bottomSheet(
  barrierColor: ColorsValue.barrierColor,
      GetBuilder<LeaveRequestController>(builder: (logic) {
        return Container(
          width: Dimens.screenWidth,
          height: Dimens.hundred * 3.03,
          color: Colors.transparent,
          child: Column(
            children: [
              const CircularCancelButton(),
              Container(
                height: Dimens.hundred * 2.51,
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
                            'FILTERS',
                            style: Styles.black14,
                          )
                        ],
                      ),
                    ),
                    for (int i = 0; i < logic.filterValues.length; i++)
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 16),
                        child: Row(
                          children: [
                            Text(
                              logic.filterValues[i],
                              style: Styles.blackGrey14,
                            ),
                            const Spacer(),
                            SizedBox(
                              height: Dimens.twenty,
                              width: Dimens.twenty,
                              child: Checkbox(
                                value: logic.filterIndex.contains(i),
                                onChanged: (value) {
                                  logic.onChangeFilter(i);
                                },
                                activeColor: ColorsValue.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Container(
                              height: Dimens.fourty,
                              width: Dimens.hundred * 1.38,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1,
                                      color: ColorsValue.primaryColor),
                                  color: Colors.white),
                              child: Center(
                                  child: Text(
                                'RESET',
                                style: Styles.white16.copyWith(
                                    color: ColorsValue.primaryColor,
                                    fontWeight: FontWeight.w600),
                              )),
                            ),
                            onTap: () {
                              logic.onResetFilter();
                            },
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
                                  child: Text('APPLY',
                                      style: Styles.white16.copyWith(
                                          fontWeight: FontWeight.w600))),
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
        );
      }),
    );

void leaveRequestSortByBottomSheet() => Get.bottomSheet(
  barrierColor: ColorsValue.barrierColor,
      GetBuilder<LeaveRequestController>(builder: (logic) {
        return Container(
          width: Dimens.screenWidth,
          color: Colors.transparent,
          child: Column(
            children: [
              const Spacer(),
              const CircularCancelButton(),
              Container(
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
                            'SORT BY',
                            style: Styles.black14,
                          )
                        ],
                      ),
                    ),
                    for (int i = 0; i < logic.sortByValues.length; i++)
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 16),
                        child:   InkWell(
                          onTap: () {
                            logic.onChangedSortBy(i);
                          },
                          child: Row(
                            children: [
                              Text(
                                logic.sortByValues[i],
                                style: Styles.blackGrey14,
                              ),
                              const Spacer(),
                              _sortByIndicator(
                                logic.sortByIndex == i
                                    ? ColorsValue.green
                                    : Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                    Dimens.boxHeight20,
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );

Widget _sortByIndicator(Color color) => Stack(
      children: [
        Container(
          height: Dimens.sixTeen,
          width: Dimens.sixTeen,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(width: 2, color: color)),
        ),
        Positioned(
          left: Dimens.four,
          right: Dimens.four,
          top: Dimens.four,
          bottom: Dimens.four,
          child: Container(
            height: Dimens.eight,
            width: Dimens.eight,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
        ),
      ],
    );
