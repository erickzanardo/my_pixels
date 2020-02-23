import 'package:flutter/widgets.dart';
import '../../widgets/user_photo.dart';
import '../../widgets/scaffold.dart';
import './widgets/user_stats.dart';

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
                    size: 100,
                    margin: EdgeInsets.all(10),
                    photoURL:
                        'https://vignette.wikia.nocookie.net/bobesponjabrasil/images/8/85/316508_orig.png/revision/latest/scale-to-width-down/340?cb=20131128193955&path-prefix=pt-br'),
                Expanded(
                  child: UserStats(
                    posts: '123',
                    followers: '123',
                    following: '123',
                  ),
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
