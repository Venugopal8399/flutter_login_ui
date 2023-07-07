import 'package:flutter/cupertino.dart';

class PageTransition extends PageRouteBuilder {
  final Widget child;
  final int durationMs;
  final Curve curve;

  PageTransition({required this.child, this.durationMs = 800, this.curve = Curves.easeInOut})
      : super(
    transitionDuration: Duration(milliseconds: durationMs),
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation,
        Widget child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return child;
    },
  );
}