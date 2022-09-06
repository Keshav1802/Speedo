import 'package:flutter/material.dart';
import 'package:speedo/auth/login.dart';

import 'forgotpassword_widget1.dart';

class ForgotPasswordWidget2 extends StatefulWidget {
  const ForgotPasswordWidget2({Key key}) : super(key: key);

  @override
  State<ForgotPasswordWidget2> createState() => _ForgotPasswordWidget2State();
}

class _ForgotPasswordWidget2State extends State<ForgotPasswordWidget2> {
  final TextEditingController _newpassword = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
   bool _validate = false;
   String _newpassword1;
   String _confirmpassword1;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                          'Reset Password',
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ])),
            // Container(
            //   alignment: Alignment.topLeft,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => const ForgotPasswordWidget1()));
            //     },
            //     child: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
            //     style: ElevatedButton.styleFrom(
            //       shape: const CircleBorder(),
            //       padding: const EdgeInsets.all(10),
            //       primary: Colors.white, // <-- Button color
            //       onPrimary: Colors.red, // <-- Splash color
            //     ),
            //   ),
            // ),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(50, 50, 50, 5),
                child: Text(
                  'New Password'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                  ),
                )),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 25),
              child: TextFormField(
                controller: _newpassword,
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
                onSaved: (input) => _newpassword1 = input,
              ),
            ),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 5),
                child: Text(
                  'Confirm Password'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                  ),
                )),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 50),
              child: TextFormField(
                controller: _confirmpassword,
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
                onSaved: (input) => _confirmpassword1 = input,
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
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                        (Route<dynamic> route) => false,
                  );
                },
                child: const Text('Reset Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
