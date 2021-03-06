import 'package:flutter/widgets.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/scaffold.dart';
import '../../common/colors.dart';
import './list_item.dart';

final String assetName = 'assets/images/logo.svg';
final Widget logo =
    SvgPicture.asset(assetName, semanticsLabel: 'My pixels logo');

class PixelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(children: [
      Container(
        padding: EdgeInsets.all(10),
        height: 80,
        child: logo,
      ),
      Expanded(
          child: Container(
              color: Colors.pixelListBackgroung,
              child: ListView(
                children: [
                  ListItem(),
                  ListItem(),
                  ListItem(),
                  ListItem(),
                ],
              )))
    ]))));
  }
}
