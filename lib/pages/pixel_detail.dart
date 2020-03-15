import 'package:flutter/widgets.dart';
import 'package:my_pixels/common/colors.dart';
import 'package:my_pixels/pages/comment_page.dart';
import 'package:my_pixels/widgets/comment/comment_list.dart';

import '../models/pixel.dart';
import '../services/pixel_service.dart';
import '../widgets/scaffold.dart';

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
                      _comments(context, snapshot.data)
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

  Widget _comments(BuildContext context, PixelModel pixel) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CommentList(
        comments: pixel.comments,
        initialVisibleComments: 3,
        onShowAllComments: () {
          Navigator.of(context).pushNamed(CommentPage.routeName,
              arguments: CommentPageArgs(pixel));
        },
      ),
    );
  }
}
