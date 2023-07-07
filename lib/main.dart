import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'Screens/Login.dart';
import 'Screens/Register.dart';
import 'Screens/Splash_Screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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