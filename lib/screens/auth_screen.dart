import 'package:flutter/material.dart';
import 'package:todoey/widgets/login.dart';

import '../widgets/otp.dart';

enum auth_view {
  login,
  register,
  otp
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final mobileNumberController = TextEditingController();
  final nationlaIdController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  auth_view currentAuthView = auth_view.login;

  Widget getCurrentAuthView(){
    if(currentAuthView == auth_view.login){
      return  Login(formKey: _formKey, mobileNumberController: mobileNumberController, showRegister: (){
        setState(() {
          currentAuthView = auth_view.register;
        });
      }, showOtp: (){
        setState(() {
          currentAuthView = auth_view.otp;
        });
      });
    }

    if(currentAuthView == auth_view.register){
      return Placeholder();
    }

    if(currentAuthView == auth_view.otp){
      return Otp(mobileNumberController: mobileNumberController);
    }

    return Placeholder();
  }


  String getCurrentAuthViewTitle(){
    if(currentAuthView == auth_view.login){
      return  "Login";
    }

    if(currentAuthView == auth_view.register){
      return "register";
    }

    if(currentAuthView == auth_view.otp){
      return "One Time Password";
    }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
        child: Padding(
          padding: EdgeInsets.all(40),
          child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(getCurrentAuthViewTitle(), textAlign: TextAlign.center, style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent,),),
                Flexible(child: getCurrentAuthView())
              ],
          ),
        ),
      ),
    );
  }
}


