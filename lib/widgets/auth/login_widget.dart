import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedo/auth/forgotpassword.dart';
import 'package:speedo/screens/home.dart';
import 'package:speedo/widgets/auth/login_with_mobile.dart';
import 'package:speedo/widgets/auth/signup_widget.dart';
import '../../routes/routes.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

   String _email, _password;
   bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
  }

  Future<void> signin()  async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      await Future.delayed(Duration(milliseconds: 300));
      Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(fullscreenDialog: true,builder: (context) => HomeWidget()),
            (Route<dynamic> route) => false,
      );
    }
    await Future.delayed(Duration(milliseconds: 300));
    Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(fullscreenDialog: true,builder: (context) => HomeWidget()),
          (Route<dynamic> route) => false,
    );
  }

 static bool isValidEmail(String email) {
   print("email bool:" + RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email).toString());
    return RegExp(
       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Center(
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
                    'Sign in to continue',
                    style: TextStyle(fontSize: 14.0,color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
                ]
            )
          ),
          const SizedBox(height: 40,),
          // E-mail TextField
           Container(
             padding: const EdgeInsets.all(16),
             child: Form(
               key: _formkey,
               child: Column(
                 children: [
                   // E-mail TextField
                   TextFormField(
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
                         labelText: 'EMAIL',
                         labelStyle: const TextStyle(color: Colors.black),
                     ),
                     onSaved: (input) => _email = input,
                   ),
                   const Padding(
                     padding: EdgeInsets.all(10),
                   ),
                   // Password TextField
                   TextFormField(
                     keyboardType: TextInputType.text,
                     cursorColor: Colors.black12,
                     style: const TextStyle(color: Colors.black),
                     obscureText: !_passwordVisible,
                     validator: (input) {
                       if (input.isEmpty) {
                         return 'Password cant be empty';
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
                           Icons.lock,
                           color: Color(0xff804ed1),
                         ),
                         suffixIcon: IconButton(
                           icon: Icon(
                             // Based on passwordVisible state choose the icon
                             _passwordVisible
                                 ? Icons.visibility
                                 : Icons.visibility_off,
                             color: Colors.grey,
                           ),
                           onPressed: () {
                             // Update the state i.e. toogle the state of passwordVisible variable
                             setState(() {
                               _passwordVisible = !_passwordVisible;
                             });
                           },
                         ),
                         filled: true,
                           fillColor: Colors.white,
                        // focusColor: Colors.blue,
                         focusedBorder: OutlineInputBorder(
                             borderSide:
                             const BorderSide(color: Colors.white),
                             borderRadius:
                             BorderRadius.circular(30)),
                         labelText: 'PASSWORD',
                         labelStyle:const TextStyle(color: Colors.black) ,
                        ),
                     onSaved: (input) => _password = input,
                   ),
                   const SizedBox(height: 10,),
                   Container(
                     alignment: Alignment.centerRight,
                     child: GestureDetector(
                       onTap: (){
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
                       },
                       child: const Text(
                         'Forgot password ?',

                         style: TextStyle(
                             fontSize: 16.0,
                             color: Colors.black
                             ),
                       ),
                     ),
                   ),
                   const Padding(
                     padding: EdgeInsets.only(top: 30),
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
                         shape: const StadiumBorder(),
                         onPressed: () { signin(); },
                         child: const Text(
                           'Sign In',
                           style: TextStyle(
                               color: Colors.white, fontSize: 30)
                         )

                     ),
                   ),
                   const Padding(
                     padding: EdgeInsets.only(top: 20),
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: const [
                       // GestureDetector(
                       //   onTap: () {}, // Image tapped
                       //   child: Image.asset(
                       //     Images.google_Img,
                       //     fit: BoxFit.cover, // Fixes border issues
                       //     width: 50.0,
                       //     height: 50.0,
                       //   ),
                       // ),
                       SizedBox(width: 20,),
                       // GestureDetector(
                       //   onTap: () {}, // Image tapped
                       //   child: Image.asset(
                       //     Images.facebook_img,
                       //     fit: BoxFit.cover, // Fixes border issues
                       //     width: 50.0,
                       //     height: 50.0,
                       //   ),
                       // )
                     ],
                   ),
                   const SizedBox(height: 20,),
                   // Text Button to Sign Up page
                 const Text(
                       '------------------  OR SIGN IN WITH  ---------------------',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                           fontSize: 16.0, color: Colors.black),
                     ),
                   const SizedBox(
                     height: 20,
                   ),
                   const Text(
                     'Mobile',
                     textAlign: TextAlign.center,
                     style: TextStyle(
                         fontSize: 13.0, color: Colors.black),
                   ),
                   const SizedBox(height: 10),
                   GestureDetector(
                     child: IconButton(
                       icon: Image.asset('assets/images/img_3.png'),
                       onPressed: () {
                         Navigator.pushReplacement(context,
                             MaterialPageRoute(builder: (context) => const LoginWithPhone()));
                       },
                       iconSize: 50,
                     ),
                   ),
                   const SizedBox(height:50),
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
                            MaterialPageRoute(builder: (context) => const SignupWidget()));
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
    );
  }
}
