import 'dart:math';

import 'package:flutter/material.dart' as M;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:my_pixels/common/colors.dart';
import 'package:my_pixels/models/comment.dart';
import 'package:my_pixels/widgets/comment/comment_item.dart';

import '../text_field.dart';

class CommentList extends StatefulWidget {
  final List<Comment> comments;
  final bool expandable;
  final bool showDetails;
  final bool enableComment;
  final int initialVisibleComments;
  final int incrementVisibleCount;
  final void Function(String text) onNewComment;
  final void Function() onShowAllComments;

  bool get hasComments => comments?.isNotEmpty == true;

  CommentList({
    @required this.comments,
    this.expandable = false,
    this.showDetails = false,
    this.enableComment = true,
    int initialVisibleComments = 3,
    this.incrementVisibleCount = 3,
    this.onNewComment,
    this.onShowAllComments,
  }) : initialVisibleComments = min(initialVisibleComments, comments.length) {
    comments?.sort((a, b) => a.posted.compareTo(b.posted));
  }

  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  static const widgetSpacing = 8.0;
  static const moreButtonTextSize = 13.0;
  static const maxCommentLength = 400;
  static const commentItemPadding = 2.0;

  int _visibleComments;
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _visibleComments = widget.initialVisibleComments;
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];

    if (widget.hasComments) {
      widgets.add(_commentList());

      if (_visibleComments < widget.comments.length) {
        widgets.add(SizedBox(height: widgetSpacing));
        widgets.add(_moreButton());
      }
    }

    if (widgets.length > 0) {
      widgets.add(SizedBox(height: widgetSpacing));
    }

    if (widget.enableComment) {
      widgets.add(_newCommentField());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: widget.expandable ? MainAxisSize.max : MainAxisSize.min,
      children: widgets,
    );
  }

  Widget _commentList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _visibleComments,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(
            top: index == 0 ? 0.0 : commentItemPadding,
            bottom: index == _visibleComments - 1 ? 0.0 : commentItemPadding,
          ),
          child: CommentItem(
            widget.comments[index],
            showDetails: widget.showDetails,
          ),
        );
      },
    );
  }

  Widget _moreButton() {
    return GestureDetector(
      onTap: () {
        widget.expandable ? _showMoreComments() : _showAllComments();
      },
      child: Text(
        widget.expandable ? "Show more" : "View all comments",
        style: TextStyle(
          fontSize: moreButtonTextSize,
          color: Colors.commentInfoTextColor,
        ),
      ),
    );
  }

  void _showMoreComments() {
    final newVisibleComments = min(
        _visibleComments + widget.incrementVisibleCount,
        widget.comments.length);

    setState(() {
      _visibleComments = newVisibleComments;
    });
  }

  void _showAllComments() {
    print("Show all comments for pixel ${widget.comments[0].pixelId}");
    widget.onShowAllComments?.call();
  }

  Widget _newCommentField() {
    return Container(
      color: Colors.commentFieldColor,
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        hintText: "Comment",
        hintStyle: TextStyle(
          color: Colors.commentFieldHintColor,
        ),
        maxLength: maxCommentLength,
        androidInputBorder: M.InputBorder.none,
        textInputAction: TextInputAction.send,
        onSubmitted: _sendNewComment,
      ),
    );
  }

  void _sendNewComment(String text) {
    // TODO add new comment to comments list (either here or the callback)
    print("New comment: $text");
    widget.onNewComment?.call(text);
    _controller.clear();
  }
}
