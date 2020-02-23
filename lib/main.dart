import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:io' show Platform;

import './pages/home.dart';
import './pages/pixel_detail.dart';
import './pages/my_pixels/my_pixels.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String imgURL =
        'https://vignette.wikia.nocookie.net/bobesponjabrasil/images/8/85/316508_orig.png/revision/latest/scale-to-width-down/340?cb=20131128193955&path-prefix=pt-br';
    List<String> pixels = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSX5qVJ2T2Ho9BLkis_iIw5eYELHub8lQiIPGiMhwoOCwf40ptQ',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSOeSEndY3DxpdYAk6WRunljGlNMRQCFM_eVA7FtCFElju03gJE',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS8aFBca4m0QYSilB6DCzVj7nUGFh3l5vsvdO2HnUyBQ35IKd-l',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSUW6XbzKAnCaIS7gdXEezIh6f-37MWFnFTWZzeIXuE2TqxjGWL',
      'https://dejpknyizje2n.cloudfront.net/marketplace/products/pixel-art-pig-sticker-1568126686.5486526.png',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSX5qVJ2T2Ho9BLkis_iIw5eYELHub8lQiIPGiMhwoOCwf40ptQ',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSOeSEndY3DxpdYAk6WRunljGlNMRQCFM_eVA7FtCFElju03gJE',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS8aFBca4m0QYSilB6DCzVj7nUGFh3l5vsvdO2HnUyBQ35IKd-l',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSUW6XbzKAnCaIS7gdXEezIh6f-37MWFnFTWZzeIXuE2TqxjGWL',
      'https://dejpknyizje2n.cloudfront.net/marketplace/products/pixel-art-pig-sticker-1568126686.5486526.png',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSX5qVJ2T2Ho9BLkis_iIw5eYELHub8lQiIPGiMhwoOCwf40ptQ',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSOeSEndY3DxpdYAk6WRunljGlNMRQCFM_eVA7FtCFElju03gJE',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS8aFBca4m0QYSilB6DCzVj7nUGFh3l5vsvdO2HnUyBQ35IKd-l',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSUW6XbzKAnCaIS7gdXEezIh6f-37MWFnFTWZzeIXuE2TqxjGWL',
      'https://dejpknyizje2n.cloudfront.net/marketplace/products/pixel-art-pig-sticker-1568126686.5486526.png',
    ];
    final routes = {
      '/': (BuildContext ctx) => Home(),
      '/pixel_detail': (BuildContext ctx) => PixelDetail(),
      '/my_pixels': (BuildContext ctx) => MyPixels(
            name: 'Tyemy Kuga',
            bio: 'Biografia da Tyemy Kuga',
            postsCount: pixels.length,
            followersCount: 123,
            followingCount: 123,
            pixels: pixels,
            photoURL: imgURL,
          ),
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
        initialRoute: '/my_pixels',
      );
    }
  }
}
