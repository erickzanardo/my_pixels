import 'package:flutter/widgets.dart';
import 'package:my_pixels/pages/my_pixels/widgets/pixel_thumbnail.dart';
import '../../widgets/scaffold.dart';
import './widgets/header.dart';

class MyPixels extends StatelessWidget {
  final bool myself;
  final bool following;
  final String photoURL;
  final String name;
  final String bio;
  final int postsCount;
  final int followersCount;
  final int followingCount;
  final List<String> pixels;

  MyPixels(
      {this.myself = true,
      this.following = false,
      @required this.photoURL,
      @required this.name,
      @required this.bio,
      @required this.postsCount,
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
            photoURL: photoURL,
            name: name,
            bio: bio,
            postsCount: postsCount,
            followersCount: followersCount,
            followingCount: followingCount,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: postsCount,
                primary: false,
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return PixelThumbnail(
                    url: pixels[index],
                  );
                }),
          ),
        ],
      )),
    );
  }
}
