import 'package:flutter/widgets.dart';
import 'package:my_pixels/common/colors.dart';
import '../../../pages/pixel_detail/widgets/pixel_comments.dart';
import '../../../pages/pixel_detail/widgets/pixel_picture.dart';

import '../../../models/comment.dart';
import '../../../models/pixel.dart';
import '../../../widgets/scaffold.dart';

class PixelDetail extends StatelessWidget {
  final PixelModel pixel;
  final List<Comment> comments;

  PixelDetail({@required this.pixel, @required this.comments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.detailBackground,
            child: Column(
              children: <Widget>[
                PixelPicture(url: this.pixel.url),
                PixelComments(comments: this.comments ?? [])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
