import 'package:branchx/app/constants/icons.dart';
import 'package:branchx/app/global_widget/shadow_container.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalKYC extends StatelessWidget {
  const PersonalKYC({Key? key}) : super(key: key);

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
        children: [
          _personalKyc(),
          _bankDetails(),
          _businessKyc(),
          Dimens.boxHeight64,
          Dimens.boxHeight64,
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
                  Get.back();
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
                  onboardingCompleteBottomSheet();
                },
                child: Container(
                  height: Dimens.fourty,
                  width: Dimens.hundred*1.38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: ColorsValue.loginButtonColor
                  ),
                  child: Center(child: Text('SUBMIT', style: Styles.white16.copyWith(fontWeight: FontWeight.w600))),
                ),
              ),
            ],
          )
      ),
    );
  }

  Widget _personalKyc()=> Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Personal KYC', style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w600),),
        Dimens.boxHeight12,
        ShadowContainer(
            radius: 12,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20,20,20,0),
              child: Column(
                children: [
                  SizedBox(
                    width: Dimens.screenWidth,
                    height: Dimens.sixtyFive,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Aadhar Card', style: Styles.blackGrey18.copyWith(color: const Color(0xFF525255), fontWeight: FontWeight.w500),),
                            Text('Front Side', style: Styles.blackGrey14.copyWith(color: const Color(0xFF747378)),)
                          ],
                        ),
                          Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: AppIcons.upload,
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 0.5, height: 1,),
                  Dimens.boxHeight16,
                  SizedBox(
                    width: Dimens.screenWidth,
                    height: Dimens.sixtyFive,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Aadhar Card', style: Styles.blackGrey18.copyWith(color: const Color(0xFF525255), fontWeight: FontWeight.w500),),
                            Text('Uploaded Successfully', style: Styles.blackGrey14.copyWith(color: const Color(0xFF747378)),)
                          ],
                        ),
                          Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            children: [
                              AppIcons.replay,
                              Dimens.boxWidth20,
                              AppIcons.check
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 0.5, height: 1,),
                  Dimens.boxHeight16,
                  SizedBox(
                    width: Dimens.screenWidth,
                    height: Dimens.sixtyFive,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('PAN Card', style: Styles.blackGrey18.copyWith(color: const Color(0xFF525255), fontWeight: FontWeight.w500),),
                            Text('Front Side', style: Styles.blackGrey14.copyWith(color: const Color(0xFF747378)),)
                          ],
                        ),
                          Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: AppIcons.upload,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    ),
  );
  Widget _bankDetails()=> Padding(
    padding: const EdgeInsets.fromLTRB(20,24,20,0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bank Details', style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w600),),
        Dimens.boxHeight12,
        ShadowContainer(
            radius: 12,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20,20,20,0),
              child: Column(
                children: [
                  SizedBox(
                    width: Dimens.screenWidth,
                    height: Dimens.sixtyFive,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Passbook', style: Styles.blackGrey18.copyWith(color: const Color(0xFF525255), fontWeight: FontWeight.w500),),
                            Text('Front Side', style: Styles.blackGrey14.copyWith(color: const Color(0xFF747378)),)
                          ],
                        ),
                          Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: AppIcons.upload,
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 0.5, height: 1,),
                  Dimens.boxHeight16,
                  SizedBox(
                    width: Dimens.screenWidth,
                    height: Dimens.sixtyFive,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Cancelled Checks', style: Styles.blackGrey18.copyWith(color: const Color(0xFF525255), fontWeight: FontWeight.w500),),
                            Text('Front Side', style: Styles.blackGrey14.copyWith(color: const Color(0xFF747378)),)
                          ],
                        ),
                          Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: AppIcons.upload,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    ),
  );
  Widget _businessKyc()=> Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Business KYC', style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w600),),
        Dimens.boxHeight12,
        ShadowContainer(
            radius: 12,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20,20,20,0),
              child: Column(
                children: [
                  SizedBox(
                    width: Dimens.screenWidth,
                    height: Dimens.sixtyFive,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('GST Certificates', style: Styles.blackGrey18.copyWith(color: const Color(0xFF525255), fontWeight: FontWeight.w500),),
                            Text('Front Side', style: Styles.blackGrey14.copyWith(color: const Color(0xFF747378)),)
                          ],
                        ),
                          Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: AppIcons.upload,
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 0.5, height: 1,),
                  Dimens.boxHeight16,
                  SizedBox(
                    width: Dimens.screenWidth,
                    height: Dimens.sixtyFive,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('IOC Certificate', style: Styles.blackGrey18.copyWith(color: const Color(0xFF525255), fontWeight: FontWeight.w500),),
                            Text('Front Side', style: Styles.blackGrey14.copyWith(color: const Color(0xFF747378)),)
                          ],
                        ),
                          Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: AppIcons.upload,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    ),
  );

}

void onboardingCompleteBottomSheet() => Get.bottomSheet(
  barrierColor: ColorsValue.barrierColor,
  Container(
    width: Dimens.screenWidth,
    // height: Dimens.hundred * 3.03,
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
          // height: Dimens.hundred * 2.52,
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
                      'Onboarding complete',
                      style: Styles.black14,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16,20,0),
                child: Text('Ramesh Ranjan was onboard as Master Distributor', style: Styles.blackGrey16.copyWith(color: const Color(0xFF525255)),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16,20,20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:(){
                        Get.back();
                        Get.back();
                        Get.back();
              },
                      child: Container(
                        height: Dimens.fourty,
                        width: Dimens.hundred*1.55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1, color: ColorsValue.primaryColor),
                            color: Colors.white
                        ),
                        child: Center(child: Text('BACK TO HOME', style: Styles.white16.copyWith(color: ColorsValue.primaryColor,fontWeight: FontWeight.w600),)),
                      ),
                    ),
                    Container(
                      height: Dimens.fourty,
                      width: Dimens.hundred*1.55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorsValue.loginButtonColor
                      ),
                      child: Center(child: Text('VIEW PROFILE', style: Styles.white16.copyWith(fontWeight: FontWeight.w600))),
                    ),
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

