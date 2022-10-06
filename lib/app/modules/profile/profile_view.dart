
import 'package:branchx/app/constants/icons.dart';
import 'package:branchx/app/global_widget/dot.dart';
import 'package:branchx/app/global_widget/primary_button.dart';
import 'package:branchx/app/global_widget/select_date.dart';
import 'package:branchx/app/modules/home/home_controller.dart';
import 'package:branchx/app/modules/material_request/bottom_sheets/declined.dart';
import 'package:branchx/app/modules/notification/notification_view.dart';
import 'package:branchx/app/modules/profile/profile_controller.dart';
import 'package:branchx/app/routes/routes_management.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (logic) {
        return Scaffold(
          backgroundColor: ColorsValue.lightGray,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: false,
            elevation: 0,
            title: Row(
              children: [
                Text('My Profile',style: Styles.blackGrey16),
                const Spacer(),
                InkWell(
                  onTap: (){
                    RoutesManagement.goToEditProfileView();
                  },
                  child: Container(
                    height: Dimens.thirtyTwo,
                    width: Dimens.thirtyTwo,
                    decoration: BoxDecoration(
                        boxShadow: Styles.greyBoxShadow,
                        gradient:  Styles.greyLinearGradient,
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: AppIcons.edit,
                    ),
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
              _addMaterialRequestText(),
              Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  width: Dimens.screenWidth,
                  height: Dimens.hundred * 2.60,
                  decoration: BoxDecoration(
                      boxShadow: Styles.greyBoxShadow,
                      gradient: Styles.greyLinearGradient,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Dimens.screenWidth,
                        height: Dimens.hundred*1.60,
                        decoration: BoxDecoration(
                        color: const Color(0xFfEAC37A),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: Dimens.hundred*1.15,
                              width: Dimens.hundred*1.50,
                              decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/img/request.png'))
                              ),
                            ),
                            Container(
                              height: Dimens.eightyThree,
                              width: Dimens.eighty,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage('assets/img/card-swipe-machine.png'))
                              ),
                            ),
                          ],
                        ),
                      ),
                      PrimaryButton(onPress: (){
                        materialRequestBottomSheet(context);
                      }, text: 'ADD REQUEST',),
                    ],
                  )),
              _materialRequestTitle(),
              CarouselSlider.builder(
                itemCount: 3,
                options: CarouselOptions(
                    autoPlay: false,
                    aspectRatio: 1.5,
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      logic.onChangedDeclined(index);
                    }
                ), itemBuilder: (BuildContext context, int index, int realIndex) { return _materialRequestContainer(); },
              ),
              // Dimens.boxHeight10,
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: ColorsValue.pink),
                      color: logic.declined == index
                          ? ColorsValue.pink
                          : Colors.white,
                    ),)),),
              ),
              Container(
                height: 43,
                width: Dimens.screenWidth,
                color: ColorsValue.lightGray,
              )

            ],
          ),
        );
      }
    );
  }

  Widget _profileTile(ProfileController logic) => logic
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
              //
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
                          'Cluster Head ',
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
                      'Cluster Head ',
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
    padding: const EdgeInsets.only(top:32.0, left: 20, right: 20),
    child: Text(
      'Reports',
      style: Styles.black18.copyWith(fontWeight: FontWeight.w600, color: const Color(0xff525255)),
    ),
  );

  Widget _onBoardingText() => Padding(
    padding: const EdgeInsets.only(top:12.0, left: 20, right: 20),
    child: Row(
      children: [
        Text(
          'Onboarding',
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
                border:
                Border.all(width: 0.7, color: ColorsValue.primaryColor)),
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
    padding: const EdgeInsets.only(top:16.0, left: 20, right: 20),
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
                style: Styles.black18.copyWith(fontWeight: FontWeight.w600, color: const Color(0xff323139)),
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
            Text('Clusters',
              style: Styles.white16.copyWith(height: 1),

            ),
            const Spacer(),
            Text('06', style: Styles.white18.copyWith(fontWeight: FontWeight.w500, height: 1),)

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
            Text('District Head',
              style: Styles.white16.copyWith(height: 1),

            ),
            const Spacer(),
            Text('32', style: Styles.white18.copyWith(fontWeight: FontWeight.w500, height: 1),)

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
            Text('Sales Executives',
              style: Styles.white16.copyWith(height: 1),

            ),
            const Spacer(),
            Text('300', style: Styles.white18.copyWith(fontWeight: FontWeight.w500, height: 1),)

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
            Text('Master Distributors',
              style: Styles.white16.copyWith(height: 1),

            ),
            const Spacer(),
            Text('546', style: Styles.white18.copyWith(fontWeight: FontWeight.w500, height: 1),)

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
            Text('Distributors',
              style: Styles.white16.copyWith(height: 1),

            ),
            const Spacer(),
            Text('1220', style: Styles.white18.copyWith(fontWeight: FontWeight.w500, height: 1),)

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
                // Container(
                //   height: Dimens.twentyEight,
                //   width: Dimens.two,
                //   color: Colors.white,
                // )
              ],
            ),
            Dimens.boxWidth12,
            Text('Agents',
              style: Styles.white16.copyWith(height: 1),

            ),
            const Spacer(),
            Text('3062', style: Styles.white18.copyWith(fontWeight: FontWeight.w500, height: 1),)

          ],
        ),
        Dimens.boxHeight25,
        PrimaryButton(onPress: (){
          Get.back();
          Get.find<HomeController>().changeTab(1);
        }, text: 'VIEW TEAM',),
      ],
    ),
  );

  Widget _addMaterialRequestText() => Padding(
    padding: const EdgeInsets.only(top: 32,left: 20,bottom: 16),
    child: Text(
      'Add Material Request',
      style: Styles.black18.copyWith(fontWeight: FontWeight.w600),
    ),
  );

  Widget _materialRequestTitle() => Padding(
    padding: const EdgeInsets.only(top: 32, left: 20, right: 20),
    child: Row(
      children: [
        Text('Request History', style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w600, color: const Color(0xff525255)),),
        const Spacer(),
        InkWell(
          onTap: (){
            RoutesManagement.goToMaterialRequestView();
          },
          child: Container(
            height: Dimens.thirtyTwo,
            width: Dimens.seventyEight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorsValue.primaryColor
            ),
            child: Center(child: Text('View All', style: Styles.white14,)),
          ),
        ),
      ],
    ),
  );

  Widget _materialRequestContainer() => Container(
    margin: const EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 10),
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
                              image: AssetImage('assets/img/profile.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Dimens.boxWidth12,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gaurav Singh', style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w500, color: const Color(0xff525255)),),
                      Text('4 Day ago', style:Styles.blackGrey14.copyWith(color: const Color(0xff747378)))
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('MATM', style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w500, color: const Color(0xff525255)),),
                      Text('Qty:10', style:Styles.blackGrey14.copyWith(color: const Color(0xff747378)))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        // Dimens.boxHeight12,
        const Divider(color: Color(0xffE4E4E4), thickness: 1, height: 0,),
        Dimens.boxHeight12,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text('There is a shortage of MATM Machine it may take time to get it delivered', style: Styles.black16.copyWith(color:  Color(0xff525255)),),
        ),
        Dimens.boxHeight12,
        const Divider(color: Color(0xffE4E4E4), thickness: 1, height: 0,),
        Dimens.boxHeight16,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('2 Day Ago', style: Styles.blackGrey14.copyWith(color: const Color(0xff525255)),),
              InkWell(
                onTap: (){
                  declinedBottomSheet();
                },
                child: Container(
                  height: Dimens.twentyEight,
                  width: Dimens.seventyEight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: ColorsValue.pink
                  ),
                  child: Center(child: Text('Declined', style: Styles.white12),
                ),),
              )
            ],
          ),
        )
      ],
    ),
  );

  void materialRequestBottomSheet(BuildContext context) => Get.bottomSheet(
      barrierColor: ColorsValue.barrierColor,
    GetBuilder<ProfileController>(
      builder: (logic) {
        return Container(
        width: Dimens.screenWidth,
        color: Colors.transparent,
        child: ListView(
          children: [
            // const Spacer(),
            SizedBox(
              height: Dimens.fifty,
              width: Dimens.screenWidth,
              child: Center(
                child: InkWell(
                  onTap: (){
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
              // height: Dimens.hundred * 4.21,
              width: Dimens.screenWidth,
              color: Colors.white,
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
                          'MATERIAL REQUEST',
                          style: Styles.black14,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: Dimens.screenWidth,
                    height: Dimens.hundred * 3.61,
                    color: ColorsValue.lightGray,
                    child: Column(
                      children: [
                        _textInputBottom('Material', logic.machine,),
                        _textInput('Quantity', '', TextInputType.number, [LengthLimitingTextInputFormatter(3),]),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Item', style: Styles.black16),
                                  Text('200', style: Styles.black18.copyWith(color: Color(0xff525255), fontWeight: FontWeight.w600),)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('GST(10%)', style: Styles.black16),
                                  Text('20', style: Styles.black18.copyWith(color: Color(0xff525255), fontWeight: FontWeight.w600),)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total Price', style: Styles.black16),
                                  Text('2000', style: Styles.black18.copyWith(color: Color(0xff525255), fontWeight: FontWeight.w600),)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: PrimaryButton(
                            onPress: () {
                              Get.back();
                            },
                            text: 'ADD REQUEST',
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
      }
    ),);

  void selectMaterialBottomSheet() => Get.bottomSheet(
      GetBuilder<ProfileController>(builder: (logic) {
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
                    children: List.generate(logic.machineType.length, (index) => Padding(
                      padding:
                      const EdgeInsets.only(top: 16),
                      child: Row(
                        children: [
                          Text(
                            logic.machineType[index],
                            style: Styles.blackGrey14,
                          ),
                          const Spacer(),
                          InkWell(
                              onTap: (){
                                logic.onChangedMachineType(index);
                              },
                              child: _sortByIndicator(logic.selectedMachine == index?ColorsValue.green: Colors.black,))
                        ],
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

  Widget _sortByIndicator(Color color)=>Stack(
    children: [
      Container(
        height: Dimens.sixTeen,
        width: Dimens.sixTeen,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
                width: 2, color: color)),
      ),
      Positioned(
        left: Dimens.four,
        right: Dimens.four,
        top: Dimens.four,
        bottom: Dimens.four,
        child: Container(
          height: Dimens.eight,
          width: Dimens.eight,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color),
        ),
      ),
    ],
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

  Widget _textInput(String title, String value, TextInputType? keyboardType, List<TextInputFormatter> format) => Container(
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
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  // hintText: value,
                ),
                initialValue: value,
                keyboardType: keyboardType,
                inputFormatters: format
            ),
          ),
        )
      ],
    ),
  );

}
