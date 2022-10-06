import 'package:branchx/app/global_widget/primary_button.dart';
import 'package:branchx/app/routes/routes_management.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({Key? key}) : super(key: key);

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
            child: Text('Basic Details', style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w600),),
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
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Profile Picture',
                        style: Styles.blackGrey16,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    children: [
                      Container(
                        height: Dimens.hundred,
                        width: Dimens.hundred,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child:
                        // DashedRect(color: Colors.black54, strokeWidth: 2.0, gap: 10.0,),
                        Center(child: Image.asset('assets/icons/add_photo_png.png')),
                      ),
                    ],
                  ),
                ),
                _textInput('Name', 'mohin', TextInputType.name, []),
                _textInput('Phone Number', '9876543210', TextInputType.phone, [LengthLimitingTextInputFormatter(10),]),
                _textInput('Alternate Phone Number', '9012345678', TextInputType.phone, [LengthLimitingTextInputFormatter(10),]),
                _textInput('Email', 'myemail@gmail.com', TextInputType.emailAddress, []),
                _textInput('DOB', 'DD/MM/YYYY', TextInputType.number, [DateInputFormatter(),]),
                _textInput('Address', '#16-67/3, Raja colony,Jai City, UP', TextInputType.streetAddress, []),
                _textInput('Joining Date', 'DD/MM/YYYY', TextInputType.number, [DateInputFormatter(),]),
                Dimens.boxHeight20
              ],
            ),
          ),
          Dimens.boxHeight40,
          Dimens.boxHeight40,
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        width: Dimens.screenWidth,
        height: Dimens.seventy+2,
        color: Colors.white,
        child: Center(child: PrimaryButton(onPress: (){
          RoutesManagement.goToShopDetailsView();
        }, text: 'NEXT',)),
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
