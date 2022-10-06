import 'package:branchx/app/constants/icons.dart';
import 'package:branchx/app/global_widget/primary_button.dart';
import 'package:branchx/app/routes/routes_management.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsValue.lightGray,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              'Edit Profile',
              style: Styles.blackGrey16,
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                passwordChangePopUp();
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
                  child: AppIcons.shuffle,
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: Dimens.screenWidth,
            // height: Dimens.hundred*6.20,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                boxShadow: Styles.greyBoxShadow,
                gradient: Styles.greyLinearGradient,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                _textInput('Name', 'mohin', TextInputType.name, []),
                _textInput('Phone Number', '9876543210', TextInputType.phone, [LengthLimitingTextInputFormatter(10),]),
                _textInput('Email', 'myemail@gmail.com', TextInputType.emailAddress, []),
                _textInput('DOB', 'DD/MM/YYYY', TextInputType.datetime, [DateInputFormatter(),],),
                _textInput('Address', '#16-67/3, Raja colony,Jai City, UP', TextInputType.streetAddress, []),
                _textInput('Joining Date', 'DD/MM/YYYY', TextInputType.datetime, [DateInputFormatter(),],),
                Dimens.boxHeight20,
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: PrimaryButton(
              onPress: () {
                Get.back();
                Get.back();
              },
              text: 'UPDATE DETAILS',
            ),
          ),
          Dimens.boxHeight32,
        ],
      ),
    );
  }

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

  void passwordChangePopUp() => Get.bottomSheet(Container(
    width: Dimens.screenWidth,
    color: Colors.transparent,
    child: ListView(
      children: [
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
                      'CHANGE PASSWORD',
                      style: Styles.black14,
                    )
                  ],
                ),
              ),
              Container(
                width: Dimens.screenWidth,
                // height: Dimens.hundred * 3.61,
                color: ColorsValue.lightGray,
                child: Column(
                  children: [
                    _textInputBottom('Old password', '***************', TextInputType.visiblePassword),
                    _textInputBottom('New Password', '***************', TextInputType.visiblePassword),
                    _textInputBottom('Confirm Password', '***************', TextInputType.visiblePassword),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
                      child: PrimaryButton(
                        onPress: () {},
                        text: 'UPDATE PASSWORD',
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
  ),);

  Widget _textInputBottom(String title, String value, TextInputType? keyboardType,) => Container(
    margin: const EdgeInsets.only(top: 14, left: 20, right: 20),
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
              style: Styles.black16.copyWith(color: const Color(0xff747378)),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: value,
              ),
              keyboardType: keyboardType,
              // initialValue: value,
            ),
          ),
        )
      ],
    ),
  );
}
