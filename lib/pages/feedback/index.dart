import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:quant/utils/global.dart';
import 'package:quant/utils/logger.dart';
import 'package:quant/values/string.dart' as res;
import 'package:quant/values/color.dart' as res;

class Feedback extends StatefulWidget {
  Feedback({Key key}) : super(key: key);

  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  TextEditingController contentController;
  TextEditingController contactController;

  @override
  void initState() {
    super.initState();
    contentController = TextEditingController();
    contactController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: rgba(50, 50, 50, 1),
        ),
        title: Text(
          res.Strings.feedback,
          style: TextStyle(color: rgba(50, 50, 50, 1)),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20),
              child: Text(
                res.Strings.feedback_content_title,
                style: TextStyle(fontSize: 18, color: rgba(117, 117, 117, 1)),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 8),
              color: rgba(236, 236, 236, 1),
              child: TextField(
                  controller: contentController,
                  maxLength: 400,
                  minLines: 5,
                  maxLines: 8,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: rgba(236, 236, 236, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: rgba(236, 236, 236, 1)),
                      ),
                      hintText: res.Strings.feedback_content_hint)),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                res.Strings.feedback_contact_title,
                style: TextStyle(fontSize: 18, color: rgba(117, 117, 117, 1)),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 8),
              color: rgba(236, 236, 236, 1),
              child: TextField(
                  controller: contactController,
                  maxLines: 1,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: rgba(236, 236, 236, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: rgba(236, 236, 236, 1)),
                      ),
                      hintText: res.Strings.feedback_contact_hint)),
            ),
            Container(
              width: 230,
              height: 50,
              margin: EdgeInsets.only(top: 50),
              child: RaisedButton(
                child: Text(
                  res.Strings.feedback_submmit,
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  _submit();
                },
                textColor: Colors.white,
                color: hex(res.Colors.colorPrimary),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _submit() async {
    String content = contentController.text;
    String contact = contactController.text;

    if (content.isEmpty) {
      return;
    }

    if (contact.isNotEmpty) {
      content = content +
          "\n\n" +
          res.Strings.feedback_contact_title +
          ": " +
          contact;
    }

    String uuid = G.user.data.uuid;

    G.loading.show(context);

    var response = G.req.user.feedback(phone: uuid, content: content);

    response.then((value) {
      if (value.data['code'] == 200) {
        G.toast("反馈成功");
      } else {
        G.toast("反馈失败");
      }
    }).whenComplete(() {
      G.loading.hide(context);
      G.pop();
    });
  }
}
