class Login_Model {
  bool status = false  ;
  String message = '';
  UserData? data ;

  // Named constractor to manupulat data directly with constractor
  Login_Model.fromJson(Map<String , dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email ;
  String? phone ;
  String? image  ;
  int? points ;
  int? credit  ;
  String? token  ;

  // Named constractor to manupulat data directly with constractor
  UserData.fromJson(Map<String , dynamic> json)
  {
  id = json['id'] ;
  name = json['name'] ;
  email = json['email'] ;
  phone = json['phone'] ;
  image = json['image'] ;
  points = json['points'] ;
  credit = json['credit'] ;
  token = json['token'] ;
  }

}
