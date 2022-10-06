import 'package:branchx/app/constants/icons.dart';
import 'package:branchx/app/global_widget/dot.dart';
import 'package:branchx/app/global_widget/primary_button.dart';
import 'package:branchx/app/global_widget/select_date.dart';
import 'package:branchx/app/modules/notification/notification_view.dart';
import 'package:branchx/app/modules/user_profile/user_profile_controller.dart';
import 'package:branchx/app/routes/routes_management.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DistributorProfileView extends StatelessWidget {
  const DistributorProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(builder: (logic) {
      return Scaffold(
        backgroundColor: ColorsValue.lightGray,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          elevation: 0,
          title: Row(
            children: [
              Text('Shiv Kumar', style: Styles.blackGrey16),
              const Spacer(),
              Container(
                height: Dimens.thirtyTwo,
                width: Dimens.thirtyTwo,
                decoration: BoxDecoration(
                    boxShadow: Styles.greyBoxShadow,
                    gradient: Styles.greyLinearGradient,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: AppIcons.call,
                ),
              )
            ],
          ),
        ),
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _profileTile(logic),
            _reportText(),
            _onBoardingText(),
            _userTargetTile(),
            _myTeam(),
            _recentRemarkTitle(),
            CarouselSlider.builder(
              itemCount: 3,
              options: CarouselOptions(
                  autoPlay: false,
                  aspectRatio: 1.9,
                  enlargeCenterPage: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    logic.onChangedRemark(index);
                  }),
              itemBuilder: (BuildContext context, int index, int realIndex) {
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
                          color: logic.remarkCurrent == index
                              ? ColorsValue.pink
                              : Colors.white,
                        ),
                      )),
            ),
            _addRemark()
            // _materialRequestContainer()
          ],
        ),
      );
    });
  }

  Widget _profileTile(UserProfileController logic) => logic
          .showFullProfileContainer
      ? Container(
          // height: Dimens.ninety,
          width: Dimens.screenWidth,
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          decoration: BoxDecoration(
              boxShadow: Styles.greyBoxShadow,
              gradient: Styles.greyLinearGradient,
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Dimens.boxWidth20,
                    InkWell(
                      onTap: () {
                        RoutesManagement.goToMoreInfoView();
                      },
                      child: CircleAvatar(
                        radius: Dimens.twentyFive,
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/img/profile.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    Dimens.boxWidth8,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            RoutesManagement.goToMoreInfoView();
                          },
                          child: Text(
                            'Shiv kumar',
                            style: Styles.blackGrey18
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            logic.onChangedFullProfile();
                          },
                          child: Row(
                            children: [
                              Text(
                                'Master Distributor ',
                                style: Styles.black14
                                    .copyWith(color: ColorsValue.primaryColor),
                              ),
                              const Icon(
                                CupertinoIcons.chevron_down,
                                color: ColorsValue.primaryColor,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Dimens.boxWidth20,
                  ],
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
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
                            style: Styles.blackGrey16.copyWith(
                                height: 1, color: const Color(0xFF525255)),
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
                            style: Styles.blackGrey16.copyWith(
                                height: 1, color: const Color(0xFF525255)),
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
                            style: Styles.blackGrey16.copyWith(
                                height: 1, color: const Color(0xFF525255)),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      : Container(
          height: Dimens.ninety,
          width: Dimens.screenWidth,
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          decoration: BoxDecoration(
              boxShadow: Styles.greyBoxShadow,
              gradient: Styles.greyLinearGradient,
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Dimens.boxWidth20,
                InkWell(
                  onTap: () {
                    RoutesManagement.goToMoreInfoView();
                  },
                  child: CircleAvatar(
                    radius: Dimens.twentyFive,
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/img/profile.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Dimens.boxWidth8,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        RoutesManagement.goToMoreInfoView();
                      },
                      child: Text(
                        'Shiv kumar',
                        style: Styles.blackGrey18
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        logic.onChangedFullProfile();
                      },
                      child: Row(
                        children: [
                          Text(
                            'Master Distributor ',
                            style: Styles.black14
                                .copyWith(color: ColorsValue.primaryColor),
                          ),
                          const Icon(
                            CupertinoIcons.chevron_down,
                            color: ColorsValue.primaryColor,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Dimens.boxWidth20,
              ],
            ),
          ),
        );

  Widget _reportText() => Padding(
        padding: const EdgeInsets.only(top: 32.0, left: 20, right: 20),
        child: Text(
          'Reports',
          style: Styles.black18.copyWith(
              fontWeight: FontWeight.w600, color: const Color(0xff525255)),
        ),
      );

  Widget _onBoardingText() => Padding(
        padding: const EdgeInsets.only(top: 12.0, left: 20, right: 20),
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
      );

  Widget _userTargetTile() => Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 20, right: 20),
        child: Container(
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
        ),
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

  Widget _myTeam() => Container(
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
            Dimens.boxHeight25,
            PrimaryButton(
              onPress: () {
                RoutesManagement.goToUserProfileTeamView();
              },
              text: 'VIEW TEAM',
            )
          ],
        ),
      );

  Widget _addRemark() => InkWell(
        onTap: () {
          addRemarkBottomSheet();
        },
        child: Container(
          margin: const EdgeInsets.only(top: 24, left: 20, right: 20),
          height: Dimens.fourtyEight,
          width: Dimens.screenWidth,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: ColorsValue.primaryColor),
              borderRadius: BorderRadius.circular(8)),
          child: Center(
              child: Text(
            'ADD REMARKS',
            style: Styles.black16.copyWith(
                color: ColorsValue.primaryColor, fontWeight: FontWeight.w600),
          )),
        ),
      );

  Widget _textInput(String title, String value, {int num = 1}) => Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        width: Dimens.screenWidth,
        height: num == 1 ? Dimens.eighty : Dimens.hundred * 1.32,
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
              height: num == 1 ? Dimens.fourtyEight : Dimens.hundred,
              width: Dimens.screenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffFFFFFF)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextFormField(
                  maxLines: num,
                  style:
                      Styles.black16.copyWith(color: const Color(0xff747378)),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    // hintText: value,
                  ),
                  initialValue: value,
                ),
              ),
            )
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

  void addRemarkBottomSheet() => Get.bottomSheet(
    barrierColor: ColorsValue.barrierColor,
        Container(
          width: Dimens.screenWidth,
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
                      'ADD REMARKS',
                      style: Styles.black14,
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                color: ColorsValue.lightGray,
                child: Column(
                  children: [
                    _textInput('Subject', 'Add Subject'),
                    Dimens.boxHeight20,
                    _textInput('Message', 'Type here', num: 3),
                    Dimens.boxHeight16,
                    Container(
                        height: 40,
                        width: Dimens.screenWidth,
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: PrimaryButton(
                          text: 'ADD REMARKS',
                          onPress: () {},
                        ))
                  ],
                ),
              ))
            ],
          ),
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
}
