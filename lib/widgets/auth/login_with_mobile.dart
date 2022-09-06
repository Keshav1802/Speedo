import 'package:flutter/material.dart';
import 'package:speedo/auth/forgotpassword.dart';
import 'package:speedo/widgets/auth/mobile_signup.dart';
import 'package:speedo/widgets/auth/otp_screen.dart';
import 'package:speedo/widgets/auth/signup_widget.dart';
import '../../resources/images.dart';
import '../../routes/routes.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({Key key}) : super(key: key);

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

   String _email, _password;
  final _phoneTextController1 = TextEditingController();

  void signin()  {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      //  Navigator.pushReplacementNamed(context, Routes.home);
    }
    Navigator.pushReplacementNamed(context, Routes.home);
  }

  static bool isValidEmail(String email) {
    print("email bool:" + RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email).toString());
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static String validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp =  RegExp(patttern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
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
                  key: _formkey,
                  child: Column(
                    children: [
                      // E-mail TextField
                      // Row(
                      //   children: [
                      //     // const Image(image: AssetImage('assets/images/img_4.png')),
                      //     // Icon(AssetImage('assets/images/img_4.png')),
                      //     const SizedBox(width: 10),
                      //     const Text(
                      //       '+91',
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 12,
                      //       ),
                      //     ),
                      //     const SizedBox(width: 10),
                      //     const VerticalDivider(
                      //       color: Colors.white60,
                      //       thickness: 1.6,
                      //     ),
                          TextFormField(
                            controller: _phoneTextController1,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
                            validator: (value) => validateMobile(
                                value),
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
                        padding: EdgeInsets.all(10),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 50),
                      ),

                      //  Sign In button

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
                            onPressed: () async{
                              await Future.delayed(Duration(milliseconds: 200));
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => OtpScreen()),
                                    (Route<dynamic> route) => false,
                              );
                            },
                            shape: const StadiumBorder(),
                            child: const Text(
                                'Get OTP',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30)
                            )),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                      const SizedBox(height: 20,),
                      const Text(
                        '------------------  OR SIGN IN WITH  ---------------------',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.0, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        child: IconButton(
                          icon: Image.asset('assets/images/google_icon.png'),
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => const LoginWithPhone()));
                          },
                          iconSize: 60,
                        ),
                      ),
                      const SizedBox(height:140),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          const Text(
                            'Don\'t have an account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.black),
                          ),
                          const SizedBox(width:10),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => const MobileSignupWidget()));
                            },
                            child: const Text(
                              'Sign up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.0, color: Color(0xffa37edc)),
                            ),
                          ),
                        ],
                      )
                    ],

                  ),
                ),
              ),



            ]
        ),
      ),
    );
  }
}

