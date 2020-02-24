import 'package:flutter/widgets.dart';
import '../widgets/scaffold.dart';

class SendPixel extends StatelessWidget {
  Widget build(BuildContext context) {
    final imageFile = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          Text('Fill pixel data to send'),
          Text('Fill pixel data to send'),
          Text('Fill pixel data to send'),
          Image.file(imageFile, height: 60, width: 60, fit: BoxFit.fill),
        ],
      ),
    ));
  }
}
