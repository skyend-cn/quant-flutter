import 'package:flutter/material.dart';
import 'package:quant/generated/l10n.dart';
import 'package:quant/utils/global.dart';
import 'package:share/share.dart';

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
            child: Text(S.of(context).mine_feedback),
          ),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 20),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
        ),
        Divider(
          height: 1.0,
        ),
        ListTile(
          onTap: () {
            //todo
            if (Theme.of(context).platform == TargetPlatform.android) {
              Share.share(S.of(context).share_android_app);
            } else {
              Share.share(S.of(context).share_ios_app);
            }
          },
          leading: Icon(Icons.share_outlined, size: 22),
          title: Container(
            transform: Matrix4.translationValues(-20, 0.0, 0.0),
            child: Text(S.of(context).mine_share),
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
