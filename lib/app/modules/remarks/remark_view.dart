import 'package:branchx/app/constants/icons.dart';
import 'package:branchx/app/global_widget/circular_cancel_button.dart';
import 'package:branchx/app/global_widget/primary_button.dart';
import 'package:branchx/app/modules/remarks/remark_controller.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Remarks extends StatelessWidget {
  const Remarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.lightGray,
      appBar: AppBar(
        title: Text('Remarks', style: Styles.blackGrey16,),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(children: [
        _searchBar(),
        Dimens.boxHeight4,
        Column(
          children: List.generate(5, (index) => _remarks()),
        ),
        Dimens.boxHeight8,
        secondaryButton(() { }, 'LOAD MORE'),
        Dimens.boxHeight25
      ],),
    );
  }

  Widget _remarks() => Container(
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
        const Divider(
          color: Color(0xffE4E4E4),
          thickness: 1,
          height: 0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20,12,20,0),
          child: Row(
            children: [
              CircleAvatar(
                radius: Dimens.twelve,
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/img/profile.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
              Dimens.boxWidth8,
              Text('Adeeb singh', style: Styles.blackGrey14.copyWith(color: const Color(0xFF525255)),),
              const Spacer(),
              Text('2 Days Ago', style: Styles.blackGrey14.copyWith(color: const Color(0xFF525255)),),
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
            width: Dimens.hundred * 2.75,
            padding:
            const EdgeInsets.symmetric(horizontal: 20),
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
                SizedBox(
                  width: 215,
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
              remarkSortByBottomSheet();
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

void remarkSortByBottomSheet() => Get.bottomSheet(
  barrierColor: ColorsValue.barrierColor,
  GetBuilder<RemarkController>(builder: (logic) {
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
                    child: Row(
                      children: [
                        Text(
                          logic.sortByValues[i],
                          style: Styles.blackGrey14,
                        ),
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              logic.onChangedSortBy(i);
                            },
                            child: _sortByIndicator(
                              logic.sortByIndex == i
                                  ? ColorsValue.green
                                  : Colors.black,
                            ))
                      ],
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
