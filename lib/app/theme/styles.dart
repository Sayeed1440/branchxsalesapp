import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme.dart';

/// A chunk of styles used in the application.
abstract class Styles {
  static String baseFontFamily = GoogleFonts.notoSans().fontFamily!;

  static ButtonThemeData buttonThemeData = ButtonThemeData(
      buttonColor: ColorsValue.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Dimens.fifty,
        ),
      ));

  // Different style used in the application

  static TextStyle styleLato12Bold = GoogleFonts.notoSans(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.w700,
  );

  static TextStyle styleLato12Normal = GoogleFonts.notoSans(
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.normal,
  );

  static TextStyle styleLato14Bold = GoogleFonts.notoSans(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle styleLato14Normal = GoogleFonts.notoSans(
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle styleLato16Bold = GoogleFonts.notoSans(
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle styleLato16Normal = GoogleFonts.notoSans(
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle styleLato18Bold = GoogleFonts.notoSans(
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.w700,
  );

  static TextStyle styleLato18Normal = GoogleFonts.notoSans(
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle styleLato20Bold = GoogleFonts.notoSans(
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.w700,
  );

  static TextStyle styleLato20Normal = GoogleFonts.notoSans(
    fontSize: Dimens.twenty,
    fontWeight: FontWeight.normal,
  );

  static TextStyle styleLato24Bold = GoogleFonts.notoSans(
    fontSize: Dimens.twentyFour,
    fontWeight: FontWeight.w700,
  );

  static TextStyle styleLato30Normal = GoogleFonts.notoSans(
    fontSize: Dimens.thirty,
    fontWeight: FontWeight.normal,
  );

  static TextStyle styleLato30Bold = GoogleFonts.notoSans(
    fontSize: Dimens.thirty,
    fontWeight: FontWeight.w700,
  );

  static TextStyle styleLato32Bold = GoogleFonts.notoSans(
    fontSize: Dimens.thirtyTwo,
    fontWeight: FontWeight.w700,
  );

  static TextStyle styleLato32Normal = GoogleFonts.notoSans(
    fontSize: Dimens.thirtyTwo,
    fontWeight: FontWeight.normal,
  );

  // light
  static TextStyle bodyTextLight1 = GoogleFonts.notoSans(
    fontSize: Dimens.fourteen,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
  static TextStyle bodyTextLight2 = GoogleFonts.notoSans(
    fontSize: Dimens.sixTeen,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );

  static TextStyle buttonLight = GoogleFonts.notoSans(
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixTeen,
  );

  static TextStyle headlineLight6 = GoogleFonts.notoSans(
    fontSize: Dimens.fourteen,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight5 = GoogleFonts.notoSans(
    fontSize: Dimens.sixTeen,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight4 = GoogleFonts.notoSans(
    fontSize: Dimens.eighteen,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight3 = GoogleFonts.notoSans(
    fontSize: Dimens.twenty,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight2 = GoogleFonts.notoSans(
    fontSize: Dimens.twentyTwo,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLight1 = GoogleFonts.notoSans(
    fontSize: Dimens.twentyFour,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  // dark
  static TextStyle bodyTextDark1 = GoogleFonts.notoSans(
    fontSize: Dimens.fourteen,
    color: Colors.white,
  );
  static TextStyle bodyTextDark2 = GoogleFonts.notoSans(
    fontSize: Dimens.sixTeen,
    color: Colors.white,
  );
  static TextStyle subtitleDark1 = GoogleFonts.notoSans(
    fontSize: Dimens.fourteen,
    color: Colors.white,
  );
  static TextStyle subtitleDark2 = GoogleFonts.notoSans(
    fontSize: Dimens.twelve,
    color: Colors.white,
  );
  static TextStyle buttonDark = GoogleFonts.notoSans(
    fontWeight: FontWeight.bold,
    fontSize: Dimens.sixTeen,
  );
  static TextStyle captionDark = GoogleFonts.notoSans(
    fontSize: Dimens.fourteen,
    color: Colors.black,
  );
  static TextStyle headlineDark6 = GoogleFonts.notoSans(
    fontSize: Dimens.fourteen,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineDark5 = GoogleFonts.notoSans(
    fontSize: Dimens.sixTeen,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineDark4 = GoogleFonts.notoSans(
    fontSize: Dimens.eighteen,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineDark3 = GoogleFonts.notoSans(
    fontSize: Dimens.twenty,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineDark2 = GoogleFonts.notoSans(
    fontSize: Dimens.twentyTwo,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineDark1 = GoogleFonts.notoSans(
    fontSize: Dimens.twentyFour,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle boldAppColor16 = GoogleFonts.notoSans(
    fontWeight: FontWeight.bold,
    color: ColorsValue.primaryColor,
    fontSize: Dimens.sixTeen,
  );

  static TextStyle boldWhite16 = GoogleFonts.notoSans(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: Dimens.sixTeen,
  );

  static TextStyle semiBoldWhite14 = GoogleFonts.notoSans(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: Dimens.fourteen,
  );

  static TextStyle semiBoldWhite18 = GoogleFonts.notoSans(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: Dimens.eighteen,
  );

  static TextStyle boldWhite23 = GoogleFonts.notoSans(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: Dimens.twentyThree,
  );

  static TextStyle signPainterHS64White = TextStyle(
    color: Colors.black,
    fontSize: Dimens.sixtyFour,
    fontFamily: 'SignPainterRegular',
  );

  static TextStyle signPainterHS64Black = TextStyle(
    color: Colors.black,
    fontSize: Dimens.sixtyFour,
    fontFamily: 'SignPainterRegular',
  );

  static TextStyle white16 = GoogleFonts.notoSans(
    color: Colors.white,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.normal,
  );
  static TextStyle white18 = GoogleFonts.notoSans(
    color: Colors.white,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle white7016 = GoogleFonts.notoSans(
    color: Colors.black,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle white12 = GoogleFonts.notoSans(
    color: Colors.white,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.normal,
  );

  static TextStyle white12Underline = GoogleFonts.notoSans(
    color: Colors.black,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.underline,
  );

  static TextStyle white14 = GoogleFonts.notoSans(
    color: Colors.white,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle blackBold15 = GoogleFonts.notoSans(
    color: Colors.black,
    fontSize: Dimens.fifteen,
    fontWeight: FontWeight.bold,
  );

  static TextStyle blackBold16 = GoogleFonts.notoSans(
    color: Colors.black,
    fontSize: Dimens.sixTeen,
    fontWeight: FontWeight.bold,
  );

  static TextStyle appColor18 = GoogleFonts.notoSans(
    color: ColorsValue.primaryColor,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle appColor14 = GoogleFonts.notoSans(
    color: ColorsValue.primaryColor,
    fontSize: Dimens.fourteen,
    fontWeight: FontWeight.normal,
  );

  static TextStyle boldBlack36 = GoogleFonts.notoSans(
    color: Colors.black,
    fontSize: Dimens.thirtySix,
    fontWeight: FontWeight.bold,
  );

  static TextStyle boldBlack28 = GoogleFonts.notoSans(
    color: Colors.black,
    fontSize: Dimens.twentyEight,
    fontWeight: FontWeight.bold,
  );

  static TextStyle boldAppColor36 = GoogleFonts.notoSans(
    color: ColorsValue.primaryColor,
    fontSize: Dimens.thirtySix,
    fontWeight: FontWeight.bold,
  );

  static TextStyle black18 = GoogleFonts.notoSans(
    color: Colors.black,
    fontSize: Dimens.eighteen,
  );

  static TextStyle black14 = GoogleFonts.notoSans(
    color: Colors.black,
    fontSize: Dimens.fourteen,
  );

  static TextStyle black16 = GoogleFonts.notoSans(
    color: Colors.black,
    fontSize: Dimens.sixTeen,
  );

  static TextStyle blackGrey18 = GoogleFonts.notoSans(
    color: ColorsValue.blackGrey,
    fontSize: Dimens.eighteen,
  );

  static TextStyle blackGrey12 = GoogleFonts.notoSans(
    color: ColorsValue.blackGrey,
    fontSize: Dimens.twelve,
  );

  static TextStyle blackGrey14 = GoogleFonts.notoSans(
    color: ColorsValue.blackGrey,
    fontSize: Dimens.fourteen,
  );

  static TextStyle blackGrey16 = GoogleFonts.notoSans(
    color: ColorsValue.blackGrey,
    fontSize: Dimens.sixTeen,
  );

  static TextStyle blackBold18 = GoogleFonts.notoSans(
    color: Colors.black,
    fontSize: Dimens.eighteen,
    fontWeight: FontWeight.bold,
  );

  static TextStyle boldAppColor30 = GoogleFonts.notoSans(
    fontWeight: FontWeight.bold,
    color: ColorsValue.primaryColor,
    fontSize: Dimens.thirty,
  );

  static TextStyle boldWhite30 = GoogleFonts.notoSans(
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: Dimens.thirty,
  );

  static TextStyle boldBlack26 = GoogleFonts.notoSans(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: Dimens.twentySix,
  );

  static TextStyle boldBlack22 = GoogleFonts.notoSans(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: Dimens.twentyTwo,
  );

  static TextStyle boldBlack20 = GoogleFonts.notoSans(
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: Dimens.twentyTwo,
  );

  static TextStyle boldBlack16 = GoogleFonts.notoSans(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: Dimens.sixTeen,
  );

  static TextStyle black12 = GoogleFonts.notoSans(
    color: Colors.black,
    fontSize: Dimens.twelve,
    fontWeight: FontWeight.normal,
  );

  static TextStyle appColor10 = GoogleFonts.notoSans(
    color: ColorsValue.primaryColor,
    fontSize: Dimens.ten,
    fontWeight: FontWeight.normal,
  );

  static TextStyle white10 = GoogleFonts.notoSans(
    color: Colors.black,
    fontSize: Dimens.ten,
    fontWeight: FontWeight.normal,
  );

  static var outlineBorderRadius50 = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        Dimens.fifty,
      ),
    ),
    borderSide: BorderSide.none,
  );

  static var outlineBorderRadius15 = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        Dimens.fifteen,
      ),
    ),
    borderSide: BorderSide.none,
  );

  static var innerBorder = Border.all(width: 1, color: const Color(0xFFF7F7F7));

  static LinearGradient greyLinearGradient =  const LinearGradient(
    colors: [Color(0xFFECECEC), Color(0xFFFFFFFF)],
    stops: [0.1, 0.9],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );


  static LinearGradient greenLinearGradient =  const LinearGradient(
    colors: [Color(0xFF93BF85), Color(0xFF7CA26F)],
    stops: [0.05, 0.9],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient blueLinearGradient =  const LinearGradient(
    colors: [Color(0xFF748BC5), Color(0xFF556EAD)],
    stops: [0.05, 0.9],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static List<BoxShadow>  greyBoxShadow = [
    BoxShadow(
      color: Colors.white.withOpacity(0.8),
      offset: Offset(-6.0, -6.0),
      blurRadius: 16.0,
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      offset: Offset(6.0, 6.0),
      blurRadius: 16.0,
    ),
  ];


  ///undefined
}
