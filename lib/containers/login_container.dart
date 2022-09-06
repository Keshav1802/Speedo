
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/auth/login_widget.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: LoginWidget(),
            )
        ) ,
        );
  }
}
