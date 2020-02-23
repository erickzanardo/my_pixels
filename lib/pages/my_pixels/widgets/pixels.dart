import 'package:flutter/material.dart';
import './pixel_thumbnail.dart';

class Pixels extends StatelessWidget {
  final List<String> pixels;
  final int total;

  Pixels({@required this.pixels, @required this.total});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: total,
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
