import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:speedo/auth/login.dart';
import 'package:speedo/screens/home.dart';
import 'package:speedo/widgets/auth/login_with_mobile.dart';
import 'package:speedo/widgets/auth/mobile_signup.dart';
import 'package:speedo/widgets/auth/otp_signup_verify.dart';
import 'package:url_launcher/url_launcher.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _registerFormKey = GlobalKey<FormState>();
  final _otpcontroller = TextEditingController();
  final _phoneTextController3 = TextEditingController();

  Future<void> _launched;

  String _email, _password,_name,_mobile;

  bool value = false;
  bool value2 =false;
  bool value3 =false;

  void signup() {
    if (_registerFormKey.currentState.validate()) {
      _registerFormKey.currentState.save();
    }
  }

  // static String? validateMobile(String? value) {
  //   String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  //   RegExp regExp =  RegExp(patttern);
  //   if (value!.isEmpty) {
  //     return 'Please enter mobile number';
  //   }
  //   else if (!regExp.hasMatch(value)) {
  //     return 'Please enter valid mobile number';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
            children: <Widget>[
              Container(
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/img_4.png'),
                        fit: BoxFit.fill,
                      )
                  ),
                  child:Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        SizedBox(height: 65,),
                        Text('Speedo',
                          style: TextStyle(fontSize: 24.0,color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 25,),
                        ListTile(
                          title: Text('Welcome To Speedo',
                            style: TextStyle(fontSize: 18.0,
                                color: Colors.white
                            ),
                            textAlign: TextAlign.center,

                          ),
                          subtitle: Text(
                            'Enter Mobile Number to continue',
                            style: TextStyle(fontSize: 14.0,color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]
                  )
              ),
              const SizedBox(height: 70,),
              // E-mail TextField
              Container(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _registerFormKey,
                  child: Column(
                    children: [
                      // E-mail TextField
                      TextFormField(
                        controller: _phoneTextController3,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Colors.transparent),
                              borderRadius:
                              BorderRadius.circular(30)),
                          contentPadding: const EdgeInsets.all(15),
                          prefixIcon:Image.asset('assets/images/img_5.png'),
                          filled: true,
                          fillColor:  Colors.white,
                          //focusColor: Colors.red,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Colors.white),
                              borderRadius:
                              BorderRadius.circular(30)),
                          labelText: '      Mobile Number'.toUpperCase(),
                          labelStyle: const TextStyle(color: Colors.black),
                        ),
                        onSaved: (input) => _email = input,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15),
                      ),
                      TextFormField(
                        controller: _otpcontroller,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black12,
                        style: const TextStyle(color: Colors.black),
                        obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Colors.transparent),
                              borderRadius:
                              BorderRadius.circular(30)),
                          contentPadding: const EdgeInsets.all(15),
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Color(0xff804ed1),
                          ),
                          suffix:  Wrap(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text:
                                        "RESEND ",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[600],
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                          }
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          // focusColor: Colors.blue,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Colors.white),
                              borderRadius:
                              BorderRadius.circular(30)),
                          labelText: 'Enter One Time OTP'.toUpperCase(),
                          labelStyle:const TextStyle(color: Colors.black) ,
                        ),
                        onSaved: (input) => _mobile = input,
                      ),
                      // const SizedBox(height: 10,),
                      // Container(
                      //     alignment: Alignment.centerRight,
                      //     child: Wrap(
                      //       children: [
                      //         RichText(
                      //           text: TextSpan(
                      //             children: [
                      //               TextSpan(
                      //                   text:
                      //                   "RESEND ",
                      //                   style: TextStyle(
                      //                     fontSize: 15,
                      //                     color: Colors.grey[600],
                      //                     decoration: TextDecoration.underline,
                      //                   ),
                      //                   recognizer: TapGestureRecognizer()
                      //                     ..onTap = () {
                      //                     }
                      //               ),
                      //             ],
                      //           ),
                      //         )
                      //       ],
                      //     )
                      // ),
                      SizedBox(height: 20,),

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
                              signup();
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => HomeWidget()),
                                    (Route<dynamic> route) => false,
                              );
                            },
                            child: const Text(
                                'Submit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30)
                            )),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          const Text(
                            'Don’t have an account? ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.black),
                          ),
                          const SizedBox(width:10),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => const MobileSignupWidget()));
                            },
                            child: const Text(
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.0, color: Color(0xffa37edc)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  static String validateName( String name,String text) {
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return  text + ' can\'t be empty';
    }
    return null;
  }
}