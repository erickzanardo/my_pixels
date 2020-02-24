import 'package:flutter/widgets.dart';

import '../widgets/button.dart';
import '../widgets/scaffold.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('My Pixels'),
              Button(
                label: 'See pixel',
                onPressed: () {
                  Navigator.of(context).pushNamed('/pixel_detail');
                },
              ),
              Button (label: 'Send pixel',
                  onPressed: (){
                    Navigator.of(context).pushNamed('/select_pixel');
                  }
              )
            ],
          ),
        ]),
    ));
  }
}
