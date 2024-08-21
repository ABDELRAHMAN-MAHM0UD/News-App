import 'package:flutter/material.dart';
import 'package:news/colors.dart';

class Mytheme{

  static final ThemeData appTheme= ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: appColors.white),
    )
  ,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
      fontSize: 22,
      color: Color(0xffffffff)
    )
    )
  );
}