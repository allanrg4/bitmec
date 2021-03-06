import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static const white = Colors.white;
  static const grey = Color(0xff8F8F8F);
  static const black = Color(0xff212121);
  static const skyBlue = Color(0xff2A93D5);
  static const red = Colors.redAccent;
  static const orange = Colors.orangeAccent;

  static final italicStyle = TextStyle(
    color: grey,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.normal,
  );

  static final cardHeaderTextStyle = TextStyle(
    color: black,
    fontSize: 25.0,
    fontWeight: FontWeight.normal,
  );

  static const tenPadding = EdgeInsets.all(10.0);

  static final _borderRadius = BorderRadius.circular(5.0);

  static ThemeData light() => ThemeData(
    primaryColor: skyBlue,
    backgroundColor: white,
    hintColor: skyBlue,
    errorColor: red,

    textTheme: TextTheme(
      body2: TextStyle(
        color: grey,
        fontWeight: FontWeight.normal
      ),

      subtitle: TextStyle(
        color: skyBlue,
        fontSize: 30.0,
        fontWeight: FontWeight.normal,
      ),
    ),

    appBarTheme: AppBarTheme(
      color: white,
      elevation: 0,
      iconTheme: IconThemeData(color: black),
      actionsIconTheme: IconThemeData(color: black),
      textTheme: TextTheme(
        title: TextStyle(
          color: black,
          fontSize: 20.0,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      labelStyle: TextStyle(fontSize: 15.0),

      border: OutlineInputBorder(borderRadius: _borderRadius),

      disabledBorder: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: BorderSide(color: grey),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: _borderRadius,
        borderSide: BorderSide(color: red)
      ),
    ),

    cardTheme: CardTheme(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
    ),
  );
}
