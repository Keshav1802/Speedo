
import 'package:flutter/material.dart';

import '../containers/login_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:LoginContainer()
    );
  }
}
