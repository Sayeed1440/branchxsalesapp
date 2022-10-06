import 'package:branchx/app/constants/icons.dart';
import 'package:branchx/app/global_widget/dot.dart';
import 'package:branchx/app/global_widget/primary_button.dart';
import 'package:branchx/app/routes/routes_management.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.lightGray,
      appBar: AppBar(
        title: Text(
          'Notification',
          style: Styles.blackGrey16,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: (){
              RoutesManagement.goToMaterialRequestView();
            },
              child: _notificationTile(AppIcons.inbox, '12 New', 'Material Requests')),
          InkWell(
              onTap: (){
                RoutesManagement.goToLeaveRequestView();
              },child: _notificationTile(AppIcons.airplane, '25 New', 'leave Requests')),
          InkWell(
              onTap: (){
                RoutesManagement.goToRemarkView();
              },child: _notificationTile(AppIcons.caution, '12 New', 'Remarks')),
          _allNotification(),
          Dimens.boxHeight8,
          secondaryButton(() { }, 'LOAD MORE'),
          Dimens.boxHeight25,
        ],
      ),
    );
  }

  Widget _notificationTile(Widget icon, String value, String title) => Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        height: Dimens.eighty,
        width: Dimens.screenWidth,
        decoration: BoxDecoration(
            boxShadow: Styles.greyBoxShadow,
            gradient: Styles.greyLinearGradient,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(
              height: Dimens.fourty,
              width: Dimens.fourty,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: ColorsValue.pink)),
              child: Center(
                child: icon,
              ),
            ),
            Dimens.boxWidth12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Styles.blackGrey16,
                ),
                Text(
                  '2 Days ago',
                  style:
                      Styles.black12.copyWith(color: const Color(0xff747378)),
                )
              ],
            ),
            const Spacer(),
            Container(
              height: Dimens.twentyEight,
              width: Dimens.fiftySix,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: ColorsValue.pink),
              child: Center(
                child: Text(value, style: Styles.white12),
              ),
            )
          ],
        ),
      );

  Widget _allNotification() => Container(
        width: Dimens.screenWidth,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            boxShadow: Styles.greyBoxShadow,
            gradient: Styles.greyLinearGradient,
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            InkWell(onTap:(){newMemberJoined();},child: _allNotificationTile(AppIcons.groupX, 'New Member Joined')),
            InkWell(onTap:(){announcement();}, child: _allNotificationTile(AppIcons.groupX, 'Birth Day Celebration')),
            InkWell(onTap:(){newMemberJoined();},child: _allNotificationTile(AppIcons.groupX, 'New Member Joined')),
            InkWell(onTap:(){newMemberJoined();},child: _allNotificationTile(AppIcons.groupX, 'New Member Joined')),
            InkWell(onTap:(){newMemberJoined();},child: _allNotificationTile(AppIcons.groupX, 'New Member Joined')),
            InkWell(onTap:(){newMemberJoined();},child: _allNotificationTile(AppIcons.groupX, 'New Member Joined')),
            InkWell(onTap:(){newMemberJoined();},child: _allNotificationTile(AppIcons.groupX, 'Regularization'))
          ],
        ),
      );

  Widget _allNotificationTile(Widget icon, String title) => Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 16),
            height: Dimens.fiftySix,
            width: Dimens.screenWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: Dimens.fourty,
                  width: Dimens.fourty,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: icon,
                  ),
                ),
                Dimens.boxWidth12,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: Styles.blackGrey16,
                    ),
                    Text(
                      '2 Days ago',
                      style: Styles.black12
                          .copyWith(color: const Color(0xff747378)),
                    )
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
          const Divider(
            thickness: 0.1,
            color: ColorsValue.blackGrey,
            height: 10,
          ),
        ],
      );

  void newMemberJoined() => Get.bottomSheet(
    barrierColor: ColorsValue.barrierColor,
        Container(
          height: Dimens.hundred*3.28,
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
                            'ANNOUNCEMENT',
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
                                          'Birth Day Celebration',
                                          style: Styles.blackGrey16.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xff323139)),
                                        ),
                                        Text(
                                          '12th July 2022',
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
                            child: Text(
                              'Today is the Birthday of Rahul Patil, take some time & have some wishes',
                              style: Styles.black14.copyWith(
                                color: const Color(0xff525255),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: PrimaryButton(onPress: (){}, text: 'SEND NOW',),
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

  void announcement() => Get.bottomSheet(
    barrierColor: ColorsValue.barrierColor,
    Container(
      // height: Dimens.hundred*3.28,
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
                        'ANNOUNCEMENT',
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
                                      'New Member Joined',
                                      style: Styles.blackGrey16.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff323139)),
                                    ),
                                    Text(
                                      '2 Day Ago',
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
                        child: Text(
                          'Shiv Shankar has join your team as a sales executive',
                          style: Styles.black14.copyWith(
                            color: const Color(0xff525255),
                          ),
                        ),
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
                        padding: const EdgeInsets.all(20),
                        child: PrimaryButton(onPress: (){}, text: 'VIEW PROFILE',),
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
}

class Dot1 extends StatelessWidget {
  const Dot1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Dimens.sixTeen,
          width: Dimens.sixTeen,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(width: 2, color: ColorsValue.pink)),
        ),
        Positioned(
          left: Dimens.four,
          right: Dimens.four,
          top: Dimens.four,
          bottom: Dimens.four,
          child: Container(
            height: Dimens.eight,
            width: Dimens.eight,
            decoration:const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsValue.pink
            ),
          ),
        ),
      ],
    );
  }
}
