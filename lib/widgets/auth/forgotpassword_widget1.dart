import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:speedo/widgets/auth/forgotpassword_widget.dart';
import 'package:speedo/widgets/auth/forgotpassword_widget2.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPasswordWidget1 extends StatefulWidget {
  const ForgotPasswordWidget1({Key key}) : super(key: key);

  @override
  State<ForgotPasswordWidget1> createState() => _ForgotPasswordWidget1State();
}

class _ForgotPasswordWidget1State extends State<ForgotPasswordWidget1> {
  GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _phonenumber = TextEditingController();
  final  TextEditingController _otpController = TextEditingController();
   bool _validate = false;
   String _number;
   Timer _timer;
  int sta = 12;
   String tim;
  bool _isDisabled = true;
  String txt = "Didn't recieve OTP?";
  String cd = "";
  bool _isEnabled = true;
  String last = "";

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(children: <Widget>[
          Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/img_4.png'),
                    fit: BoxFit.fill,
                  )),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    SizedBox(
                      height: 65,
                    ),
                    Text(
                      'Speedo',
                      style: TextStyle(fontSize: 24.0, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ListTile(
                      title: Text(
                        'Welcome To Speedo',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        'Enter OTP to reset password',
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ])),
          Container(
            alignment: Alignment.topLeft,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => const ForgotPasswordWidget()));
              },
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
                primary: Colors.white, // <-- Button color
                onPrimary: Colors.red, // <-- Splash color
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(20),
              child:  Text(
                'Please type the verification code send to +91-8682215XXX'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(50, 50, 50, 10),
            child: PinCodeTextField(
              controller: _otpController,
              appContext: (context),
              length: 4,
              onChanged: (val) {

              },
              textStyle: const TextStyle(color: Colors.black),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                fieldHeight: 40,
                borderRadius: BorderRadius.circular(4),
                disabledColor: Colors.black,
                activeColor: Colors.black,
                inactiveColor: Colors.black,
              ),
            ),
          ),
          Container(
            height: 60,
            width: 300,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                  colors: [
                    Color(0xffffc000),
                    Color(0xff212529),
                  ],
                )
            ),
            child: FlatButton(
              shape: const StadiumBorder(),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordWidget2()),
                      (Route<dynamic> route) => true,
                );
              },
              child: const Text('Continue',
                  style: TextStyle(color: Colors.white, fontSize: 30)),
            ),
          ),
          SizedBox(height: 20,),
          Container(
              height: 20,
              width: 150,
              child: const Text('Resend Code in : 00:12s')),
          // resend(),
          // Expanded(
          //   child: Form(
          //     key: _formKey,
          //     child: TextField(
          //       enabled: _isEnabled,
          //       maxLength: 4,
          //       style: TextStyle(
          //         fontSize: 25,
          //         letterSpacing: 35,
          //       ),
          //       controller: _otpController,
          //       decoration: InputDecoration(counterText: ""),
          //       keyboardType: TextInputType.number,
          //       onChanged: (_otp) {
          //         print(_otp);
          //         if (_otp.toString().length == 4) {
          //           setState(() {
          //             _isEnabled = false;
          //             txt = "Resend code in";
          //             last = "";
          //             countdown();
          //           });
          //         }
          //       },
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }
  // Widget resend(){
  //   return Container(
  //     height: 100,
  //       width: 250,
  //       alignment: Alignment.center,
  //       padding: EdgeInsets.fromLTRB(40, 0, 20, 10),
  //       child: Wrap(
  //         children: [
  //           RichText(
  //             text: TextSpan(
  //               children: [
  //                 TextSpan(
  //                     text:
  //                     "Resend",
  //                     style: TextStyle(
  //                       fontSize: 15,
  //                       color: Colors.grey[600],
  //                       decoration: TextDecoration.underline,
  //                     ),
  //                     recognizer: TapGestureRecognizer()
  //                       ..onTap = () {
  //                         setState(() {
  //                           _isEnabled = false;
  //                           txt = "Resend code in";
  //                           last = "";
  //                           countdown();
  //                         });
  //
  //                       }
  //                 ),
  //               ],
  //             ),
  //           ),
  //            const Text(" Code in 00:12s"),
            // Container(
            //   child: InkWell(
            //     onTap: (){
            //       setState((){
            //         countdown();
            //       });
            //     },
            //   ),
            // )
  //         ],
  //       )
  //   );
  // }
  countdown() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (sta == 5) {
        setState(() {
          timer.cancel();
          cd = "";
          txt = "";
          _isDisabled = false;
        });
      } else {
        setState(() {
          if (sta >= 10) {
            tim = sta.toString();
          } else {
            tim = "0" + sta.toString();
          }
          cd = "(00:" + tim + ")";
          sta--;
        });
      }
    });
  }
}
