import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/providers/auth_provider.dart';
import 'package:todoey/services/auth_service.dart';


class Login extends StatelessWidget {
  const Login({required this.formKey, required this.mobileNumberController, required this.showOtp, required this.showRegister });

  final dynamic formKey;
  final TextEditingController mobileNumberController;
  final Function showRegister;
  final Function showOtp;

  @override
  Widget build(BuildContext context) {
    return  Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [TextFormField(controller: mobileNumberController, autofocus: true, textAlign: TextAlign.center,  validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        }),
          SizedBox(height:20 ),
          MaterialButton(onPressed: () async {
            // Call login endpoint to send otp
            if (formKey.currentState!.validate()) {
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
              // print(formKey);
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(content: Text(mobileNumberController.text)),
              // );
              // Navigator.pop(context);
              dynamic data = await AuthService().login(mobileNumberController.text);
              // case 200 otp
              // case 400 otp with error
              if(data['status'] == 400 || data['status'] == 200){
                showOtp();
              }
              // 404 register
              if(data['status'] == 404){
                showRegister();
              }
            }

          }, child: Text("Add", style: TextStyle(color: Colors.white),), color: Colors.lightBlueAccent)],
      ),
    );
  }
}
