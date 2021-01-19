import 'package:flutter/material.dart';

class Mine extends StatefulWidget {
  static _MineState _mineState;

  Mine() {
    _mineState = _MineState();
  }

  getAppBar() => _mineState.createAppBar();

  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  AppBar createAppBar() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
