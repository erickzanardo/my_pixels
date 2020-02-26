import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_pixels/pages/comment_page.dart';

import 'dart:io' show Platform;

import './pages/home.dart';
import './pages/pixel_detail.dart';
import './pages/select_pixel.dart';
import './pages/send_pixel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routes = {
      '/': (BuildContext ctx) => Home(),
      '/pixel_detail': (BuildContext ctx) => PixelDetail(),
      '/select_pixel': (BuildContext ctx) => SelectPixel(),
      '/send_pixel': (BuildContext ctx) => SendPixel(),
      CommentPage.routeName: (BuildContext ctx) => CommentPage(),
    };

    if (Platform.isAndroid) {
      return MaterialApp(
        title: 'My Pixels',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: routes,
      );
    } else {
      return CupertinoApp(
        title: 'My Pixels',
        routes: routes,
      );
    }
  }
}
