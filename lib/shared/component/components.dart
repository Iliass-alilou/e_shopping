import 'package:e_shopping/shared/cubits/login/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void NavigateTo(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );

void Navigate_and_Finish( context, Widget,) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => Widget,
        ),
        (route) {
          return false;
        });

//  for text form field
Widget default_textFormField ({
  context,
  required TextInputType textInputType,
  required TextEditingController controller,
  required String labelText,
  required IconData icon,
  IconData? SuffixIcon,
  FormFieldValidator<String>? validator,
  GestureTapCallback? onTap,
  bool obscureText = false,
  VoidCallback? onPressed_suffix,

})  => TextFormField(
  keyboardType: textInputType,
  controller: controller,
  decoration: InputDecoration(
    labelText: labelText,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
    ),
    prefixIcon: Icon(
      icon,
    ),
    suffixIcon: IconButton(
        onPressed: (){
          Loging_Cubit.get(context).change_password_visiblity();
        },
        icon: Icon(
          SuffixIcon,
        ),
    )
  ),
  validator: validator ,
  onTap: onTap,
  obscureText: obscureText,
);

// for login action button

Widget LoginButton ({
  required String text,
  required VoidCallback? function_Login,

})=> Container(
  child: Material(
    color: Colors.blue,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    elevation: 10.0,
    clipBehavior: Clip.antiAlias,
    child: MaterialButton(
      height: 55.0,
      minWidth:double.infinity ,
      onPressed: function_Login,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
);

// Widget For TextButton

Widget textButton ({
  required String text,
  required VoidCallback? onPressed,
}) => TextButton(
  onPressed: onPressed,
  child: Text(
      text,
    style: TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
    ),
  ),
);