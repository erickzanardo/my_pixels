import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import './Picture.dart';
import './AuthorInsights.dart';

import '../../../common/colors.dart';
import '../../../models/comment.dart';
import '../../../models/pixel.dart';
import '../../../widgets/comment/comment_list.dart';

const containerMargin =
    EdgeInsets.only(left: 10, right: 10, top: 13, bottom: 13);

class ListItem extends StatelessWidget {
  final PixelModel pixel;
  final List<Comment> comments;
  final int likesCount;

  ListItem(
      {@required this.pixel,
      @required this.comments,
      @required this.likesCount});

  @override
  Widget build(BuildContext context) {
    String dateFormat =
        DateFormat.yMMMMEEEEd().format(pixel.createdAt).toString();

    return Container(
      height: 480,
      margin: containerMargin,
      color: Colors.detailBackground,
      child: Column(children: [
        Container(
            margin: EdgeInsets.all(5),
            child: Text(dateFormat, textAlign: TextAlign.left)),
        Picture(url: pixel.url),
        AuthorInsights(
            authorName: pixel.userId,
            likesCount: likesCount,
            commentsCount: comments != null ? comments.length : 0),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: CommentList(
            comments: comments,
            initialVisibleComments: 3,
            incrementVisibleCount: 2,
            enableComment: false,
          ),
        )
      ]),
    );
  }
}
