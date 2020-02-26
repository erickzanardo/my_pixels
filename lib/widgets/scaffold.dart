import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as M;
import 'package:flutter/cupertino.dart' as C;
import 'package:meta/meta.dart';

import 'dart:io' show Platform;

import 'app_bar.dart';

class Scaffold extends StatelessWidget {
  final Widget body;
  final AppBar appBar;

  Scaffold({@required this.body, this.appBar});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return C.CupertinoPageScaffold(
        child: body,
        navigationBar: appBar?.toCupertino(),
      );
    } else {
      return M.Scaffold(
        body: body,
        appBar: appBar?.toMaterial(),
      );
    }
  }
}
