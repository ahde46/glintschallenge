import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static Future<T> push<T>(BuildContext context, Widget page) {
    return Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => page,
        transitionDuration: Duration(seconds: 0),
      ),
    );
  }

  static Future<T> cupertinoPush<T>(BuildContext context, Widget page) {
    return Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => page,
      ),
    );
  }

  static back(BuildContext context) {
    Navigator.pop(context);
  }

  static Future<T> pushAndRemoveUntil<T>(BuildContext context, Widget page) {
    return Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => page,
          transitionDuration: Duration(seconds: 0),
        ),
        (Route<dynamic> route) => false);
  }
}
