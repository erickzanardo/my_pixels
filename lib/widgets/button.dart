import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as M;
import 'package:flutter/cupertino.dart' as C;
import 'package:meta/meta.dart';

import 'dart:io' show Platform;

class Button extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  Button({ @required this.label, @required this.onPressed });

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return M.RaisedButton(child: Text(label), onPressed: onPressed);
    } else {
      return C.CupertinoButton(child: Text(label), onPressed: onPressed);
    }
  }
}
