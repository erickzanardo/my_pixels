import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_pixels/pages/comment_page.dart';
import 'package:my_pixels/pages/my_pixels/my_pixels_page.dart';

import 'dart:io' show Platform;

import './pages/home.dart';
import './pages/pixel_detail/pixel_detail_page.dart';
import './pages/select_pixel.dart';
import './pages/send_pixel.dart';
import './pages/feed/feed_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routes = {
      '/': (BuildContext ctx) => Home(),
      '/my_pixels': (BuildContext ctx) => MyPixelsPage(),
      '/pixel_detail': (BuildContext ctx) => PixelDetailPage(),
      '/select_pixel': (BuildContext ctx) => SelectPixel(),
      '/send_pixel': (BuildContext ctx) => SendPixel(),
      '/feed': (BuildContext ctx) => FeedPage(),
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
        initialRoute: '/',
      );
    }
  }
}
