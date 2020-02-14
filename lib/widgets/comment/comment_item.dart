import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:my_pixels/common/colors.dart';
import 'package:my_pixels/models/comment.dart';

class CommentItem extends StatelessWidget {
  static const avatarSize = 32.0;
  static const avatarTextSize = 16.0;
  static const detailsPadding = 8.0;
  static const contentTextSize = 14.0;

  final Comment comment;
  final bool showDetails;

  final _authorTapRecognizer = TapGestureRecognizer();

  CommentItem(
    this.comment, {
    Key key,
    this.showDetails = false,
  }) : super(key: key) {
    _authorTapRecognizer.onTap = _onAuthorTap;
  }

  @override
  Widget build(BuildContext context) {
    return showDetails ? _contentWithDetails() : _content();
  }

  Widget _contentWithDetails() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _authorAvatar(),
        SizedBox(width: detailsPadding),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _content(),
              _bottomDetails(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _content() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: contentTextSize,
          color: Colors.commentTextColor,
        ),
        children: <TextSpan>[
          TextSpan(
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            text: "${comment.author.name}: ",
            recognizer: _authorTapRecognizer,
          ),
          TextSpan(
            text: comment.text,
          ),
        ],
      ),
    );
  }

  Widget _bottomDetails() {
    return Padding(
      padding: const EdgeInsets.only(
        top: detailsPadding,
        bottom: detailsPadding,
      ),
      child: Text(
        _getTimePassed(comment.posted),
        style: TextStyle(
          color: Colors.commentInfoTextColor,
        ),
      ),
    );
  }

  Widget _authorAvatar() {
    return comment.author.picture?.isNotEmpty == true
        ? Image.network(
            comment.author.picture,
            width: avatarSize,
            height: avatarSize,
            fit: BoxFit.fill,
          )
        : Container(
            width: avatarSize,
            height: avatarSize,
            color: Colors.placeHolderColor,
            child: Center(
              child: Text(
                comment.author.name[0].toUpperCase(),
                style: TextStyle(
                  color: Colors.placeHolderTextColor,
                  fontSize: avatarTextSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
  }

  String _getTimePassed(DateTime time) {
    final now = DateTime.now();
    final Duration diff = now.difference(time);

    String timePassed;
    if (diff.inDays >= 1) {
      timePassed = "${diff.inDays} days";
    } else if (diff.inHours >= 1) {
      timePassed = "${diff.inHours} hours";
    } else {
      timePassed = "${diff.inMinutes} minutes";
    }

    return timePassed;
  }

  void _onAuthorTap() {
    // TODO go to author profile page
    print("Clicked on author: ${comment.author.name} (${comment.author.id})");
  }
}
