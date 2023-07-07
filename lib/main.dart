import 'package:flutter/material.dart';

import 'Screens/Login.dart';
import 'Screens/Register.dart';
import 'Screens/Splash_Screen.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splash_screen',
    routes: {
      'splash_screen':(context) => Splash_Screen(),
      'login':(context) => Login(),
      'register':(context) => Register(),
    },
  ));
}