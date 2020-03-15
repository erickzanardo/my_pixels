import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as M;
import 'package:flutter/cupertino.dart' as C;
import 'package:meta/meta.dart';

import 'dart:io' show Platform;

import 'app_bar.dart';
import 'bottom_navigation.dart';

class Scaffold extends StatelessWidget {
  final Widget body;
  final AppBar appBar;
  final BottomNavigate bottomNavigate;

  Scaffold({@required this.body, this.appBar, this.bottomNavigate});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return C.CupertinoPageScaffold(
        child: body,
        navigationBar: appBar?.asCupertino(),
      );
    } else {
      return M.Scaffold(
        body: body,
        appBar: appBar?.asMaterial(),
        bottomNavigationBar: bottomNavigate?.asMaterial(),
      );
    }
  }
}
