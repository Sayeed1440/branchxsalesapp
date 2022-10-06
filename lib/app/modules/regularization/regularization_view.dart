import 'package:branchx/app/global_widget/primary_button.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/material.dart';

class Regularization extends StatelessWidget {
  const Regularization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.lightGray,
      appBar: AppBar(
        title: Text('Regularization', style: Styles.blackGrey16,),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(children: [
        _searchBar(),
        Dimens.boxHeight4,
        Column(
          children: List.generate(5, (index) => InkWell(
              onTap: (){
              },
              child: _regularizationContainer())),
        ),
        Dimens.boxHeight8,
        secondaryButton(() { }, 'LOAD MORE')
      ],),
    );
  }

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
            width: Dimens.hundred * 3.35,
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
                  style: Styles.black14.copyWith(color: const Color(0xff9A999E)),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
