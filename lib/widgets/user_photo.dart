import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget {
  final String photoURL;
  final EdgeInsets margin;

  UserPhoto({@required this.photoURL, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        width: 50,
        height: 50,
        child: Image.network(
          photoURL,
          fit: BoxFit.fill,
          filterQuality: FilterQuality.none,
        ));
  }
}
