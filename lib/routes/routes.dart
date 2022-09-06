import 'package:flutter/cupertino.dart';
import 'package:speedo/auth/login.dart';
import 'package:speedo/layout/draggablesection.dart';
import 'package:speedo/screens/driverfound.dart';

import '../layout/base.dart';

class Routes {
  Routes._();

  static const login = '/login';
  static const intro = '/intro';
  static const signup = '/signup';
  static const forgotpassword = "/forgotpassword";
  static const home = "/home";
  static const profile = "/profile";
  static const homescreen ="/homescreen";
  static const driverfound ="/driverfound";

  static Map<String, WidgetBuilder> get buildRoutes {
    return {
      // splashScreen: (BuildContext context) =>
      // const BaseLayout(page: SplashScreen(), isAppBar: false,),
      login: (BuildContext context) =>
      const BaseLayout(page: LoginScreen(), isAppBar: false,),
      driverfound:(BuildContext context) =>
      const BaseLayout(page: DriverFound(), isAppBar: false,),
      // signup: (BuildContext context) =>
      // const BaseLayout(page: SignupScreen(), isAppBar: false,),
      // forgotpassword: (BuildContext context) =>
      // const BaseLayout(page: ForgotPasswordScreen(), isAppBar: false,),
      homescreen: (BuildContext context) =>
      const BaseLayout(page: DraggableSection(), isAppBar: false,),
      // profile: (BuildContext context) =>
      // const BaseLayout(page: HomeScreen(), isAppBar: false,)
    };
  }
}