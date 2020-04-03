import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../common/colors.dart';
import '../../services/pixel_service.dart';
import '../../models/pixel.dart';
import '../../widgets/comment/comment_list.dart';
import './Picture.dart';
import './AuthorInsights.dart';

const containerMargin =
    EdgeInsets.only(left: 10, right: 10, top: 13, bottom: 13);

class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 480,
        margin: containerMargin,
        color: Colors.detailBackground,
        child: FutureBuilder(
            future: PixelService.fetchPixel(),
            builder:
                (BuildContext context, AsyncSnapshot<PixelModel> snapshot) {
              if (snapshot.hasData) {
                String dateFormat = DateFormat.yMMMMEEEEd()
                    .format(snapshot.data.createdAt)
                    .toString();
                return Column(children: [
                  Container(
                      margin: EdgeInsets.all(5),
                      child: Text(dateFormat, textAlign: TextAlign.left)),
                  Picture(url: snapshot.data.url),
                  AuthorInsights(
                      authorName: snapshot.data.authorId,
                      likesCount: snapshot.data.likes,
                      commentsCount: snapshot.data.comments.length),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CommentList(
                      comments: snapshot.data.comments,
                      initialVisibleComments: 3,
                      incrementVisibleCount: 2,
                      enableComment: false,
                    ),
                  )
                ]);
              } else if (snapshot.hasError) {
                return Text("Somethis is wrong");
              } else {
                return Text("Loading");
              }
            }));
  }
}
