import 'package:flutter/material.dart';
import '../../../common/colors.dart' as Theme;

class UserStats extends StatelessWidget {
  final String posts;
  final String followers;
  final String following;

  UserStats(
      {@required this.posts,
      @required this.followers,
      @required this.following});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stats(label: 'Posts', value: posts),
        Stats(label: 'Followers', value: followers),
        Stats(label: 'Following', value: following),
      ],
    ));
  }
}

class Stats extends StatelessWidget {
  final String label;
  final String value;

  Stats({@required this.label, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(color: Theme.Colors.commentInfoTextColor)),
      ],
    );
  }
}
