class Comment {
  final String pixelId;
  final String slug;
  final DateTime posted;
  final CommentAuthor author;
  final String text;

  Comment({this.pixelId, this.slug, this.posted, this.author, this.text});
}

class CommentAuthor {
  final String id;
  final String name;
  final String picture;

  CommentAuthor({this.id, this.name, this.picture});
}
