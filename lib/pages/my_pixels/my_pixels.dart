import 'package:flutter/widgets.dart';
import 'package:my_pixels/widgets/user_photo.dart';
import '../../widgets/scaffold.dart';

class MyPixels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                UserPhoto(
                    margin: EdgeInsets.all(10),
                    photoURL:
                        'https://vignette.wikia.nocookie.net/bobesponjabrasil/images/8/85/316508_orig.png/revision/latest/scale-to-width-down/340?cb=20131128193955&path-prefix=pt-br'),
                Row(
                  children: [],
                ),
              ],
            ),
            Text('My Pixels'),
          ],
        ),
      ),
    );
  }
}
