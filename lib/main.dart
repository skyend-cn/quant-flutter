import 'dart:convert';

import 'package:color_dart/rgba_color.dart';
import 'package:flutter/material.dart';
import 'package:quant/routes/index.dart' as AppRouter;
import 'package:quant/utils/constant.dart';
import 'package:quant/utils/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

final AppRouter.Router router = AppRouter.Router();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String user = prefs.getString(Constant.KEY_USER);
  if (user != null && user.isNotEmpty) {
    G.user.init(json.decode(user));
  }

  runApp(QuantApp());
}

class QuantApp extends StatefulWidget {
  @override
  _QuantAppState createState() => _QuantAppState();
}

class _QuantAppState extends State<QuantApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: G.navigatorKey,
      title: 'Quant',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(
            color: rgba(0,0,0,0),
          ),
          elevation: 0
        )
      ),
      initialRoute: '/splash',
      onGenerateRoute: router.getRoutes,
    );
  }
}
