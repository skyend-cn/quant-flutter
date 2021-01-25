import 'package:flutter/material.dart';
import 'package:quant/utils/global.dart';
import 'package:share/share.dart';
import 'package:quant/values/string.dart' as res;

class Mine extends StatefulWidget {
  static _MineState _mineState;

  Mine() {
    _mineState = _MineState();
  }

  getAppBar() => _mineState.createAppBar();

  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  AppBar createAppBar() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 60),
      child: Column(children: [
        Divider(
          height: 1.0,
        ),
        ListTile(
          onTap: () {
            G.pushNamed('/feedback');
          },
          leading: Icon(Icons.feedback_outlined, size: 22),
          title: Container(
            transform: Matrix4.translationValues(-20, 0.0, 0.0),
            child: Text(res.Strings.mine_feedback),
          ),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 20),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
        ),
        Divider(
          height: 1.0,
        ),
        ListTile(
          onTap: () {
            Share.share(res.Strings.share_app);
          },
          leading: Icon(Icons.share_outlined, size: 22),
          title: Container(
            transform: Matrix4.translationValues(-20, 0.0, 0.0),
            child: Text(res.Strings.mine_share),
          ),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 20),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
        ),
        Divider(
          height: 1.0,
        )
      ]),
    ));
  }
}
