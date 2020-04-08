import 'package:flutter/widgets.dart';

class Picture extends StatelessWidget {
  final String url;

  Picture({@required this.url});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 400,
          height: 260,
          child: Image.network(
            url,
            fit: BoxFit.fitWidth,
            filterQuality: FilterQuality.none,
          )),
    );
  }
}
