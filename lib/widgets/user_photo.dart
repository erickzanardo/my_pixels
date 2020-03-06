import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget {
  final String photoURL;
  final EdgeInsets margin;
  final double size;

  UserPhoto({@required this.photoURL, this.margin, this.size = 50});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        width: size,
        height: size,
        child: Image.network(
          photoURL,
          fit: BoxFit.fill,
          filterQuality: FilterQuality.none,
        ));
  }
}
