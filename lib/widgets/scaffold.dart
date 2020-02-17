import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as M;
import 'package:flutter/cupertino.dart' as C;
import 'package:meta/meta.dart';

import 'dart:io' show Platform;

class Scaffold extends StatelessWidget {
  final Widget body;

  Scaffold({@required this.body});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return C.CupertinoPageScaffold(child: body);
    } else {
      return M.Scaffold(body: body);
    }
  }
}
