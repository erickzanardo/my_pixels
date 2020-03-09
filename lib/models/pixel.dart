import 'package:my_pixels/models/comment.dart';

class PixelModel {
  final String url;
  final List<Comment> comments;
  final DateTime createdAt;
  final int likes;
  final String authorId;
  final List<String> userLiked;

  PixelModel(
      {this.url,
      this.comments,
      this.createdAt,
      this.likes,
      this.authorId,
      this.userLiked});
}
