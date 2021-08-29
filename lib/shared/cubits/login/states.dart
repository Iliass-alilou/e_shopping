
abstract class Login_States {}

class Initial_Login_state extends Login_States{}


class Loading_Login_state extends Login_States{}
class Success_Login_state extends Login_States{}

// send error if exist
class Eroro_Login_state extends Login_States{
  final String error;
  Eroro_Login_state({required this.error});
}