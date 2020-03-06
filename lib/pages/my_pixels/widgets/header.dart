import 'package:flutter/material.dart';
import '../../../widgets/button.dart';
import '../../../widgets/user_photo.dart';
import '../widgets/user_stats.dart';

class Header extends StatelessWidget {
  final bool myself;
  final bool following;
  final String photoURL;
  final String name;
  final String bio;
  final int postsCount;
  final int followersCount;
  final int followingCount;

  Header(
      {@required this.myself,
      @required this.following,
      @required this.photoURL,
      @required this.name,
      @required this.bio,
      @required this.postsCount,
      @required this.followersCount,
      this.followingCount});

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
                size: 100, margin: EdgeInsets.all(10), photoURL: photoURL),
            Expanded(
              child: UserStats(
                posts: '$postsCount',
                followers: '$followersCount',
                following: '$followingCount',
              ),
            ),
          ],
        ),
        Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(name, style: TextStyle(fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.only(left: 15), child: Text(bio)),
        Center(
            child: Button(
          label: _profileButtonLabel(),
          onPressed: () {},
        ))
      ],
    );
  }
}
