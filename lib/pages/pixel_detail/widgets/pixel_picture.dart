import 'package:flutter/material.dart';

class PixelPicture extends StatelessWidget {
  final String url;

  PixelPicture({@required this.url});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 400,
          child: Image.network(
            this.url,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.none,
          )),
    );
  }
}
