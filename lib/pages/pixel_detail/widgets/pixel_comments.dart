import 'package:flutter/material.dart';
import 'package:my_pixels/models/comment.dart';
import 'package:my_pixels/pages/comment_page.dart';
import 'package:my_pixels/widgets/comment/comment_list.dart';

class PixelComments extends StatelessWidget {
  final List<Comment> comments;

  PixelComments({@required this.comments});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CommentList(
        comments: this.comments,
        initialVisibleComments: 3,
        onShowAllComments: () {
          Navigator.of(context)
              .pushNamed(CommentPage.routeName, arguments: comments);
        },
      ),
    );
  }
}
