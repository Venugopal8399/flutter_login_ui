import 'package:flutter/material.dart';
import 'package:flutter_login_ui/Page%20Transition/page_transition.dart';
import 'package:flutter_login_ui/Screens/Login.dart';
import 'package:flutter_login_ui/Screens/Navigation_Bar/Home.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }
  void _navigate() async{
    await Future.delayed(Duration(milliseconds: 2000),(){});
    Navigator.pushReplacement(context, PageTransition(child: Login()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('SET',style: TextStyle(
            fontSize: 48, color: Colors.black,
            fontFamily: 'NEW YORK',
          ),),
        ),
      ),
    );
  }
}
