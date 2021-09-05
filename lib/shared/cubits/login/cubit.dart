import 'package:bloc/bloc.dart';
import 'package:e_shopping/models/loginModel.dart';
import 'package:e_shopping/shared/cubits/login/states.dart';
import 'package:e_shopping/shared/network/end_points.dart';
import 'package:e_shopping/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loging_Cubit extends Cubit<Login_States> {

  Loging_Cubit() : super(Initial_Login_state());

  static Loging_Cubit get(context) => BlocProvider.of(context);

  Login_Model? loginModel;

  void user_login ({
    required String email,
    required String password,
}){
    emit(Loading_Login_state());
    DioHelper.postData(
        url: LOGIN,
        data: {
          'email': email,
          'password': password,
        },
    ).then((value){
      print(value.data);
      loginModel = Login_Model.fromJson(value.data);
      print(loginModel!.data!.token);
      print(loginModel!.status);
      emit(Success_Login_state(loginModel: loginModel));
    }).catchError((error){
      print(error.toString());
      emit(Eroro_Login_state(error: error.toString()));
    });
  }

  IconData suffix_pass_icon = Icons.visibility_outlined;
  bool isPassword = true ;

  void change_password_visiblity(){
    isPassword = !isPassword ;
    suffix_pass_icon = isPassword ? Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(passwordVisibility_Login_state());
  }

}