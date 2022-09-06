import 'package:flutter/material.dart';
import 'package:speedo/screens/intro.dart';
import 'package:speedo/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speedo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: './',
      routes : Routes.buildRoutes,
      home: const IntroScreen(),
    );
  }
}

