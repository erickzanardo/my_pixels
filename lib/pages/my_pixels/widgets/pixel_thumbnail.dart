import 'package:flutter/material.dart';

class PixelThumbnail extends StatelessWidget {
  final String url;

  PixelThumbnail({@required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 50,
        child: Image.network(
          url,
          fit: BoxFit.fill,
          filterQuality: FilterQuality.none,
        ));
  }
}
