import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/button.dart';
import '../widgets/scaffold.dart' as scaf;

class SelectPixel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SelectPixelState();
  }
}

class SelectPixelState extends State<SelectPixel> {
  File _image;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: scaf.Scaffold(
        body: Center(
            child: Column(children: [
      if (_image != null) Image.file(_image),
      Button(
        label: 'Load Pixel',
        onPressed: () {
          getImage();
        },
      )
    ]))));
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
}
