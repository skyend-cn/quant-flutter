import 'package:flutter/material.dart';

class Feedback extends StatefulWidget {
  static _FeedbackState _feedbackState;

  Feedback() {
    _feedbackState = _FeedbackState();
  }

  getAppBar() => _feedbackState.createAppBar();

  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  AppBar createAppBar() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
