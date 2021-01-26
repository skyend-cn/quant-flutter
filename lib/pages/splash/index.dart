import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getuuid/flutter_getuuid.dart';
import 'package:quant/jsonserialize/user/data.dart';
import 'package:quant/utils/constant.dart';
import 'package:quant/utils/encrypt.dart';
import 'package:quant/utils/global.dart';
import 'package:quant/utils/logger.dart';
import 'package:quant/values/dimens.dart';
import 'package:quant/values/string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quant/values/color.dart' as res;

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SharedPreferences prefs;

  final int splashTime = 2;

  @override
  void initState() {
    super.initState();
    login();
    Future.delayed(Duration(seconds: splashTime), () async {
      G.pushNamed('/market');
    });
  }

  login() async {
    int startTime = DateTime.now().millisecondsSinceEpoch;
    String uuid = await FlutterGetuuid.platformUid;
    String nonce = startTime.toString();
    String md5 = Encrypt.MD5(nonce + Constant.SALT);

    Logger.v("startTime: " + startTime.toString());
    Logger.v("uuid: " + uuid);
    Logger.v("md5: " + md5);

    var res = G.req.user.login(uuid: uuid, nonce: nonce, md5: md5);

    res.then((value) {
      var data = value.data['data'];
      Logger.v("login response: " + data);

      UserData userData = new UserData(token: data, uuid: uuid);
      G.user.init(userData.toJson());
    }).whenComplete(() {
      int endTime = DateTime.now().millisecondsSinceEpoch;
      if (endTime - startTime > splashTime * 1000) {
        G.pushNamed('/market');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Strings.app_name,
              style: TextStyle(
                color: hex(res.Colors.colorPrimary),
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: Dimens.common_padding),
              child: Text(
                Strings.splash_slogan,
                style: TextStyle(
                  color: hex(res.Colors.colorPrimaryDark),
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
