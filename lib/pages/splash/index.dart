import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static _SplashState _splashState;

  Splash() {
    _splashState = _SplashState();
  }

  getAppBar() => _splashState.createAppBar();

  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  AppBar createAppBar() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
