import 'package:flutter/material.dart';
import 'package:quant/pages/feedback/index.dart' as fb;
import 'package:quant/pages/home/index.dart';
import 'package:quant/pages/splash/index.dart';

class Router {
  static final _routes = {
    '/splash': (BuildContext context, {Object args}) => Splash(),

    '/market': (BuildContext context, {Object args}) => Home(),
    '/discover': (BuildContext context, {Object args}) => Home(),
    '/mine': (BuildContext context, {Object args}) => Home(),

    '/feedback': (BuildContext context, {Object args}) => fb.Feedback(),

  };

  static Router _singleton;

  Router._internal();

  factory Router() {
    if (_singleton == null) {
      _singleton = Router._internal();
    }
    return _singleton;
  }

  Route getRoutes(RouteSettings settings) {
    String routeName = settings.name;
    final Function builder = Router._routes[routeName];
    print(settings);
    if (builder == null) {
      return null;
    } else {
      return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) =>
              builder(context, args: settings.arguments));
    }
  }
}
