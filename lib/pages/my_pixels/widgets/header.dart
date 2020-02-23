import 'package:flutter/material.dart';
import '../../../widgets/button.dart';
import '../../../widgets/user_photo.dart';
import '../widgets/user_stats.dart';

class Header extends StatelessWidget {
  final bool myself;
  final bool following;

  Header({@required this.myself, @required this.following});

  String _profileButtonLabel() {
    if (myself) {
      return "Edit";
    }
    return following ? "Unfollow" : "Follow";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('Tyemy Kuga',
                style: TextStyle(fontWeight: FontWeight.bold))),
        Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text('Biografia da Tyemy Kuga')),
        Center(
            child: Button(
          label: _profileButtonLabel(),
          onPressed: () {},
        ))
      ],
    );
  }
}
