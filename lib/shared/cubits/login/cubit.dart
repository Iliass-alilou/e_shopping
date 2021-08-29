
import 'package:bloc/bloc.dart';
import 'package:e_shopping/shared/cubits/login/states.dart';
import 'package:e_shopping/shared/network/end_points.dart';
import 'package:e_shopping/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loging_Cubit extends Cubit<Login_States> {

  Loging_Cubit() : super(Initial_Login_state());

  static Loging_Cubit get(context) => BlocProvider.of(context);

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
      emit(Success_Login_state());
    }).catchError((error){
      print(error.toString());
      emit(Eroro_Login_state(error: error));
    });
  }
}