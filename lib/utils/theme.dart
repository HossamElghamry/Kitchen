import 'package:flutter/material.dart';

final primaryColor = Colors.purple;
final accentColor = Colors.purpleAccent;

final ThemeData theme = ThemeData(
  primaryColor: primaryColor,
  accentColor: accentColor,
  buttonTheme: ButtonThemeData(
    buttonColor: accentColor,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        12,
      ),
    ),
  ),
  textTheme: TextTheme(
    headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    title: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w300),
    display1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
    body2: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: accentColor,
    ),
    body1: TextStyle(fontSize: 16.0),
  ),
  fontFamily: 'QuickSand',
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        width: 2,
      ),
    ),
    // focusedBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.all(Radius.circular(8)),
    //   borderSide: BorderSide(
    //     color: accentColor,
    //     width: 2,
    //   ),
    // ),
    filled: true,
    fillColor: primaryColor.withAlpha(25),
    labelStyle: TextStyle(
      // color: accentColor,
      textBaseline: TextBaseline.ideographic,
      fontSize: 18,
      height: -12,
      fontWeight: FontWeight.bold,
    ),
  ),
);
