import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData  lightTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backwardsCompatibility:false ,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.black,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize:20.0,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),

  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    elevation:20.0,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontSize: 18.0
    ),
  ),
);

ThemeData darkTheme =  ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    backwardsCompatibility:false ,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: HexColor('333739'),
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize:20.0,
    ),
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    elevation:20.0,
    backgroundColor: HexColor('333739'),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontSize: 18.0
    ),
  ),
);