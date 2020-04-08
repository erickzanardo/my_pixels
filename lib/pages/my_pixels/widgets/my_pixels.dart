import 'package:flutter/widgets.dart';
import 'package:my_pixels/models/user.dart';
import '../../../widgets/scaffold.dart';
import './header.dart';
import './pixels.dart';

class MyPixels extends StatelessWidget {
  final bool myself;
  final bool following;
  final UserModel userModel;
  final int followersCount;
  final int followingCount;
  final List<String> pixels;

  MyPixels(
      {this.myself = true,
      this.following = false,
      @required this.userModel,
      @required this.followingCount,
      @required this.followersCount,
      @required this.pixels});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Header(
            following: following,
            myself: myself,
            photoURL: userModel.photoURL,
            name: userModel.name,
            bio: userModel.bio,
            postsCount: pixels.length,
            followersCount: followersCount,
            followingCount: followingCount,
          ),
          Pixels(pixels: pixels),
        ],
      )),
    );
  }
}
