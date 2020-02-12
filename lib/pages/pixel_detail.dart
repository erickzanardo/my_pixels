import 'package:flutter/widgets.dart';
import 'package:my_pixels/common/colors.dart';
import 'package:my_pixels/models/comment.dart';
import 'package:my_pixels/widgets/comment/comment_list.dart';

import '../widgets/scaffold.dart';
import '../services/pixel_service.dart';
import '../models/pixel.dart';

class PixelDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.detailBackground,
            child: FutureBuilder(
              future: PixelService.fetchPixel(),
              builder:
                  (BuildContext context, AsyncSnapshot<PixelModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      _picture(snapshot.data.url),
                      _comments(snapshot.data.comments)
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('Error');
                } else {
                  return Text('Loading..');
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _picture(String url) {
    return Center(
      child: Container(
          width: 400,
          child: Image.network(
            url,
            fit: BoxFit.fill,
            filterQuality: FilterQuality.none,
          )),
    );
  }

  Widget _comments(List<Comment> comments) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CommentList(
        comments: comments,
        initialVisibleComments: 3,
        incrementVisibleCount: 2,
        expandable: true,
      ),
    );
  }
}
