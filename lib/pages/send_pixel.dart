import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/button.dart';
import '../widgets/scaffold.dart';

class SendPixel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SendPixelState();
  }
}

class SendPixelState extends State<SendPixel> {
  File _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      if (_image != null) Image.file(_image),
      Button(
        label: 'Load Pixel',
        onPressed: () {
          getImage();
        },
      )
    ])));
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
}
