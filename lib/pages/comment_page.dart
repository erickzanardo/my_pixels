import 'package:flutter/widgets.dart';
import 'package:my_pixels/models/pixel.dart';
import 'package:my_pixels/widgets/comment/comment_list.dart';
import 'package:my_pixels/widgets/scaffold.dart';

class CommentPage extends StatelessWidget {
  static const routeName = "/comments";

  @override
  Widget build(BuildContext context) {
    final CommentPageArgs args = ModalRoute.of(context).settings.arguments;
    final comments = args?.pixel?.comments;

    // TODO show pixel details (user, title, etc) when we have that structure
    // in Instagram the post details show up exactly like a comment, but with
    // a separator below it to identify them as the original post comment / text

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CommentList(
            comments: comments,
            expandable: true,
            showDetails: true,
            initialVisibleComments: 5,
            incrementVisibleCount: 5,
          ),
        ),
      ),
    );
  }
}

class CommentPageArgs {
  final PixelModel pixel;

  CommentPageArgs(this.pixel);
}