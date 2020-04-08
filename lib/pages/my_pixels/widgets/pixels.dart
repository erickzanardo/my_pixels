import 'package:flutter/material.dart';
import './pixel_thumbnail.dart';

class Pixels extends StatelessWidget {
  final List<String> pixels;

  Pixels({@required this.pixels});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: pixels.length,
          primary: false,
          padding: EdgeInsets.all(10),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return PixelThumbnail(
              url: pixels[index],
            );
          }),
    );
  }
}
