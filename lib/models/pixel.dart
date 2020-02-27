import 'package:my_pixels/models/comment.dart';

class PixelModel {
  final String url;
  final List<Comment> comments;
  final DateTime createdAt;
  final int likes;
  final String author; // TODO: should it be other entity?

  PixelModel(
      {this.url, this.comments, this.createdAt, this.likes, this.author});
}
