import 'package:flutter/widgets.dart';
import '../../widgets/scaffold.dart';
import './widgets/header.dart';

class MyPixels extends StatelessWidget {
  final bool myself;
  final bool following;

  MyPixels({this.myself = true, this.following = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Header(
            following: following,
            myself: myself,
          )
        ],
      )),
    );
  }
}
