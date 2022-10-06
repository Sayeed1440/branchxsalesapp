import 'package:branchx/app/constants/icons.dart';
import 'package:branchx/app/global_widget/dot.dart';
import 'package:branchx/app/modules/home/home_controller.dart';
import 'package:branchx/app/modules/home/local_widget/filter_bottom_sheet.dart';
import 'package:branchx/app/modules/user_profile/user_profile_controller.dart';
import 'package:branchx/app/routes/routes_management.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileTeamView extends StatelessWidget {
  const UserProfileTeamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.lightGray,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        title: Text("Shiv shankar's Team", style: Styles.blackGrey16),
      ),
      body: GetBuilder<HomeController>(
        builder: (logic) {
          return ListView(
            children: [
              _searchTeam(),
              _myTeam(),
              _teamList(logic),
              Dimens.boxHeight40,
              Dimens.boxHeight40
            ],
          );
        }
      ),
    );
  }

  Widget _searchTeam() => Container(
    height: Dimens.eighty,
    width: Dimens.screenWidth,
    color: ColorsValue.primaryColor,
    child: Center(
      child: Row(
        children: [
          Dimens.boxWidth20,
          InkWell(
            onTap: (){
              RoutesManagement.goToSearchView();
            },
            child: Container(
              height: Dimens.fourtyEight,
              width: Dimens.hundred * 2.15,
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              constraints: BoxConstraints(maxWidth: Dimens.screenWidth),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: Dimens.twenty,
                    color: Color(0xff9A999E),
                  ),
                  Dimens.boxWidth8,
                  Text(
                    'Search',
                    style: Styles.black14.copyWith(color: Color(0xff9A999E)),
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              filterBottomSheet();
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
              sortByBottomSheet();
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

  Widget _teamList(HomeController logic) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
        10,
            (index) => logic.expandedIndex == index
            ? Container(
          height: Dimens.hundred * 3.14,
          width: Dimens.screenWidth,
          padding: const EdgeInsets.only(
              left: 20, right: 20, top: 12, bottom: 12),
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          decoration: BoxDecoration(
              boxShadow: Styles.greyBoxShadow,
              gradient: Styles.greyLinearGradient,
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sayeed',
                        style: Styles.blackGrey18
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Cluster Head',
                        style: Styles.black14
                            .copyWith(color: const Color(0xFF525255)),
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: Dimens.twentyNine,
                    width: Dimens.eightyOne,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          color: const Color(0xFf92BB85),
                          size: Dimens.twenty,
                        ),
                        Dimens.boxWidth4,
                        Text(
                          '40.2%',
                          style: Styles.black14.copyWith(
                              color: const Color(0xFF525255)),
                        )
                      ],
                    ),
                  ),
                  Dimens.boxWidth12,
                  InkWell(
                    onTap: () {
                      logic.onChangedExpandedIndex(-1);
                    },
                    child: Icon(
                      Icons.keyboard_arrow_up_outlined,
                      size: Dimens.twentyFour,
                      color: const Color(0xFf525255),
                    ),
                  )
                ],
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    Container(
                      height: Dimens.sixtyFive,
                      padding: const EdgeInsets.only(
                          left: 12, top: 8, bottom: 8),
                      width: Dimens.hundred * 1.15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '12',
                            style: Styles.blackGrey18.copyWith(
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'LMTD',
                            style: Styles.blackGrey18.copyWith(
                                color: const Color(0xff525255)),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: Dimens.thirtyTwo,
                      width: Dimens.thirtyTwo,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF323139)),
                      child: Center(
                          child: Text(
                            'Vs',
                            style: Styles.white12,
                          )),
                    ),
                    const Spacer(),
                    Container(
                      height: Dimens.sixtyFive,
                      padding: const EdgeInsets.only(
                          left: 12, top: 8, bottom: 8),
                      width: Dimens.hundred * 1.15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '03',
                            style: Styles.blackGrey18.copyWith(
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'MTD',
                            style: Styles.blackGrey18.copyWith(
                                color: const Color(0xff525255)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    Container(
                      height: Dimens.sixtyFive,
                      padding: const EdgeInsets.only(
                          left: 12, top: 8, bottom: 8),
                      width: Dimens.ninety,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '12',
                            style: Styles.blackGrey18.copyWith(
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Target',
                            style: Styles.blackGrey12.copyWith(
                                color: const Color(0xff525255)),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: Dimens.sixtyFive,
                      padding: const EdgeInsets.only(
                          left: 12, top: 8, bottom: 8),
                      width: Dimens.ninety,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '03',
                            style: Styles.blackGrey18.copyWith(
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Achieved',
                            style: Styles.blackGrey12.copyWith(
                                color: const Color(0xff525255)),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: Dimens.sixtyFive,
                      padding: const EdgeInsets.only(
                          left: 12, top: 8, bottom: 8),
                      width: Dimens.ninety,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '03',
                            style: Styles.blackGrey18.copyWith(
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Last Month',
                            style: Styles.blackGrey12.copyWith(
                                color: const Color(0xff525255)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _viewProfileButton()
            ],
          ),
        )
            : Container(
          height: Dimens.seventyTwo,
          width: Dimens.screenWidth,
          padding: const EdgeInsets.only(
              left: 20, right: 20, top: 12, bottom: 12),
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          decoration: BoxDecoration(
              boxShadow: Styles.greyBoxShadow,
              gradient: Styles.greyLinearGradient,
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sayeed',
                    style: Styles.blackGrey18
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Cluster Head',
                    style: Styles.black14
                        .copyWith(color: const Color(0xFF525255)),
                  )
                ],
              ),
              const Spacer(),
              Container(
                height: Dimens.twentyNine,
                width: Dimens.eightyOne,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      color: const Color(0xFf92BB85),
                      size: Dimens.twenty,
                    ),
                    Dimens.boxWidth4,
                    Text(
                      '40.2%',
                      style: Styles.black14
                          .copyWith(color: const Color(0xFF525255)),
                    )
                  ],
                ),
              ),
              Dimens.boxWidth12,
              InkWell(
                onTap: () {
                  logic.onChangedExpandedIndex(index);
                },
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: Dimens.twentyFour,
                  color: const Color(0xFf525255),
                ),
              )
            ],
          ),
        )),
  );

  Widget _viewProfileButton() => InkWell(
    onTap: () {
      RoutesManagement.goToUserProfileView();
    },
    child: Container(
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      height: Dimens.fourty,
      width: Dimens.screenWidth,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: ColorsValue.primaryColor)),
      child: Center(
        child: Text(
          'VIEW PROFILE',
          style: Styles.black14.copyWith(color: ColorsValue.primaryColor),
        ),
      ),
    ),
  );

  Widget _myTeam() => GetBuilder<HomeController>(builder: (logic) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      // height: Dimens.hundred * 3.07,
      width: Dimens.screenWidth,
      decoration: BoxDecoration(
          color: ColorsValue.grey,
          // boxShadow: Styles.greyBoxShadow,
          gradient: Styles.greenLinearGradient,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shiv Shankar's MyTeam",
                style: Styles.semiBoldWhite18,
              ),
              Container(
                height: Dimens.thirtyTwo,
                width: Dimens.hundred * 0.82,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.person,
                      color: Colors.black,
                      size: Dimens.fifteen,
                    ),
                    Dimens.boxWidth8,
                    Text(
                      '2400',
                      style: Styles.black16,
                    ),
                  ],
                ),
              )
            ],
          ),
          Dimens.boxHeight20,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: Dimens.sixTeen,
                    width: Dimens.sixTeen,
                    child: Dot(),
                  ),
                ],
              ),
              Dimens.boxWidth12,
              Text(
                'Agents',
                style: Styles.white16.copyWith(height: 1),
              ),
              const Spacer(),
              Text(
                '3062',
                style: Styles.white18
                    .copyWith(fontWeight: FontWeight.w500, height: 1),
              )
            ],
          ),
        ],
      ),
    );
  });

}
