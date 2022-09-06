import 'dart:async';

import 'package:flutter/material.dart';
import 'package:speedo/auth/login.dart';
import 'package:speedo/widgets/auth/forgotpassword_widget1.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({Key key}) : super(key: key);

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  final _phonenumber = TextEditingController();
   bool _validate = false;
   String _number;
  int start = 30;
  bool wait = false;

  String validateMobile(String value) {
    if (value.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else {
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
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
                        'Enter Registered Number here',
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
                    MaterialPageRoute(builder: (context) => const LoginScreen()));
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
                'Enter your Registered number and we will send you a reset instructions.'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(50, 50, 50, 10),
              child: const Text(
                'Mobile Number',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                ),
              )),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(50, 5, 50, 50),
            child: TextFormField(
              controller: _phonenumber,
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(30)),
                contentPadding: const EdgeInsets.all(15),
                filled: true,
                fillColor: const Color(0x00f7f8f9),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(30)),
              ),
              validator: (input) {
               if(input.isEmpty){
                return "Email can't be empty";
                }
               if (input.length != 10) {
                 return 'Mobile Number must be of 10 digit';
               } else {
                 return null;
               }
          // print("value:" + input.toString());
          // if(input!.isEmpty){
          // return "Email can't be empty";
          // }
          // else if (validateMobile(input)) {
          // return 'Enter a valid  email';
          // }
          },
              onSaved: (input) => _number = input,
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
                startTimer();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordWidget1()),
                      (Route<dynamic> route) => true,
                );
              },
              child: Container(
                height: 30,
                width: 130,
                child: Text("Continue",
                style: TextStyle(fontSize: 30,color: Colors.white),),)
            ),
          ),
        ]),
      ),
    );

  }
   void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }
}
