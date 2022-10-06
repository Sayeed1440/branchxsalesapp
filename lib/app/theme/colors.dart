import 'package:flutter/material.dart';

/// A chunks of colors used
/// in the application
abstract class ColorsValue {
  static const MaterialColor primaryColorSwatch = MaterialColor(
    0xFFFFA700,
    // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color.fromRGBO(255, 167, 0, .1),
      100: Color.fromRGBO(255, 167, 0, .2),
      200: Color.fromRGBO(255, 167, 0, .3),
      300: Color.fromRGBO(255, 167, 0, .4),
      400: Color.fromRGBO(255, 167, 0, .5),
      500: Color.fromRGBO(255, 167, 0, .6),
      600: Color.fromRGBO(255, 167, 0, .7),
      700: Color.fromRGBO(255, 167, 0, .8),
      800: Color.fromRGBO(255, 167, 0, .9),
      900: Color.fromRGBO(255, 167, 0, 1.0),
    },
  );

  static Color barrierColor = Colors.blue.withOpacity(0.2);
  static const Color loginButtonColor = Color(0xFF0A0130);
  static const Color grey = Color(0xFFF7F7F7);
  static const Color pink = Color(0xFFF16778);
  static const Color lightPink = Color(0xFFE5E5E5);
  static const Color green = Color(0xFFA9D59B);
  static const Color blackGrey = Color(0xff323139);
  static const Color primaryColor = Color(0xFF748BC5);
  static const Color primaryColorLight = Color(0x99f5c343);
  static const Color secondaryColor = Color(0xfff5c343);
  static const Color lightGray = Color(0xFFF7F7F7);
  static const Color mediumGray = Color(0xFF8391A1);
  static const Color mediumLightGray = Color(0xFFE8ECF4);
  static const Color darkGray = Color(0xFF6A707C);
  static const Color black = Color(0xFF1E232C);
  static const Color textColor = Color(0xFF4A4A4A);
  static const Color disabled = Color(0xFFCCD2D9);
  static const Color linkColor = Color(0xFF397BFF);
  static const Color successColor = Color(0xFF249995);


  static const int primaryColorHex = 0xFFFFA700;
  static const int lightPinkHex = 0xffD47FA6;
  static const int lightGreyHex = 0xffF7F7F7;

  static const Color lightScaffoldColor = Color(0xFFFFFFFF);
  static const Color darkScaffoldColor = Color(0xFF120723);

  static const LinearGradient primaryGrad = LinearGradient(
    colors: [
      primaryColor,
      secondaryColor,
    ],
  );

  static const LinearGradient greenGrad = LinearGradient(
    colors: [
      Color(0xFFF9FFB8),
      Color(0xFF74CD98),
    ],
  );
}
