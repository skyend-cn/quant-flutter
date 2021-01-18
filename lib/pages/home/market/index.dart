import 'package:flutter/material.dart';

class Market extends StatefulWidget {
  static _MarketState _marketState;

  Market() {
    _marketState = _MarketState();
  }

  getAppBar() => _marketState.createAppBar();

  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  AppBar createAppBar() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
