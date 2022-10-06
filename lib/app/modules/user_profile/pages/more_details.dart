import 'package:branchx/app/global_widget/shadow_container.dart';
import 'package:branchx/app/theme/theme.dart';
import 'package:flutter/material.dart';

class MoreDetails extends StatelessWidget {
  const MoreDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorsValue.lightGray,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        title: Text('More Info', style: Styles.blackGrey16),
      ),
      body: ListView(
        children: [
          _basicDetails(),
          _shopDetails(),
          _personalKyc(),
          _businessKyc()
        ],
      ),
    );
  }
  Widget _basicDetails()=> Padding(
    padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
    child: ShadowContainer(
      radius: 12,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Basic Details', style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w600),),
            Dimens.boxHeight16,
            const Divider(height: 0,),
            Dimens.boxHeight16,
            Text('Name:', style: Styles.blackGrey16.copyWith(color: const Color(0xFF747378)),),
            Text('Ramesh Ranjan', style: Styles.blackGrey16),
            Dimens.boxHeight16,
            Text('Mobile Number:', style: Styles.blackGrey16.copyWith(color: const Color(0xFF747378)),),
            Text('9876543210', style: Styles.blackGrey16),
            Dimens.boxHeight16,
            Text('Email:', style: Styles.blackGrey16.copyWith(color: const Color(0xFF747378)),),
            Text('myemail@gmail.com', style: Styles.blackGrey16),
            Dimens.boxHeight16,
            Text('DOB:', style: Styles.blackGrey16.copyWith(color: const Color(0xFF747378)),),
            Text('08-07-1999', style: Styles.blackGrey16),
            Dimens.boxHeight16,
            Text('Address:', style: Styles.blackGrey16.copyWith(color: const Color(0xFF747378)),),
            Text('#N-49 jaypee green Wishtown, Noida, UP', style: Styles.blackGrey16),
            Dimens.boxHeight16,
            Text('Joining Date:', style: Styles.blackGrey16.copyWith(color: const Color(0xFF747378)),),
            Text('04-02-2022', style: Styles.blackGrey16),
          ],
        ),
      ),
    ),
  );

  Widget _shopDetails()=> Padding(
    padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
    child: ShadowContainer(
      radius: 12,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Shop Details', style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w600),),
            Dimens.boxHeight16,
            const Divider(height: 0,),
            Dimens.boxHeight16,
            Text('Shop Name', style: Styles.blackGrey16.copyWith(color: const Color(0xFF747378)),),
            Text('Laxmi', style: Styles.blackGrey16),
            Dimens.boxHeight16,
            Text('Shop GST No.(not mandatory)', style: Styles.blackGrey16.copyWith(color: const Color(0xFF747378)),),
            Text('987654321024323', style: Styles.blackGrey16),
            Dimens.boxHeight16,
            Text('Shop Address', style: Styles.blackGrey16.copyWith(color: const Color(0xFF747378)),),
            Text('#N-49 jaypee green Wishtown, Noida, UP', style: Styles.blackGrey16),
            Dimens.boxHeight16,
            Text('Pincode', style: Styles.blackGrey16.copyWith(color: const Color(0xFF747378)),),
            Text('570054', style: Styles.blackGrey16),
            Dimens.boxHeight16,
            Text('Shop Photo', style: Styles.blackGrey16.copyWith(color: const Color(0xFF747378)),),
            Dimens.boxHeight8,
            Container(
              height: Dimens.hundred*1.60,
              width: Dimens.screenWidth,
              decoration: BoxDecoration(
                image: const DecorationImage(image: AssetImage('assets/img/shop.png'), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(8)
              ),
            )
          ],
        ),
      ),
    ),
  );

  Widget _personalKyc()=> Padding(
    padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
    child: ShadowContainer(
      radius: 12,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Personal KYC', style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w600),),
            Dimens.boxHeight16,
            Text('Aadhar Card', style: Styles.blackGrey16.copyWith(color: const Color(0xFF747378)),),
            Dimens.boxHeight8,
            Container(
              height: Dimens.hundred*1.60,
              width: Dimens.screenWidth,
              decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage('assets/img/aadhar.png'), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(8)
              ),
            ),
            Dimens.boxHeight20,
            Text('PAN Card', style: Styles.blackGrey16.copyWith(color: const Color(0xFF747378)),),
            Dimens.boxHeight8,
            Container(
              height: Dimens.hundred*1.60,
              width: Dimens.screenWidth,
              decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage('assets/img/pan.png'), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(8)
              ),
            )
          ],
        ),
      ),
    ),
  );

  Widget _businessKyc()=> Padding(
    padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
    child: ShadowContainer(
      radius: 12,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Business KYC', style: Styles.blackGrey18.copyWith(fontWeight: FontWeight.w600),),
            Dimens.boxHeight16,
            Text('Cancelled  Check', style: Styles.blackGrey16.copyWith(color: const Color(0xFF747378)),),
            Dimens.boxHeight8,
            Container(
              height: Dimens.hundred*1.60,
              width: Dimens.screenWidth,
              decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage('assets/img/cancel_check.png'), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(8)
              ),
            ),
            Dimens.boxHeight20,
            Text('GST Certificate', style: Styles.blackGrey16.copyWith(color: const Color(0xFF747378)),),
            Dimens.boxHeight8,
            Container(
              height: Dimens.hundred*1.60,
              width: Dimens.screenWidth,
              decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage('assets/img/gst_cert.png'), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(8)
              ),
            ),
            Dimens.boxHeight20,
            Text('IOC Certificate', style: Styles.blackGrey16.copyWith(color: const Color(0xFF747378)),),
            Dimens.boxHeight8,
            Container(
              height: Dimens.hundred*1.60,
              width: Dimens.screenWidth,
              decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage('assets/img/ioc_cert.png'), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(8)
              ),
            )
          ],
        ),
      ),
    ),
  );
}
