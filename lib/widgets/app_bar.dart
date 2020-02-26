import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as M;
import 'package:flutter/cupertino.dart' as C;

class AppBar {
  final Widget title;

  AppBar({this.title});

  C.CupertinoNavigationBar toCupertino() {
    return C.CupertinoNavigationBar(
      middle: title,
    );
  }

  M.AppBar toMaterial() {
    return M.AppBar(
      title: title,
    );
  }
}
