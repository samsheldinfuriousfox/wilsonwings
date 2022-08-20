import 'package:flutter/material.dart';
import 'package:wilsonwings/utils/colors.dart';

abstract class AppTheme {
  static ThemeData get textTheme => ThemeData(
      fontFamily: 'Noto Sans',
      //  primarySwatch: Colors.orange,
      textTheme: const TextTheme(
        headline3: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.w400,
          color: Appcolors.black2,
        ),
        headline4: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Appcolors.black2,
            height: 1),
        headline5: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Appcolors.black2,
            height: 1),
        button: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Appcolors.black2),
        subtitle1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Appcolors.black2,
            height: 1),
        subtitle2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Appcolors.black2,
            height: 1),
        bodyText1: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Appcolors.black2,
            height: 1),
      ));
}
