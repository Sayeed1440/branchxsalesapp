import 'package:branchx/app/constants/icons.dart';
import 'package:branchx/app/global_widget/primary_button.dart';
import 'package:branchx/app/modules/home/bottom_sheet/leave_request.dart';
import 'package:branchx/app/modules/home/bottom_sheet/regularize.dart';
import 'package:branchx/app/modules/home/home_controller.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (logic) {
      return Scaffold(
        backgroundColor: ColorsValue.lightGray,
        body: ListView(
          children: [

            _punchInOut(),
            _monthlyAttendanceReport(),
            _todayPlan(),
            _myAttendanceTitle(logic),
            _myAttendanceContainer(),
            _takeLeaveButton(),
            Dimens.boxHeight64
          ],
        ),
      );
    });
  }

  Widget _punchInOut() => Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        width: Dimens.screenWidth,
        height: Dimens.hundred * 1.41,
        decoration: BoxDecoration(
            boxShadow: Styles.greyBoxShadow,
            gradient: Styles.greyLinearGradient,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Punch In\n10:00 AM',
                      style: Styles.blackGrey14
                          .copyWith(color: const Color(0xFF747378)),
                    ),
                    Dimens.boxWidth12,
                    Text(
                      'Punch out\n--',
                      style: Styles.blackGrey14
                          .copyWith(color: const Color(0xFF747378)),
                    )
                  ],
                ),
                const Spacer(),
                SizedBox(
                    width: Dimens.hundred * 1.66,
                    height: Dimens.fourty,
                    child: Container(
                      height: Dimens.thirtySix,
                      width: Dimens.hundred * 1.47,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              width: 1, color: ColorsValue.primaryColor)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppIcons.locationProfile,
                          Dimens.boxWidth12,
                          Text(
                            'Current Location',
                            style: Styles.blackGrey12
                                .copyWith(color: ColorsValue.primaryColor),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
            Dimens.boxWidth20,

            SizedBox(
              height: 100,
              width: 100,
              child: CircularPercentIndicator(
                radius: 50,
                animation: true,
                animationDuration: 1200,
                lineWidth: 15.0,
                percent: 0.8,
                center: Container(
                  height: 75,
                  width: 75,
                  decoration: const BoxDecoration(
                      color: const Color(0xFF323139),
                      shape: BoxShape.circle
                  ),
                  child: Center(
                      child: Text(
                        'Punch\nOut',
                        style: Styles.white14,
                        textAlign: TextAlign.center,
                      )),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: const Color.fromRGBO(116, 139, 197, 0.6),
                progressColor: ColorsValue.primaryColor,
              ),
            ),
          ],
        ),
      );

  Widget _monthlyAttendanceReport() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(left: 20),
            width: Dimens.hundred,
            height: Dimens.hundred * 1.07,
            decoration: BoxDecoration(
                boxShadow: Styles.greyBoxShadow,
                gradient: Styles.greyLinearGradient,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppIcons.vectorAbsent,
                Text(
                  'Leaves',
                  style: Styles.blackGrey14
                      .copyWith(color: const Color(0xFF747378)),
                ),
                Text(
                  '02',
                  style:
                      Styles.blackGrey18.copyWith(fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: Dimens.hundred,
            height: Dimens.hundred * 1.07,
            decoration: BoxDecoration(
                boxShadow: Styles.greyBoxShadow,
                gradient: Styles.greyLinearGradient,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppIcons.absent,
                Text(
                  'Present',
                  style: Styles.blackGrey14
                      .copyWith(color: const Color(0xFF747378)),
                ),
                Text(
                  '22',
                  style:
                      Styles.blackGrey18.copyWith(fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(right: 20),
            width: Dimens.hundred,
            height: Dimens.hundred * 1.07,
            decoration: BoxDecoration(
                boxShadow: Styles.greyBoxShadow,
                gradient: Styles.greyLinearGradient,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppIcons.calender,
                Text(
                  'Total',
                  style: Styles.blackGrey14
                      .copyWith(color: const Color(0xFF747378)),
                ),
                Text(
                  '24',
                  style:
                      Styles.blackGrey18.copyWith(fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ],
      );

  Widget _todayPlan() => GetBuilder<HomeController>(builder: (logic) {
        return logic.isUploaded
            ? Container(
                margin: const EdgeInsets.all(20),
                // height: Dimens.hundred*2.47,
                width: Dimens.screenWidth,
                decoration: BoxDecoration(
                    gradient: Styles.blueLinearGradient,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Today's Plan",
                              style: Styles.white18
                                  .copyWith(fontWeight: FontWeight.w600)),
                          Text("01-Mon",
                              style: Styles.white18
                                  .copyWith(fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                      child: Text("Add your weekly plan for March's 2nd week",
                          style: Styles.white16
                              .copyWith(fontWeight: FontWeight.w400)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              weekPlanBottomSheet();
                            },
                            child: Container(
                              height: Dimens.fourty,
                              width: Dimens.hundred * 1.20,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1,
                                      color: ColorsValue.primaryColor),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: Text(
                                'SAMPLE',
                                style: Styles.black16
                                    .copyWith(color: ColorsValue.primaryColor),
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              logic.onChangedUpload();
                            },
                            child: Container(
                              height: Dimens.fourty,
                              width: Dimens.hundred * 1.20,
                              decoration: BoxDecoration(
                                  color: ColorsValue.loginButtonColor,
                                  border: Border.all(
                                      width: 1,
                                      color: ColorsValue.primaryColor),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Text('UPLOAD', style: Styles.white16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                margin: const EdgeInsets.all(20),
                // height: Dimens.hundred*2.47,
                width: Dimens.screenWidth,
                decoration: BoxDecoration(
                    gradient: Styles.blueLinearGradient,
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Today's Plan",
                              style: Styles.white18
                                  .copyWith(fontWeight: FontWeight.w600)),
                          Text("01-Mon",
                              style: Styles.white18
                                  .copyWith(fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularPercentIndicator(
                              radius: 50,
                              animation: true,
                              animationDuration: 1200,
                              lineWidth: 10.0,
                              percent: 0.8,
                              center: Container(
                                height: 65,
                                width: 65,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '3/4',
                                      style: Styles.blackGrey16,
                                    ),
                                    Text(
                                      'Agents',
                                      style: Styles.blackGrey12,
                                    )
                                  ],
                                )
                              ),
                              circularStrokeCap: CircularStrokeCap.butt,
                              backgroundColor: Colors.white,
                              progressColor: ColorsValue.pink,
                            ),
                          ),

                          // Container(
                          //   height: Dimens.ninetyEight,
                          //   width: Dimens.ninetyEight,
                          //   decoration: BoxDecoration(
                          //       shape: BoxShape.circle,
                          //       border: Border.all(
                          //           width: 10, color: ColorsValue.pink)),
                          //   child: Center(
                          //     child: Container(
                          //         height: Dimens.sixtyFive,
                          //         width: Dimens.sixtyFive,
                          //         decoration: const BoxDecoration(
                          //             shape: BoxShape.circle,
                          //             color: Colors.white),
                          //         child: Column(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.center,
                          //           children: [
                          //             Text(
                          //               '3/4',
                          //               style: Styles.blackGrey16,
                          //             ),
                          //             Text(
                          //               'Agents',
                          //               style: Styles.blackGrey12,
                          //             )
                          //           ],
                          //         )),
                          //   ),
                          // ),
                          Dimens.boxWidth20,
                          Dimens.boxWidth12,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: Styles.white14,
                              ),
                              Text(
                                'JP nagar 7th\nPhase',
                                style: Styles.white18
                                    .copyWith(fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              weekPlanBottomSheet();
                            },
                            child: Container(
                              height: Dimens.fourty,
                              width: Dimens.hundred * 1.20,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1,
                                      color: ColorsValue.primaryColor),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: Text(
                                'VIEW PLAN',
                                style: Styles.black16
                                    .copyWith(color: ColorsValue.primaryColor),
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              logic.onChangedUpload();
                            },
                            child: Container(
                              height: Dimens.fourty,
                              width: Dimens.hundred * 1.20,
                              decoration: BoxDecoration(
                                  color: ColorsValue.loginButtonColor,
                                  border: Border.all(
                                      width: 1,
                                      color: ColorsValue.primaryColor),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Text('UPDATE', style: Styles.white16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      });

  Widget _myAttendanceTitle(HomeController logic) => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 32),
        child: Row(
          children: [
            Text(
              'My Attendance',
              style: Styles.black18.copyWith(fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                sortByBottomSheet();
              },
              child: Container(
                height: Dimens.thirtyTwo,
                width: Dimens.hundred * 1.21,
                padding: EdgeInsets.symmetric(
                    horizontal: Dimens.twelve, vertical: Dimens.six),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 0.7, color: ColorsValue.primaryColor)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      logic.sortAttendance[logic.sortAttendanceIndex],
                      style: Styles.white14
                          .copyWith(color: ColorsValue.primaryColor),
                    ),
                    const Spacer(),
                    Icon(
                      CupertinoIcons.chevron_down_circle,
                      color: ColorsValue.primaryColor,
                      size: Dimens.twenty,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );

  Widget _myAttendanceContainer() => GetBuilder<HomeController>(builder: (logic) {
        return Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: Dimens.fourty,
                width: Dimens.screenWidth,
                decoration: const BoxDecoration(
                    color: ColorsValue.primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date',
                        style: Styles.white16,
                      ),
                      Text(
                        'Work hrs',
                        style: Styles.white16,
                      ),
                      Text(
                        'Status',
                        style: Styles.white16,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Colors.black12)),
                child: Column(
                  children: List.generate(
                      logic.attendanceData.length,
                      (index) => Column(
                            children: [
                              logic.expandedIndexAttendance != index
                                  ? SizedBox(
                                      height: Dimens.fifty,
                                      width: Dimens.screenWidth,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 4, right: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Checkbox(
                                                    activeColor:
                                                        const Color(0xFF7895DE),
                                                    shape: const CircleBorder(),
                                                    value: logic.attendanceData[index]
                                                        [0],
                                                    onChanged: (value) {
                                                      logic.onChangedAttendance(index, value!);
                                                    }),
                                                SizedBox(
                                                  width: Dimens.fiftyFive,
                                                  child: Text(
                                                    logic.attendanceData[index][1],
                                                    style: Styles.blackGrey14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              logic.attendanceData[index][2],
                                              style: Styles.blackGrey14,
                                            ),
                                            Dimens.boxHeight10,
                                            SizedBox(
                                              width: Dimens.sixtyFive,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: Dimens.twentyFour,
                                                    width: Dimens.twentyFour,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            logic.attendanceData[index]
                                                                        [3] ==
                                                                    'P'
                                                                ? ColorsValue.green
                                                                : logic.attendanceData[
                                                                            index][3] ==
                                                                        'A'
                                                                    ? ColorsValue.pink
                                                                    : const Color(
                                                                        0xFFFDB62F),
                                                        borderRadius:
                                                            BorderRadius.circular(8)),
                                                    child: Center(
                                                        child: Text(
                                                      logic.attendanceData[index][3],
                                                      style: Styles.white14,
                                                    )),
                                                  ),
                                                  const Spacer(),
                                                  InkWell(
                                                    onTap: () {
                                                      logic
                                                          .onChangedExpandedIndexAttendance(
                                                          index);
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                      size: Dimens.twentyFour,
                                                      color: const Color(0xFf525255),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      // height: Dimens.hundred*1.54,
                                      width: Dimens.screenWidth,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 4, right: 20),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Checkbox(
                                                        activeColor:
                                                        const Color(0xFF7895DE),
                                                        shape: const CircleBorder(),
                                                        value: logic.attendanceData[index]
                                                        [0],
                                                        onChanged: (value) {
                                                          logic.onChangedAttendance(index, value!);
                                                        }),
                                                    SizedBox(
                                                      width: Dimens.fiftyFive,
                                                      child: Text(
                                                        logic.attendanceData[index][1],
                                                        style: Styles.blackGrey14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  logic.attendanceData[index][2],
                                                  style: Styles.blackGrey14,
                                                ),
                                                Dimens.boxHeight10,
                                                SizedBox(
                                                  width: Dimens.sixtyFive,
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: Dimens.twentyFour,
                                                        width: Dimens.twentyFour,
                                                        decoration: BoxDecoration(
                                                            color:
                                                            logic.attendanceData[index]
                                                            [3] ==
                                                                'P'
                                                                ? ColorsValue.green
                                                                : logic.attendanceData[
                                                            index][3] ==
                                                                'A'
                                                                ? ColorsValue.pink
                                                                : const Color(
                                                                0xFFFDB62F),
                                                            borderRadius:
                                                            BorderRadius.circular(8)),
                                                        child: Center(
                                                            child: Text(
                                                              logic.attendanceData[index][3],
                                                              style: Styles.white14,
                                                            )),
                                                      ),
                                                      const Spacer(),
                                                      InkWell(
                                                        onTap: () {
                                                          logic
                                                              .onChangedExpandedIndexAttendance(
                                                              index);
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_outlined,
                                                          size: Dimens.twentyFour,
                                                          color: const Color(0xFf525255),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Divider(
                                            height: 0,
                                          ),
                                          logic.attendanceData[index][3] == 'P'
                                              ? punchInOut()
                                              : Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            height: Dimens.ninety,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Casual Leave',
                                                  style: Styles.blackGrey16,
                                                ),
                                                Text(
                                                  "There is a function at my home I won't be able to work",
                                                  style: Styles.blackGrey14
                                                      .copyWith(
                                                          color: const Color(
                                                              0xFF747378)),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                              const Divider(
                                height: 0,
                                thickness: 0.5,
                              )
                            ],
                          )),
                ),
              )
            ],
          ),
        );
      });

  Widget punchInOut() => Container(
    // color: Colors.white,
    margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    child: Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Punch In', style: Styles.blackGrey16,),
                Text('10:00 AM', style: Styles.blackGrey14.copyWith(color: const Color(0xFF747378)),)
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Punch Out', style: Styles.blackGrey16,),
                Text('08:00 PM', style: Styles.blackGrey14.copyWith(color: const Color(0xFF747378)),)
              ],
            )
          ],
        ),
        Dimens.boxHeight32,
        SizedBox(height:40,child: PrimaryButton(text: 'PUNCH-IN', onPress: (){},))
      ],
    ),
  );

  Widget _takeLeaveButton() => Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                takeLeaveBottomSheet();
              },
              child: Container(
                height: Dimens.fourty,
                width: Dimens.hundred * 1.58,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(width: 1, color: ColorsValue.primaryColor),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                    child: Text(
                  'TAKE LEAVE',
                  style:
                      Styles.black16.copyWith(color: ColorsValue.primaryColor),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                regularizeBottomSheet();
              },
              child: Container(
                height: Dimens.fourty,
                width: Dimens.hundred * 1.58,
                decoration: BoxDecoration(
                    color: ColorsValue.loginButtonColor,
                    // border: Border.all(width: 1, color: ColorsValue.primaryColor),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text('REGULARIZE', style: Styles.white16),
                ),
              ),
            ),
          ],
        ),
      );

  void weekPlanBottomSheet() => Get.bottomSheet(
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
                      'WEEK PLAN',
                      style: Styles.black14,
                    )
                  ],
                ),
              ),
              Container(
                width: Dimens.screenWidth,
                color: ColorsValue.lightGray,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        height: Dimens.fourty,
                        width: Dimens.screenWidth,
                        decoration: const BoxDecoration(
                            color: ColorsValue.primaryColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Date',
                                style: Styles.white16,
                              ),
                              Text(
                                'Target',
                                style: Styles.white16,
                              ),
                              Text(
                                'Location',
                                style: Styles.white16,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: List.generate(
                            5,
                            (index) => Column(
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      height: Dimens.fifty,
                                      width: Dimens.screenWidth,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '01-Mon',
                                            style: Styles.blackGrey14,
                                          ),
                                          Text(
                                            '9h 45m',
                                            style: Styles.blackGrey14,
                                          ),
                                          Text(
                                            'JPNagar 7th',
                                            style: Styles.blackGrey14,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      height: 0,
                                      thickness: 0.5,
                                    )
                                  ],
                                )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );

  void sortByBottomSheet() => Get.bottomSheet(
        barrierColor: ColorsValue.barrierColor,
        GetBuilder<HomeController>(builder: (logic) {
          return Container(
            width: Dimens.screenWidth,
            height: Dimens.hundred * 2.36,
            color: Colors.transparent,
            child: Column(
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
                        'SORT BY',
                        style: Styles.black14,
                      )
                    ],
                  ),
                ),
                Container(
                  width: Dimens.screenWidth,
                  color: ColorsValue.lightGray,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          logic.sortAttendance.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: InkWell(
                              onTap: () {
                                logic.onChangedSortAttendance(index);
                                Get.back();
                              },
                              child: Text(
                                logic.sortAttendance[index],
                                style: Styles.blackGrey16
                                    .copyWith(color: const Color(0xFf525255)),
                              ),
                            ),
                          ),
                        )),
                  ),
                )
              ],
            ),
          );
        }),
      );
}
