import 'package:branchx/app/constants/icons.dart';
import 'package:branchx/app/modules/home/bottom_sheet/filter_sort_by.dart';
import 'package:branchx/app/modules/team/team_controller.dart';
import 'package:branchx/app/routes/routes_management.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamView extends StatelessWidget {
  const TeamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamController>(
      builder: (logic) {
        return Scaffold(
          backgroundColor: ColorsValue.lightGray,
          appBar: AppBar(
            title: Text(logic.title, style: Styles.blackGrey16,),
            centerTitle: false,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: ListView(
            children: [
              _searchTeam(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,27,20,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(logic.title, style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w600),),
                    Container(
                      height: Dimens.thirtyTwo,
                      width: Dimens.sixtyOne,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: ColorsValue.primaryColor, width: 0.5)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppIcons.personIcon,
                          Text('06', style: Styles.blackGrey16.copyWith(color: ColorsValue.primaryColor),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              _teamList(logic),
              Dimens.boxHeight40,
              Dimens.boxHeight40
            ],
          ),
        );
      }
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
          Container(
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
                  color: const Color(0xff9A999E),
                ),
                Dimens.boxWidth8,
                Text(
                  'Search',
                  style: Styles.black14.copyWith(color: Color(0xff9A999E)),
                )
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              teamFilterBottomSheet();
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
              teamSortByBottomSheet();
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

  Widget _teamList(TeamController logic) => Column(
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
              _viewProfileButton(index)
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

  Widget _viewProfileButton(int index) => InkWell(
    onTap: () {
      if(index%2 ==0){
        RoutesManagement.goToUserProfileView();
      }
      else{
        RoutesManagement.goToDistributorUserProfileTeamView();
      }
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

}
