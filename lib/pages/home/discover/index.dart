import 'package:flutter/material.dart';

class Discover extends StatefulWidget {
  static _DiscoverState _discoverState;

  Discover() {
    _discoverState = _DiscoverState();
  }

  getAppBar() => _discoverState.createAppBar();

  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  AppBar createAppBar() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
