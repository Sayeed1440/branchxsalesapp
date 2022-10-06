import 'package:branchx/app/constants/icons.dart';
import 'package:branchx/app/global_widget/bordered_button.dart';
import 'package:branchx/app/global_widget/primary_button.dart';
import 'package:branchx/app/modules/leave_request/bottom_sheet/declined.dart';
import 'package:branchx/app/modules/leave_request/bottom_sheet/filter_sort_by.dart';
import 'package:branchx/app/modules/leave_request/bottom_sheet/reason_to_declined.dart';
import 'package:branchx/app/modules/leave_request/leave_request_controller.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaveRequest extends StatelessWidget {
  const LeaveRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.lightGray,
      appBar: AppBar(
        title: Text(
          'Leave Request',
          style: Styles.blackGrey16,
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GetBuilder<LeaveRequestController>(builder: (logic) {
        return ListView(
          children: [
            _searchBar(),
            Dimens.boxHeight4,
            Column(
              children: List.generate(
                  logic.leaveRequest.length,
                  (index) =>
                      _leaveRequestContainer(logic.leaveRequest[index], logic)),
            ),
            Dimens.boxHeight8,
            secondaryButton(() { }, 'LOAD MORE'),
            Dimens.boxHeight25,
          ],
        );
      }),
    );
  }

  Widget _leaveRequestContainer(String type, LeaveRequestController logic) =>
      Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 5),
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: Dimens.screenWidth,
        decoration: BoxDecoration(
            color: ColorsValue.grey,
            boxShadow: Styles.greyBoxShadow,
            gradient: Styles.greyLinearGradient,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: Dimens.fourtyEight,
              width: Dimens.screenWidth,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: Dimens.twentyFour,
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/img/profile.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Dimens.boxWidth12,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Abeeb', style: Styles.blackGrey16),
                          Text('Sales Executive',
                              style: Styles.blackGrey14
                                  .copyWith(color: const Color(0xff525255)))
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: Dimens.twentyEight,
                        width: Dimens.fifty,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: ColorsValue.primaryColor),
                        child: Center(
                            child: Text(
                          'New',
                          style: Styles.white14,
                        )),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Casual Leave',
                    style: Styles.black16.copyWith(color: Color(0xff525255)),
                  ),
                  Text(
                    '14th Mar',
                    style: Styles.black14.copyWith(color: Color(0xff525255)),
                  )
                ],
              ),
            ),
            Dimens.boxHeight12,
            const Divider(
              color: Color(0xffE4E4E4),
              thickness: 1,
              height: 0,
            ),
            Dimens.boxHeight16,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: type == 'Accepted'
                  ? BorderedButton(
                      radius: 8,
                      onPress: () {},
                      title: 'ACCEPTED',
                      height: Dimens.fourty,
                      width: Dimens.hundred * 2.95,
                      color: ColorsValue.green,
                    )
                  : type == 'Declined'
                      ? BorderedButton(
                          radius: 8,
                          onPress: () {
                            leaveRequestDeclinedBottomSheet();
                          },
                          title: 'DECLINED',
                          height: Dimens.fourty,
                          width: Dimens.hundred * 2.95,
                          color: ColorsValue.pink,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BorderedButton(
                              radius: 8,
                              onPress: () {
                                leaveRequestReasonDeclinedBottomSheet();
                              },
                              title: 'DECLINE',
                              height: Dimens.fourty,
                              width: Dimens.hundred * 1.38,
                              color: ColorsValue.primaryColor,
                            ),
                            Container(
                              height: Dimens.fourty,
                              width: Dimens.hundred * 1.38,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorsValue.loginButtonColor),
                              child: Center(
                                  child: Text('ACCEPT',
                                      style: Styles.white16.copyWith(
                                          fontWeight: FontWeight.w600))),
                            ),
                          ],
                        ),
            )
          ],
        ),
      );

  Widget _searchBar() => Container(
        height: Dimens.eighty,
        width: Dimens.screenWidth,
        color: ColorsValue.primaryColor,
        child: Center(
          child: Row(
            children: [
              Dimens.boxWidth20,
              Container(
                height: Dimens.fourtyEight,
                width: Dimens.hundred * 2.15,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                constraints: BoxConstraints(maxWidth: Dimens.screenWidth),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      size: Dimens.twenty,
                      color: const Color(0xff9A999E),
                    ),
                    Dimens.boxWidth8,
                    SizedBox(
                      width: 150,
                      child: TextField(
                        style: Styles.black16
                            .copyWith(color: const Color(0xff747378)),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                        ),
                        cursorColor: Colors.black,
                        // initialValue: value,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  leaveRequestFilterBottomSheet();
                },
                child: Container(
                  height: Dimens.fourtyEight,
                  width: Dimens.fourtyEight,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  constraints: BoxConstraints(maxWidth: Dimens.screenWidth),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: AppIcons.filter,
                ),
              ),
              Dimens.boxWidth12,
              InkWell(
                onTap: () {
                  leaveRequestSortByBottomSheet();
                },
                child: Container(
                  height: Dimens.fourtyEight,
                  width: Dimens.fourtyEight,
                  // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  constraints: BoxConstraints(maxWidth: Dimens.screenWidth),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(child: AppIcons.vector),
                ),
              ),
              Dimens.boxWidth20,
            ],
          ),
        ),
      );
}
