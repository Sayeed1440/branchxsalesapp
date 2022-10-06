import 'package:branchx/app/global_widget/dot.dart';
import 'package:branchx/app/global_widget/primary_button.dart';
import 'package:branchx/app/global_widget/select_date.dart';
import 'package:branchx/app/modules/home/bottom_sheet/filter_sort_by.dart';
import 'package:branchx/app/modules/home/home_controller.dart';
import 'package:branchx/app/modules/home/local_widget/filter_bottom_sheet.dart';
import 'package:branchx/app/modules/home/local_widget/on_board_sheet.dart';
import 'package:branchx/app/modules/home/tab_view/attendance_view.dart';
import 'package:branchx/app/modules/home/tab_view/report_view.dart';
import 'package:branchx/app/modules/material_request/bottom_sheets/reason_to_declined.dart';
import 'package:branchx/app/routes/routes_management.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:branchx/app/constants/icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (logic) {
      return Scaffold(
        backgroundColor: ColorsValue.lightGray,
        bottomSheet: Container(
          padding: const EdgeInsets.only(top: 12, left: 20, right: 20),
          height: Dimens.seventyTwo,
          width: Dimens.screenWidth,
          decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF), boxShadow: Styles.greyBoxShadow),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  logic.changeTab(0);
                },
                child: SizedBox(
                  height: Dimens.sixty,
                  width: Dimens.eightyThree,
                  child: Column(
                    children: [
                      AppIcons.home,
                      // Dimens.boxHeight9,
                      Text('Home',
                          style: Styles.black14
                              .copyWith(color: const Color(0xFF525255))),
                      Dimens.boxHeight5,
                      logic.currentTab == 0
                          ? Container(
                              height: 2,
                              width: Dimens.eightyThree,
                              color: ColorsValue.pink,
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  logic.changeTab(1);
                },
                child: SizedBox(
                  height: Dimens.sixty,
                  width: Dimens.eightyThree,
                  child: Column(
                    children: [
                      AppIcons.team,
                      Dimens.boxHeight9,
                      Text('Team',
                          style: Styles.black14
                              .copyWith(color: const Color(0xFF525255))),
                      Dimens.boxHeight5,
                      logic.currentTab == 1
                          ? Container(
                              height: 2,
                              width: Dimens.eightyThree,
                              color: ColorsValue.pink,
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  logic.changeTab(2);
                },
                child: SizedBox(
                  height: Dimens.sixty,
                  width: Dimens.eightyThree,
                  child: Column(
                    children: [
                      AppIcons.report,
                      Dimens.boxHeight9,
                      Text('Reports',
                          style: Styles.black14
                              .copyWith(color: const Color(0xFF525255))),
                      Dimens.boxHeight5,
                      logic.currentTab == 2
                          ? Container(
                              height: 2,
                              width: Dimens.eightyThree,
                              color: ColorsValue.pink,
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  logic.changeTab(3);
                },
                child: SizedBox(
                  height: Dimens.sixty,
                  width: Dimens.eightyThree,
                  child: Column(
                    children: [
                      AppIcons.attendance,
                      Dimens.boxHeight9,
                      Text('Attendance',
                          style: Styles.black14
                              .copyWith(color: const Color(0xFF525255))),
                      Dimens.boxHeight5,
                      logic.currentTab == 3
                          ? Container(
                              height: 2,
                              width: Dimens.eightyThree,
                              color: ColorsValue.pink,
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Dimens.sixtyFour),
          child: _profileTile(),
        ),
        body: SafeArea(
            child: IndexedStack(
          index: logic.currentTab,
          children: [
            ListView(
              children: [
                InkWell(
                    onTap: () {
                      RoutesManagement.goToSearchView();
                    },
                    child: _searchTile()),
                _onBoardTile(),
                _reportText(),
                CarouselSlider.builder(
                  itemCount: 3,
                  options: CarouselOptions(
                      autoPlay: false,
                      aspectRatio: 0.97,
                      enlargeCenterPage: false,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        logic.onChangedReport(index);
                      }),
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return [_onBoardingText(), _productWise(), _graph()][index];
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                          (index) => Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorsValue.pink),
                          color: logic.reportCurrent == index
                              ? ColorsValue.pink
                              : Colors.white,
                        ),
                      )),
                ),
                Dimens.boxHeight15,
                _detailReportButton(logic),
                _myTeam(),
                GetBuilder<HomeController>(
                  builder: (context) {
                    return _onPerformanceText(context);
                  }
                ),
                _userPerformanceTile(),
                _materialRequestTitle(),
                _materialRequest(),
                _recentRemarkTitle(),
                CarouselSlider.builder(
                  itemCount: 3,
                  options: CarouselOptions(
                      autoPlay: false,
                      aspectRatio: 1.9,
                      enlargeCenterPage: false,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        logic.onChangeRecent(index);
                      }),
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return _remarkContainer();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorsValue.pink),
                              color: logic.recentCurrent == index
                                  ? ColorsValue.pink
                                  : Colors.white,
                            ),
                          )),
                ),
                Dimens.boxHeight8,
                // _remarkContainer(),
                _leaveRequestTitle(),
                CarouselSlider.builder(
                  itemCount: 3,
                  options: CarouselOptions(
                      autoPlay: false,
                      aspectRatio: 1.6,
                      enlargeCenterPage: false,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        logic.onChangedLeave(index);
                      }),
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return _leaveContainer();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorsValue.pink),
                              color: logic.leaveCurrent == index
                                  ? ColorsValue.pink
                                  : Colors.white,
                            ),
                          )),
                ),
                Dimens.boxHeight8,
                _regularizationTitle(),
                CarouselSlider.builder(
                  itemCount: 3,
                  options: CarouselOptions(
                      autoPlay: false,
                      aspectRatio: 2.4,
                      enlargeCenterPage: false,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        logic.onChangedRegular(index);
                      }),
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return _regularizationContainer();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: ColorsValue.pink),
                              color: logic.regularCurrent == index
                                  ? ColorsValue.pink
                                  : Colors.white,
                            ),
                          )),
                ),
                Dimens.boxHeight40,
                Dimens.boxHeight40
              ],
            ),
            ListView(
              children: [
                _searchTeam(),
                _myTeam1(),
                _teamList(logic),
                Dimens.boxHeight40,
                Dimens.boxHeight40
              ],
            ),
            const ReportView(),
            const AttendanceView()
          ],
        )),
      );
    });
  }

  Widget _profileTile() => Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            height: Dimens.sixtyFour,
            width: Dimens.screenWidth,
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Dimens.boxWidth20,
                InkWell(
                  onTap: () {
                    RoutesManagement.goToProfileView();
                  },
                  child: CircleAvatar(
                    radius: Dimens.twenty,
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/img/profile.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Dimens.boxWidth12,
                InkWell(
                  onTap: () {
                    RoutesManagement.goToProfileView();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gaurav kumar',
                        style: Styles.blackGrey14.copyWith(height: 1.4),
                      ),
                      // Dimens.boxHeight4,
                      Text(
                        'State Head',
                        style: Styles.blackGrey14.copyWith(color: const Color(0xFF747378), height: 1.4),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    RoutesManagement.goToNotificationView();
                  },
                  child: Container(
                    height: Dimens.thirtyTwo,
                    width: Dimens.thirtyTwo,
                    decoration: BoxDecoration(
                        boxShadow: Styles.greyBoxShadow,
                        gradient: Styles.greyLinearGradient,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: AppIcons.notification,
                    ),
                  ),
                )
                // Dimens.boxWidth20,
              ],
            ),
          ),
    ],
  );

  Widget _searchTile() => Container(
        height: Dimens.eighty,
        width: Dimens.screenWidth,
        color: ColorsValue.primaryColor,
        child: Center(
          child: Container(
            height: Dimens.fourtyEight,
            width: Dimens.hundred * 3.35,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            constraints: BoxConstraints(maxWidth: Dimens.screenWidth),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  size: Dimens.twenty,
                  color: Color(0xff9A999E),
                ),
                Dimens.boxWidth8,
                Text(
                  'Search by Name,  ID,  Mob Number',
                  style: Styles.black14.copyWith(color: Color(0xff9A999E)),
                )
              ],
            ),
          ),
        ),
      );

  Widget _onBoardTile() => Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        height: Dimens.hundred * 1.64,
        width: Dimens.screenWidth,
        decoration: BoxDecoration(
            color: ColorsValue.primaryColor,
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Onboard a new Agent,\nDistributor or Master\nDistributor.',
                  style: Styles.white16.copyWith(height:1.6 ), //.copyWith(fontSize: 16),
                ),
                const Spacer(),
                SizedBox(
                    width: Dimens.hundred * 1.66,
                    height: Dimens.fourty,
                    child: PrimaryButton(
                      text: 'NEW ONBOARD',
                      onPress: () {
                        onBoardBottomSheet();
                      },
                    ))
              ],
            ),
            Dimens.boxWidth20,
            Container(
              height: Dimens.hundred,
              width: Dimens.hundred,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                      image: AssetImage('assets/img/agent.png'))),
            )
          ],
        ),
      );

  Widget _reportText() => Padding(
        padding: const EdgeInsets.only(left: 16, top: 12),
        child: Text(
          'Reports',
          style: Styles.black18.copyWith(
              fontWeight: FontWeight.w600, color: const Color(0xff525255)),
        ),
      );

  Widget _onBoardingText() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              children: [
                Text(
                  'Onboarding',
                  style: Styles.black18.copyWith(fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    selectDate();
                  },
                  child: Container(
                    height: Dimens.thirtyTwo,
                    width: Dimens.hundred * 1.52,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 0.7, color: ColorsValue.primaryColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '8 Mar - 23 Mar',
                          style: Styles.white14
                              .copyWith(color: ColorsValue.primaryColor),
                        ),
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
          ),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            height: Dimens.hundred * 3.07,
            width: Dimens.screenWidth,
            decoration: BoxDecoration(
                color: ColorsValue.grey,
                boxShadow: Styles.greyBoxShadow,
                gradient: Styles.greyLinearGradient,
                border: Styles.innerBorder,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Users',
                      style: Styles.black18.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff323139)),
                    ),
                    Text(
                      'Achived/Target',
                      style: Styles.black14,
                    )
                  ],
                ),
                Dimens.boxHeight20,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _targetTile(20, 50, 'Master Distributor'),
                    _targetTile(54, 75, 'Distributor'),
                    _targetTile(175, 250, 'Agent'),

                  ],
                ),
              ],
            ),
          )
        ],
      );

  Widget _productWise() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              children: [
                Text(
                  'Product Wise',
                  style: Styles.black18.copyWith(fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                InkWell(
                  onTap: (){
                    selectDate();
                  },
                  child: Container(
                    height: Dimens.thirtyTwo,
                    width: Dimens.hundred * 1.52,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 0.7, color: ColorsValue.primaryColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '8 Mar - 23 Mar',
                          style: Styles.white14
                              .copyWith(color: ColorsValue.primaryColor),
                        ),
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
          ),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            height: Dimens.hundred * 3.07,
            width: Dimens.screenWidth,
            decoration: BoxDecoration(
                color: ColorsValue.grey,
                boxShadow: Styles.greyBoxShadow,
                gradient: Styles.greyLinearGradient,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'LMTD',
                      style: Styles.blackGrey12,
                    ),
                    Text(
                      'Products',
                      style: Styles.blackGrey14,
                    ),
                    Text(
                      'MTD',
                      style: Styles.blackGrey12,
                    )
                  ],
                ),
                Dimens.boxHeight20,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _targetTile1(45, 50, 'DMT'),
                    _targetTile1(15, 4, 'MATM'),
                    _targetTile1(65, 12, 'Banking'),
                    _targetTile1(12, 48, 'BBPS'),
                  ],
                ),
              ],
            ),
          )
        ],
      );

  Widget _targetTile1(int per1, int per2, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.ten),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$per1%',
                style: Styles
                    .blackGrey12, //.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                title,
                style: Styles.blackGrey14,
              ),
              Text(
                '$per2%',
                style: Styles
                    .blackGrey12, //.copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),
          Dimens.boxHeight10,
          Row(
            children: [
              Expanded(
                flex: 100 - per1,

                ///.toInt(),
                child: Container(
                  height: Dimens.five,
                  decoration: BoxDecoration(
                      color: const Color(0xFFE4D8EF),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Expanded(
                flex: per1, //.toInt(),
                child: Container(
                  height: Dimens.five,
                  decoration: BoxDecoration(
                      color: ColorsValue.pink,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Dimens.boxWidth16,
              Expanded(
                flex: per2, //.toInt(),
                child: Container(
                  height: Dimens.five,
                  decoration: BoxDecoration(
                      color: ColorsValue.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Expanded(
                flex: 100 - per2,

                ///.toInt(),
                child: Container(
                  height: Dimens.five,
                  decoration: BoxDecoration(
                      color: const Color(0xFfE4D8EF),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _graph()=> Column(
    children: [
      graphTitle(),
      graphContainer(),
    ],
  );
  Widget _targetTile(int value, int target, String title) {
    double per = value / target * 100.toInt();
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.ten),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Styles.blackGrey18,
              ),
              Text(
                '$value/$target',
                style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),
          Dimens.boxHeight20,
          Row(
            children: [
              Expanded(
                flex: per.toInt(),
                child: Container(
                  height: Dimens.five,
                  decoration: BoxDecoration(
                      color: ColorsValue.pink,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Expanded(
                flex: 100 - per.toInt(),
                child: Container(
                  height: Dimens.five,
                  decoration: BoxDecoration(
                      color: ColorsValue.lightPink,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _detailReportButton(HomeController logic) => InkWell(
    onTap: (){
      logic.changeTab(2);
    },
    child: Container(
          margin: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          height: Dimens.fourty,
          width: Dimens.screenWidth,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: ColorsValue.primaryColor)),
          child: Center(
            child: Text(
              'VIEW DETAILED REPORT',
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
                'MyTeam',
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
                  Container(
                    height: Dimens.twentyEight,
                    width: Dimens.two,
                    color: Colors.white,
                  )
                ],
              ),
              Dimens.boxWidth12,
              Text(
                'Clusters',
                style: Styles.white16.copyWith(height: 1),
              ),
              const Spacer(),
              Text(
                '06',
                style: Styles.white18
                    .copyWith(fontWeight: FontWeight.w500, height: 1),
              )
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
                    child: Dot(),
                  ),
                  Container(
                    height: Dimens.twentyEight,
                    width: Dimens.two,
                    color: Colors.white,
                  )
                ],
              ),
              Dimens.boxWidth12,
              Text(
                'District Head',
                style: Styles.white16.copyWith(height: 1),
              ),
              const Spacer(),
              Text(
                '32',
                style: Styles.white18
                    .copyWith(fontWeight: FontWeight.w500, height: 1),
              )
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
                    child: Dot(),
                  ),
                  Container(
                    height: Dimens.twentyEight,
                    width: Dimens.two,
                    color: Colors.white,
                  )
                ],
              ),
              Dimens.boxWidth12,
              Text(
                'Sales Executives',
                style: Styles.white16.copyWith(height: 1),
              ),
              const Spacer(),
              Text(
                '300',
                style: Styles.white18
                    .copyWith(fontWeight: FontWeight.w500, height: 1),
              )
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
                    child: Dot(),
                  ),
                  Container(
                    height: Dimens.twentyEight,
                    width: Dimens.two,
                    color: Colors.white,
                  )
                ],
              ),
              Dimens.boxWidth12,
              Text(
                'Master Distributors',
                style: Styles.white16.copyWith(height: 1),
              ),
              const Spacer(),
              Text(
                '546',
                style: Styles.white18
                    .copyWith(fontWeight: FontWeight.w500, height: 1),
              )
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
                    child: Dot(),
                  ),
                  Container(
                    height: Dimens.twentyEight,
                    width: Dimens.two,
                    color: Colors.white,
                  )
                ],
              ),
              Dimens.boxWidth12,
              Text(
                'Distributors',
                style: Styles.white16.copyWith(height: 1),
              ),
              const Spacer(),
              Text(
                '1220',
                style: Styles.white18
                    .copyWith(fontWeight: FontWeight.w500, height: 1),
              )
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
          Dimens.boxHeight25,
          PrimaryButton(
            onPress: () {
              logic.changeTab(1);
            },
            text: 'VIEW TEAM',
          )
        ],
      ),
    );
  });

  Widget _myTeam1() => GetBuilder<HomeController>(builder: (logic) {
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
                    'MyTeam',
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
                      Container(
                        height: Dimens.twentyEight,
                        width: Dimens.two,
                        color: Colors.white,
                      )
                    ],
                  ),
                  Dimens.boxWidth12,
                  Text(
                    'Clusters',
                    style: Styles.white16.copyWith(height: 1),
                  ),
                  const Spacer(),
                  Text(
                    '06',
                    style: Styles.white18
                        .copyWith(fontWeight: FontWeight.w500, height: 1),
                  )
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
                        child: Dot(),
                      ),
                      Container(
                        height: Dimens.twentyEight,
                        width: Dimens.two,
                        color: Colors.white,
                      )
                    ],
                  ),
                  Dimens.boxWidth12,
                  Text(
                    'District Head',
                    style: Styles.white16.copyWith(height: 1),
                  ),
                  const Spacer(),
                  Text(
                    '32',
                    style: Styles.white18
                        .copyWith(fontWeight: FontWeight.w500, height: 1),
                  )
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
                        child: Dot(),
                      ),
                      Container(
                        height: Dimens.twentyEight,
                        width: Dimens.two,
                        color: Colors.white,
                      )
                    ],
                  ),
                  Dimens.boxWidth12,
                  Text(
                    'Sales Executives',
                    style: Styles.white16.copyWith(height: 1),
                  ),
                  const Spacer(),
                  Text(
                    '300',
                    style: Styles.white18
                        .copyWith(fontWeight: FontWeight.w500, height: 1),
                  )
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
                        child: Dot(),
                      ),
                      Container(
                        height: Dimens.twentyEight,
                        width: Dimens.two,
                        color: Colors.white,
                      )
                    ],
                  ),
                  Dimens.boxWidth12,
                  Text(
                    'Master Distributors',
                    style: Styles.white16.copyWith(height: 1),
                  ),
                  const Spacer(),
                  Text(
                    '546',
                    style: Styles.white18
                        .copyWith(fontWeight: FontWeight.w500, height: 1),
                  )
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
                        child: Dot(),
                      ),
                      Container(
                        height: Dimens.twentyEight,
                        width: Dimens.two,
                        color: Colors.white,
                      )
                    ],
                  ),
                  Dimens.boxWidth12,
                  Text(
                    'Distributors',
                    style: Styles.white16.copyWith(height: 1),
                  ),
                  const Spacer(),
                  Text(
                    '1220',
                    style: Styles.white18
                        .copyWith(fontWeight: FontWeight.w500, height: 1),
                  )
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

  Widget _onPerformanceText(HomeController logic) => Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Row(
          children: [
            Text(
              'Performance',
              style: Styles.black18.copyWith(fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                sortPerformanceByBottomSheet();
              },
              child: Container(
                height: Dimens.thirtyTwo,
                // width: Dimens.hundred,
                padding: EdgeInsets.symmetric(
                    horizontal: Dimens.twelve, vertical: Dimens.six),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 0.7, color: ColorsValue.primaryColor)),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(logic.performanceSortValue[logic.sortPerformanceIndex],
                      style: Styles.white14
                          .copyWith(color: ColorsValue.primaryColor),
                    ),
                    Dimens.boxWidth8,
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

  Widget _userPerformanceTile() => GetBuilder<HomeController>(builder: (logic) {
        return Container(
          margin: const EdgeInsets.all(16),
          padding:
              const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 3),
          // height: Dimens.hundred * 4.88,
          width: Dimens.screenWidth,
          decoration: BoxDecoration(
              color: ColorsValue.grey,
              boxShadow: Styles.greyBoxShadow,
              gradient: Styles.greyLinearGradient,
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      logic.onChangedPerformanceTab(0);
                    },
                    child: logic.performanceIndex != 0
                        ? Container(
                            height: Dimens.fourty,
                            width: Dimens.hundred * 1.40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 1, color: ColorsValue.primaryColor),
                                color: Colors.white),
                            child: Center(
                                child: Text(
                              'Top Performer',
                              style: Styles.white14
                                  .copyWith(color: ColorsValue.primaryColor),
                            )),
                          )
                        : Container(
                            height: Dimens.fourty,
                            width: Dimens.hundred * 1.40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorsValue.primaryColor),
                            child: Center(
                                child: Text(
                              'Top Performer',
                              style: Styles.white14,
                            )),
                          ),
                  ),
                  InkWell(
                    onTap: () {
                      logic.onChangedPerformanceTab(1);
                    },
                    child: logic.performanceIndex == 1
                        ? Container(
                            height: Dimens.fourty,
                            width: Dimens.hundred * 1.40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorsValue.primaryColor),
                            child: Center(
                                child: Text(
                              'Least Performer',
                              style: Styles.white14,
                            )),
                          )
                        : Container(
                            height: Dimens.fourty,
                            width: Dimens.hundred * 1.40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    width: 1, color: ColorsValue.primaryColor),
                                color: Colors.white),
                            child: Center(
                                child: Text(
                              'Least Performer',
                              style: Styles.white14
                                  .copyWith(color: ColorsValue.primaryColor),
                            )),
                          ),
                  )
                ],
              ),
              Dimens.boxHeight20,
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      5,
                      (index) => logic.performanceIndex == 0
                          ? SizedBox(
                              // margin: const EdgeInsets.only(bottom: 17),
                              height: Dimens.sixtyFive,
                              width: Dimens.screenWidth,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: Dimens.twentyFour,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/img/profile.jpg'),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                      Dimens.boxWidth12,
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Gaurav Singh',
                                            style: Styles.blackGrey18.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xff525255)),
                                          ),
                                          Text('Agent',
                                              style: Styles.blackGrey14
                                                  .copyWith(
                                                      color: const Color(
                                                          0xff747378)))
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '78.8%',
                                            style: Styles.blackGrey18.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xff525255)),
                                          ),
                                          Text('MTD',
                                              style: Styles.blackGrey14
                                                  .copyWith(
                                                      color: const Color(
                                                          0xff747378)))
                                        ],
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  if (index != 4)
                                    const Divider(
                                      color: Color(0xffE4E4E4),
                                      thickness: 1,
                                    )
                                ],
                              ),
                            )
                          : SizedBox(
                              // margin: const EdgeInsets.only(bottom: 17),
                              height: Dimens.sixtyFive,
                              width: Dimens.screenWidth,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: Dimens.twentyFour,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/img/profile.jpg'),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                      Dimens.boxWidth12,
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Gaurav Singh',
                                            style: Styles.blackGrey18.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xff525255)),
                                          ),
                                          Text('Agent',
                                              style: Styles.blackGrey14
                                                  .copyWith(
                                                      color: const Color(
                                                          0xff747378)))
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '15',
                                            style: Styles.blackGrey18.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xff525255)),
                                          ),
                                          Text('Achieved',
                                              style: Styles.blackGrey14
                                                  .copyWith(
                                                      color: const Color(
                                                          0xff747378)))
                                        ],
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  if (index != 4)
                                    const Divider(
                                      color: Color(0xffE4E4E4),
                                      thickness: 1,
                                    )
                                ],
                              ),
                            ))),
            ],
          ),
        );
      });

  Widget _materialRequestTitle() => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              'Material Request',
              style: Styles.blackGrey18.copyWith(
                  fontWeight: FontWeight.w600, color: const Color(0xff525255)),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                RoutesManagement.goToMaterialRequestView();
              },
              child: Container(
                height: Dimens.thirtyTwo,
                width: Dimens.seventyEight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorsValue.primaryColor),
                child: Center(
                    child: Text(
                  'View All',
                  style: Styles.white14,
                )),
              ),
            ),
          ],
        ),
      );

  Widget _materialRequest() => Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 3),
        // height: Dimens.hundred * 4.88,
        width: Dimens.screenWidth,
        decoration: BoxDecoration(
            color: ColorsValue.grey,
            boxShadow: Styles.greyBoxShadow,
            gradient: Styles.greyLinearGradient,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    3,
                    (index) => Container(
                          // margin: const EdgeInsets.only(bottom: 17),
                          height: Dimens.sixtyFive,
                          width: Dimens.screenWidth,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: Dimens.twentyFour,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/img/profile.jpg'),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  Dimens.boxWidth12,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Gaurav Singh',
                                        style: Styles.blackGrey18.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff525255)),
                                      ),
                                      Text('4 Day ago',
                                          style: Styles.blackGrey14.copyWith(
                                              color: const Color(0xff747378)))
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'MATM',
                                        style: Styles.blackGrey18.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff525255)),
                                      ),
                                      Text('Qty:10',
                                          style: Styles.blackGrey14.copyWith(
                                              color: const Color(0xff747378)))
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              if (index != 2)
                                const Divider(
                                  color: Color(0xffE4E4E4),
                                  thickness: 1,
                                )
                            ],
                          ),
                        ))),
          ],
        ),
      );

  Widget _recentRemarkTitle() => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              'Recent Remarks',
              style: Styles.blackGrey18.copyWith(
                  fontWeight: FontWeight.w600, color: const Color(0xff525255)),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                RoutesManagement.goToRemarkView();
              },
              child: Container(
                height: Dimens.thirtyTwo,
                width: Dimens.seventyEight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorsValue.primaryColor),
                child: Center(
                    child: Text(
                  'View All',
                  style: Styles.white14,
                )),
              ),
            ),
          ],
        ),
      );

  Widget _remarkContainer() => Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 5),
        padding: const EdgeInsets.symmetric(vertical: 20),
        // height: Dimens.hundred * 4.88,
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
              // height: Dimens.fourtyEight,
              width: Dimens.screenWidth,
              child: Column(
                children: [
                  Row(
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
                          Text(
                            'Kiran(Agent) has request for\nincrement in commission',
                            style: Styles.blackGrey16.copyWith(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff323139)),
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
              child: Text(
                'The commission slab on DMT transaction is same for any amount. It should be more if the amount is more',
                overflow: TextOverflow.clip,
                style: Styles.black14.copyWith(
                  color: const Color(0xff525255),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _leaveRequestTitle() => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              'Leave Request',
              style: Styles.blackGrey18.copyWith(
                  fontWeight: FontWeight.w600, color: const Color(0xff525255)),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                RoutesManagement.goToLeaveRequestView();
              },
              child: Container(
                height: Dimens.thirtyTwo,
                width: Dimens.seventyEight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorsValue.primaryColor),
                child: Center(
                    child: Text(
                  'View All',
                  style: Styles.white14,
                )),
              ),
            ),
          ],
        ),
      );

  Widget _leaveContainer() => Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 5),
        padding: const EdgeInsets.symmetric(vertical: 20),
        // height: Dimens.hundred * 4.88,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap:(){
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
                  Container(
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
                ],
              ),
            )
          ],
        ),
      );

  Widget _regularizationTitle() => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              'Regularization',
              style: Styles.blackGrey18.copyWith(
                  fontWeight: FontWeight.w600, color: const Color(0xff525255)),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                RoutesManagement.goToRegularizationView();
              },
              child: Container(
                height: Dimens.thirtyTwo,
                width: Dimens.seventyEight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorsValue.primaryColor),
                child: Center(
                    child: Text(
                  'View All',
                  style: Styles.white14,
                )),
              ),
            ),
          ],
        ),
      );

  Widget _regularizationContainer() => Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 3),
        padding: const EdgeInsets.symmetric(vertical: 20),
        // height: Dimens.hundred * 4.88,
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
                    style: Styles.black18.copyWith(
                        color: Color(0xff525255), fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
        ),
      );

  //--------------------------------------------------------------------------\\
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
