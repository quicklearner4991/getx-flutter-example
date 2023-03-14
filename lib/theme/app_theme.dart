import 'package:flutter/material.dart';
final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.purple,
  accentColor: Colors.purpleAccent,
  splashColor: Colors.purpleAccent,
  highlightColor: Colors.purple,
  primarySwatch: Colors.blue,
  fontFamily: 'Inter',
  textTheme: TextTheme(
    headline1:
    TextStyle( fontWeight: FontWeight.w700), // 700
    headline2: TextStyle(
        fontWeight: FontWeight.w600
    ),
    headline3: TextStyle(
        fontWeight:FontWeight.w500
    ),
    headline4: TextStyle(
        fontWeight: FontWeight.w400
    ),
    headline5: TextStyle(
        fontWeight: FontWeight.w300
    ),
  ),
);
