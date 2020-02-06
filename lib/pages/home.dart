import 'package:flutter/widgets.dart';

import '../widgets/scaffold.dart';
import '../widgets/button.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
        child: Column(children: [
          Text('My Pixels'),
          Button(
              label: 'See pixel',
              onPressed: () {
                Navigator.of(context).pushNamed('/pixel_detail');
              }
          ),
        ]),
    ));
  }
}
