import 'package:flutter/widgets.dart';

import '../widgets/button.dart';

class HomeHelper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('My Pixels'),
          Button(
            label: 'See pixel',
            onPressed: () {
              print('elias');
              Navigator.of(context).pushNamed('/pixel_detail');
            },
          ),
          Button(
              label: 'Send pixel',
              onPressed: () {
                Navigator.of(context).pushNamed('/select_pixel');
              }),
          Button(
              label: 'List pixels',
              onPressed: () {
                Navigator.of(context).pushNamed('/feed');
              }),
        ],
      ),
    );
  }
}
