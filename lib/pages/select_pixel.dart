import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/button.dart';
import '../widgets/scaffold.dart';

class SelectPixel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getImage(),
            builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
              if (snapshot.hasData) {
                return Center(
                    child: Column(children: <Widget>[
                  Image.file(snapshot.data),
                  Button(
                    label: 'Next',
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('/send_pixel', arguments: snapshot.data);
                    },
                  ),
                ]));
              } else {
                return Button(
                    onPressed: () {
                      getImage();
                    },
                    label: 'Load Pixel');
              }
            }));
  }

  Future<File> getImage() {
    return Future.value(ImagePicker.pickImage(source: ImageSource.gallery));
  }
}
