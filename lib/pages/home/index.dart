import 'package:flutter/material.dart';
import 'package:quant/pages/home/discover/index.dart';
import 'package:quant/pages/home/market/index.dart';
import 'package:quant/pages/home/mine/index.dart';

class Home extends StatefulWidget {
  final String routeName;
  final Object arguments;

  static Market _market = Market();
  static Discover _discover = Discover();
  static Mine _mine = Mine();

  final Map<int, Map> pages = {
    0: _createPage(_market, appbar: _market.getAppBar(), rountName: '/market'),
    1: _createPage(_discover,
        appbar: _discover.getAppBar(), rountName: '/discover'),
    2: _createPage(_mine, appbar: _mine.getAppBar(), rountName: '/mine'),
  };

  static Map _createPage(Widget page, {AppBar appbar, String rountName}) {
    return {"widget": page, "appbar": appbar, "routeName": rountName};
  }

  static Home _singleton;

  Home.singleton({this.routeName, this.arguments});

  factory Home({String routeName, Object arguments}) {
    if (_singleton == null) {
      _singleton = Home.singleton(routeName: routeName, arguments: arguments);
    }
    return _singleton;
  }

  getPageIndex(routeName) {
    switch (routeName) {
      case '/market':
        return 0;
      case '/discover':
        return 1;
      case '/mine':
        return 2;
      default:
        return 0;
    }
  }

  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Home> {
  static int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
