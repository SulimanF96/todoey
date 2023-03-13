import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:todoey/providers/auth_provider.dart';
import 'package:todoey/services/auth_service.dart';


class Otp extends StatefulWidget {
  const Otp({required this.mobileNumberController });


  final TextEditingController mobileNumberController;

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final otpController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.requestFocus();

  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 64,
      textStyle: GoogleFonts.poppins(
        fontSize: 20,
        color: const Color.fromRGBO(70, 69, 66, 1),
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(232, 235, 241, 0.37),
        borderRadius: BorderRadius.circular(24),
      ),
    );

    final cursor = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 21,
        height: 1,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(137, 146, 160, 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    return Pinput(
      length: 4,
      controller: otpController,
      focusNode: focusNode,
      defaultPinTheme: defaultPinTheme,
      separator: const SizedBox(width: 16),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05999999865889549),
              offset: Offset(0, 3),
              blurRadius: 16,
            )
          ],
        ),
      ),
      // onClipboardFound: (value) {
      //   debugPrint('onClipboardFound: $value');
      //   controller.setText(value);
      // },

      showCursor: true,
      cursor: cursor,
        onCompleted: (pin) async {
          dynamic data = await AuthService().verifyOtp(widget.mobileNumberController.text, pin);
          // case 200 otp
          if(data['status'] == 200){
            // wrong pin
            // set login token
            Provider.of<AuthModel>(context, listen: false).login(data['decodedBody']['access_token']);
            Navigator.pop(context);
          }

          if(data['status'] == 400){
            // wrong pin
          }

          if(data['status'] == 404){
            // not otp send for long time
          }

        }
    );
  }
}
