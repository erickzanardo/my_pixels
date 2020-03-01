import 'package:my_pixels/models/comment.dart';
import './user.dart';

class PixelModel {
  final String url;
  final List<Comment> comments;
  final DateTime createdAt;
  final int likes;
  final UserModel author;
  final List<UserModel> userLiked;

  PixelModel(
      {this.url,
      this.comments,
      this.createdAt,
      this.likes,
      this.author,
      this.userLiked});
}
