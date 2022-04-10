import 'dart:io';

import 'package:flutter/material.dart';

// ====================================================== [Models] ======================================================
class AlertInfo_DATA {
  final String? title;
  final List<MyAction> actions;
  final String? content;
  final String? logo;
  final String? image;
  final IconData? icon;
  final bool canGetBack;

  AlertInfo_DATA(
      {this.title,
      required this.actions,
      this.icon,
      this.content,
      this.logo,
      this.image,
      this.canGetBack = true});
}

class MyAction {
  final String? title;
  var action;
  var context;

  setContext(context) {
    this.context = context;
  }

  MyAction({this.action, this.title});
}

// ====================================================== [Data] ======================================================
/// {1} => [App exsit]
List<MyAction> actions1 = [
  // MyAction(
  //     title: "رجوع",
  //     action: (context) {
  //       Navigator.pop(context);
  //     }),
  MyAction(
      title: "خروج",
      action: () {
        exit(0);
      }),
];

AlertInfo_DATA exitApp_Alert = AlertInfo_DATA(
    // canGetBack: false,
    actions: actions1,
    title: "الخروج من التطبيق",
    content: "هل انت متاكد انك تريد تسجيل الخروج" * 4);
