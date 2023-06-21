import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Future.delayed(Duration(seconds: 1)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFFF4000),
        child: Center(
          child: Container(
            width: 299,
            height: 299,
            child: Image.asset("assets/images/logo.png"),
          ),
        ));
  }

  void navigateToHome() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }
}
