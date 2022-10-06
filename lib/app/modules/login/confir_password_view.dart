import 'package:branchx/app/global_widget/primary_button.dart';
import 'package:branchx/app/routes/routes_management.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmPasswordView extends StatelessWidget {
  const ConfirmPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Dimens.screenWidth,
                height: Dimens.hundred*3.95,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/img/login.png'), fit: BoxFit.cover)
                ),
              ),
              Dimens.boxHeight15,
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Login to branchx', style: Styles.boldBlack20,),
                    Dimens.boxHeight20,
                    Text('New Password', style: Styles.black18,),
                    Dimens.boxHeight10,
                    Container(
                      height: Dimens.fourtyFive,
                      constraints: BoxConstraints(maxWidth: Dimens.screenWidth),
                      child: CupertinoTextField(
                        // onChanged: (value) => logic.onChangedPhone(value),
                        padding: EdgeInsets.symmetric(horizontal: Dimens.sixTeen),
                        decoration: BoxDecoration(
                          // color: ColorsValue.lightGray,
                            borderRadius: BorderRadius.circular(Dimens.eight),
                            border: Border.all(width: 0.5, color: Colors.grey)
                        ),
                        cursorColor: ColorsValue.secondaryColor,
                        clearButtonMode: OverlayVisibilityMode.editing,
                        keyboardType: TextInputType.name,
                        // inputFormatters: [
                        //   // FilteringTextInputFormatter.digitsOnly,
                        //   // LengthLimitingTextInputFormatter(10),
                        // ],
                        maxLines: 1,
                        placeholder: 'Enter New Password',
                        placeholderStyle: Styles.styleLato14Normal.copyWith(
                          color: ColorsValue.mediumGray,
                        ),
                      ),
                    ),
                    Dimens.boxHeight10,
                    Text('Confirm Password', style: Styles.black18,),
                    Dimens.boxHeight10,
                    Container(
                      height: Dimens.fourtyFive,
                      constraints: BoxConstraints(maxWidth: Dimens.screenWidth),
                      child: CupertinoTextField(
                        // onChanged: (value) => logic.onChangedPhone(value),
                        padding: EdgeInsets.symmetric(horizontal: Dimens.sixTeen),
                        decoration: BoxDecoration(
                          // color: ColorsValue.lightGray,
                            borderRadius: BorderRadius.circular(Dimens.eight),
                            border: Border.all(width: 0.5, color: Colors.grey)
                        ),
                        cursorColor: ColorsValue.secondaryColor,
                        clearButtonMode: OverlayVisibilityMode.editing,
                        keyboardType: TextInputType.name,
                        obscureText: true,
                        // inputFormatters: [
                        //   // FilteringTextInputFormatter.digitsOnly,
                        //   // LengthLimitingTextInputFormatter(10),
                        // ],
                        maxLines: 1,
                        placeholder: 'Confirm Password',
                        placeholderStyle: Styles.styleLato14Normal.copyWith(
                          color: ColorsValue.mediumGray,
                        ),
                      ),
                    ),
                    Dimens.boxHeight20,
                    PrimaryButton(text: 'UPDATE PASSWORD', onPress: (){},),
                    Dimens.boxHeight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Text('Sign In',style: Styles.black18.copyWith(color: const Color(0xFF80A0FF)),),
                          onTap: (){
                            RoutesManagement.goToLoginView();
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
