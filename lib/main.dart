import 'package:bloc/bloc.dart';
import 'package:e_shopping/shared/bloc_Observer.dart';
import 'package:e_shopping/shared/network/remote/dio_helper.dart';
import 'package:e_shopping/shared/style/themes.dart';
import 'package:flutter/material.dart';
import 'modules/on_boarding.dart';



void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: lightTheme,
      darkTheme: darkTheme,

      themeMode:ThemeMode.light ,

      home: On_Boarding(),
    );
  }
}