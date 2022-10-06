import 'package:branchx/app/constants/icons.dart';
import 'package:branchx/app/routes/routes_management.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ShopDetailsView extends StatelessWidget {
  const ShopDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorsValue.lightGray,
      appBar: AppBar(
        title: Text('Master Distributor', style: Styles.blackGrey16,),
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Dimens.boxHeight25,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Shop Details', style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w600),),
          ),
          Container(
            width: Dimens.screenWidth,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                boxShadow: Styles.greyBoxShadow,
                gradient:  Styles.greyLinearGradient,
                borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              children: [
                _textInput('Shop Name', 'Shop Name',TextInputType.name, [] ),
                _textInput('Shop GST No', '34564765', TextInputType.number, []),
                _textInput('Shop Address', 'Shop Address',TextInputType.streetAddress, []),
                _textInput('Pincode', '821307', TextInputType.number, [LengthLimitingTextInputFormatter(6),]),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                              'Shop Photo',
                              style: Styles.blackGrey16,
                            ),

                          ],
                        ),
                      ),Container(
                        width: Dimens.screenWidth,
                        height: Dimens.hundred*2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFEEEEEE)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppIcons.photo,
                            Text('Add Photo', style: Styles.black14.copyWith(color: const Color(0xFF555555)),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Dimens.boxHeight20
              ],
            ),
          ),
          Dimens.boxHeight40,
          Dimens.boxHeight40
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        width: Dimens.screenWidth,
        height: Dimens.seventy+2,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                Get.back<void>();
              },
              child: Container(
                height: Dimens.fourty,
                width: Dimens.hundred*1.38,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: ColorsValue.primaryColor),
                    color: Colors.white
                ),
                child: Center(child: Text('BACK', style: Styles.white16.copyWith(color: ColorsValue.primaryColor,fontWeight: FontWeight.w600),)),
              ),
            ),
            InkWell(
              onTap: (){
                RoutesManagement.goToKycView();
              },
              child: Container(
                height: Dimens.fourty,
                width: Dimens.hundred*1.38,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorsValue.loginButtonColor
                ),
                child: Center(child: Text('NEXT', style: Styles.white16.copyWith(fontWeight: FontWeight.w600))),
              ),
            ),
          ],
        )
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
                style: Styles.black16.copyWith(color: const Color(0xff747378)),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: value,
                ),
                // initialValue: value,
                keyboardType: keyboardType,
                inputFormatters: format
            ),
          ),
        )
      ],
    ),
  );

}
