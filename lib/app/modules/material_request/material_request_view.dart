import 'package:branchx/app/constants/icons.dart';
import 'package:branchx/app/global_widget/primary_button.dart';
import 'package:branchx/app/modules/material_request/bottom_sheets/declined.dart';
import 'package:branchx/app/modules/material_request/bottom_sheets/filter_sort_by.dart';
import 'package:branchx/app/modules/material_request/bottom_sheets/material_request.dart';
import 'package:branchx/app/modules/material_request/material_request_controller.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaterialRequest extends StatelessWidget {
  const MaterialRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.lightGray,
      appBar: AppBar(
        title: Text('Material Request', style: Styles.blackGrey16,),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: GetBuilder<MaterialRequestController>(
        builder: (logic) {
          return ListView(children: [
            _searchBar(logic),
            Dimens.boxHeight4,
            Column(
              children: [
                InkWell(onTap: (){materialRequestBottomSheet();}, child: _regularizationContainer()),
                InkWell(onTap: (){materialRequestBottomSheet();}, child: _regularizationContainer()),
                InkWell(onTap: (){declinedBottomSheet();}, child: _regularizationContainer(isDeclined: true)),
                InkWell(onTap: (){materialRequestBottomSheet();}, child: _regularizationContainer()),
                InkWell(onTap: (){materialRequestBottomSheet();}, child: _regularizationContainer()),
                InkWell(onTap: (){materialRequestBottomSheet();}, child: _regularizationContainer()),
                InkWell(onTap: (){materialRequestBottomSheet();}, child: _regularizationContainer()),
                InkWell(onTap: (){materialRequestBottomSheet();}, child: _regularizationContainer()),
                InkWell(onTap: (){materialRequestBottomSheet();}, child: _regularizationContainer()),
                InkWell(onTap: (){materialRequestBottomSheet();}, child: _regularizationContainer()),

              ],
            ),
            Dimens.boxHeight20,
            secondaryButton(() { }, 'LOAD MORE'),
            Dimens.boxHeight25,
          ],);
        }
      ),
    );
  }

  Widget _regularizationContainer({bool isDeclined = false}) => Container(
    margin: const EdgeInsets.only(left: 16, right: 16, bottom: 0, top: 20),
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
                      Text('Shiv Kumar', style: Styles.blackGrey16),
                      Text('5 Days Ago',
                          style: Styles.blackGrey14
                              .copyWith(color: const Color(0xff525255)))
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Standees', style: Styles.blackGrey16),
                      Text('Qty:10',
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
                'For Distributor',
                style: Styles.black16.copyWith(color: const Color(0xff525255)),
              ),
              Container(
                height: Dimens.twentyEight,
                width: isDeclined?Dimens.seventyTwo+3:Dimens.fifty,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: isDeclined?ColorsValue.pink:ColorsValue.primaryColor),
                child: Center(
                    child: isDeclined ?Text(
                      'Declined',
                      style: Styles.white14,
                    ):Text(
                      'New',
                      style: Styles.white14,
                    )),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _searchBar(MaterialRequestController logic) => Container(
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
            const EdgeInsets.symmetric(horizontal: 20, ),
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
                    style: Styles.black16.copyWith(color: const Color(0xff747378)),
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
              materialRequestFilterBottomSheet();
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
