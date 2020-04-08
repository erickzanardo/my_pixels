class PixelModel {
  final String id;
  final String url;
  final DateTime createdAt;
  final String userId;

  PixelModel({
    this.id,
    this.url,
    this.createdAt,
    this.userId,
  });

  PixelModel.fromMap(Map snapshot, String id)
      : id = id,
        url = snapshot['url'] ?? '',
        createdAt = snapshot['createdAt'].toDate() ?? '',
        userId = snapshot['userId'] ?? '';

  toJson() {
    return {
      "id": id,
      "url": url,
      "createdAt": createdAt,
      "userId": userId,
    };
  }
}
