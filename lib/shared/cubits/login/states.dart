
import 'package:e_shopping/models/loginModel.dart';

abstract class Login_States {}

class Initial_Login_state extends Login_States{}


class Loading_Login_state extends Login_States{}

class Success_Login_state extends Login_States{
  final Login_Model? loginModel;
  Success_Login_state({required this.loginModel});
}

// send error if exist
class Eroro_Login_state extends Login_States{
  final String error;
  Eroro_Login_state({required this.error});
}
class passwordVisibility_Login_state extends Login_States{}