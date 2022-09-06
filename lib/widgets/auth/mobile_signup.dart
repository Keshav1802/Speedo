import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:speedo/auth/login.dart';
import 'package:speedo/widgets/auth/login_with_mobile.dart';
import 'package:speedo/widgets/auth/otp_signup_verify.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileSignupWidget extends StatefulWidget {
  const MobileSignupWidget({Key key}) : super(key: key);

  @override
  State<MobileSignupWidget> createState() => _MobileSignupWidgetState();
}

class _MobileSignupWidgetState extends State<MobileSignupWidget> {
  final _registerFormKey = GlobalKey<FormState>();
  final _nameTextController = TextEditingController();
  final _otpcontroller = TextEditingController();
  final _phoneTextController2 = TextEditingController();
  final _emailTextController = TextEditingController();

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
                  key: _registerFormKey,
                  child: Column(
                    children: [
                      // E-mail TextField
                      TextFormField(
                        controller: _phoneTextController2,
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
                        padding: EdgeInsets.all(15),
                      ),
                      TextFormField(
                        controller: _otpcontroller,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black12,
                        style: const TextStyle(color: Colors.black),
                        obscureText: true,
                        validator: (value) => validateMobile(
                            value),
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
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: _nameTextController,
                        keyboardType: TextInputType.name,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        validator: (value) => validateName(
                            value,"Name"),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Colors.transparent),
                              borderRadius:
                              BorderRadius.circular(30)),
                          contentPadding: const EdgeInsets.all(15),
                          prefixIcon: const Icon(
                            Icons.account_circle_outlined,
                            color: Color(0xff804ed1),
                          ),
                          filled: true,
                          fillColor:  Colors.white,
                          //focusColor: Colors.red,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Colors.white),
                              borderRadius:
                              BorderRadius.circular(30)),
                          labelText: 'FULL NAME',
                          labelStyle: const TextStyle(color: Colors.black),
                        ),
                        onSaved: (input) => _name = input,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15),
                      ),
                      TextFormField(
                        controller: _emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        validator: (input) {
                          print("value:" + input.toString());
                          if(input.isEmpty){
                            return "Email can't be empty";
                          }
                          else if (!isValidEmail(input)) {
                            return 'Enter a valid  email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Colors.transparent),
                              borderRadius:
                              BorderRadius.circular(30)),
                          contentPadding: const EdgeInsets.all(15),
                          prefixIcon: const Icon(
                            Icons.mail_outline,
                            color: Color(0xff804ed1),
                          ),
                          filled: true,
                          fillColor:  Colors.white,
                          //focusColor: Colors.red,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: Colors.white),
                              borderRadius:
                              BorderRadius.circular(30)),
                          labelText: 'E-MAIL',
                          labelStyle: const TextStyle(color: Colors.black),
                        ),
                        onSaved: (input) => _email = input,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: value3,
                            onChanged: (value) {
                              setState(() {
                                this.value3 = value;
                              });
                            },
                          ),
                          Expanded(
                            child: Wrap(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text:
                                          "By continuing, you agree that you have read and accept our ",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[600],
                                          )),
                                      TextSpan(
                                          text: "T&Cs",
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            decoration: TextDecoration.underline,
                                            fontSize: 15,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              setState(() {
                                                _launched = _launchInBrowser(Uri(scheme: 'https', host: '', path: 'headers/'));
                                              });
                                            }),
                                      TextSpan(
                                          text: " and ",
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 15,
                                          )),
                                      TextSpan(
                                          text: "Privacy Policy",
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            decoration: TextDecoration.underline,
                                            fontSize: 15,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              setState(() {
                                                _launched = _launchInBrowser(Uri(scheme: 'https', host: '', path: 'headers/'));
                                              });
                                            })
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 50),
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
                            onPressed: (){
                              signup();
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => const Otpsignupverify()));
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
                            'Already have an account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.black),
                          ),
                          const SizedBox(width:10),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => const LoginWithPhone()));
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