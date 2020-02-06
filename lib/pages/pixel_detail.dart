import 'package:flutter/widgets.dart';

import '../widgets/scaffold.dart';
import '../services/pixel.dart';
import '../models/pixel.dart';

class PixelDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FutureBuilder(
        future: PixelService.fetchPixel(),
        builder: (BuildContext context, AsyncSnapshot<PixelModel> snapshot) {
          if (snapshot.hasData) {
            return Center(
                child: Container(
                    width: 400,
                    child: Image.network(snapshot.data.url,
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.none,
                    )
                ),
            );
          } else if (snapshot.hasError) {
            return Text('Error');
          } else {
            return Text('Loading..');
          }
        }
    ));
  }
}
