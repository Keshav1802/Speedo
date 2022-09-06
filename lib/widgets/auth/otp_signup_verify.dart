import 'package:flutter/material.dart';
import 'package:speedo/auth/login.dart';
import 'package:speedo/widgets/auth/forgotpassword_widget.dart';
import 'package:speedo/widgets/auth/forgotpassword_widget2.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otpsignupverify extends StatefulWidget {
  const Otpsignupverify({Key key}) : super(key: key);

  @override
  State<Otpsignupverify> createState() => _OtpsignupverifyState();
}

class _OtpsignupverifyState extends State<Otpsignupverify> {
  final TextEditingController _phonenumber = TextEditingController();
  final  TextEditingController _otpController = TextEditingController();
  bool _validate = false;
  String _number;

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
                        'Enter OTP To verify Details',
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ])),

          const Padding(
            padding: EdgeInsets.all(20),
          ),
          Container(
              padding: const EdgeInsets.all(20),
              child:  Text(
                'Please type the verification code send to +91-8682215XXX'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                ),
              )),

          Container(
            padding: const EdgeInsets.fromLTRB(50, 50, 50, 10),
            child: PinCodeTextField(
              controller: _otpController,
              appContext: (context),
              length: 4,
              onChanged: (val) {},
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
          const SizedBox(height: 20,),
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
              onPressed: () async{
                await Future.delayed(Duration(milliseconds: 200));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ForgotPasswordWidget2()));
              },
              child: const Text('Continue',
                  style: TextStyle(color: Colors.white, fontSize: 30)),
            ),
          ),
          const SizedBox(height: 20,),
          const Text('Resend Code in : 00:12s'),
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Text(
                'Already have an account',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.0, color: Colors.black),
              ),
              const SizedBox(width:10),
              GestureDetector(
                onTap: (){
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                        (Route<dynamic> route) => false,
                  );
                },
                child: const Text(
                  'Sign in',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0, color: Color(0xffa37edc)),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
