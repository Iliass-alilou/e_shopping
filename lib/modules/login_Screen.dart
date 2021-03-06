import 'package:conditional_builder/conditional_builder.dart';
import 'package:e_shopping/modules/register_Screen.dart';
import 'package:e_shopping/shared/component/components.dart';
import 'package:e_shopping/shared/cubits/login/cubit.dart';
import 'package:e_shopping/shared/cubits/login/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Login_Screen extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> Loging_Cubit(),
      child: BlocConsumer<Loging_Cubit,Login_States>(
        listener: (context,state)
        {
          if (state is Success_Login_state)
            {
              if (state.loginModel!.status)
                {
                  print(state.loginModel!.message);
                  print(state.loginModel!.data!.token);
                  Fluttertoast.showToast(
                      msg: state.loginModel!.message,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      timeInSecForIosWeb: 5,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
              else{
                print(state.loginModel!.message);
                Fluttertoast.showToast(
                    msg: state.loginModel!.message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
            }
        },
        builder: (context,state){
          var login_cubit = Loging_Cubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 35.0,
                          ),
                        ),
                        Text(
                          'login now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),

                        default_textFormField(
                          context: context,//this context only for changing state on passvisibility
                          textInputType: TextInputType.emailAddress,
                          controller: emailController,
                          labelText: 'Email',
                          icon: Icons.email,
                          validator:(value){
                            if(value == null || value.isEmpty)
                            {
                              return ('email shoul be not empty');
                            }
                          } ,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),

                        default_textFormField(
                          context: context,
                          textInputType: TextInputType.visiblePassword,
                          controller: passwordController,
                          labelText: 'Password',
                          icon: Icons.lock,
                          SuffixIcon: login_cubit.suffix_pass_icon,
                          validator:(value){
                            if(value == null || value.isEmpty)
                            {
                              return ('password is too Short');
                            }
                          },
                          obscureText: login_cubit.isPassword,

                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                          condition: state is!Loading_Login_state ,
                          builder:(context)=>LoginButton(
                              text: 'Login',
                              function_Login: (){
                                if(formKey.currentState!.validate()){
                                  login_cubit.user_login(
                                      email: emailController.text,
                                      password: passwordController.text,
                                  );
                                }
                              },
                            ),
                          fallback:(context)=> Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize:18.0,
                              ),
                            ),
                            textButton(
                              text: 'REGISTER',
                              onPressed: (){
                                NavigateTo(context, Register_Screen());
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
