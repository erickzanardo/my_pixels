class UserModel {
  final String id;
  final String name;
  final String bio;
  final String locale;
  final String photoURL;

  UserModel({
    this.id,
    this.name,
    this.bio,
    this.locale,
    this.photoURL,
  });

  UserModel.fromMap(Map snapshot, String id)
      : id = id,
        name = snapshot['name'] ?? '',
        bio = snapshot['bio'] ?? '',
        locale = snapshot['locale'] ?? '',
        photoURL = snapshot['photoURL'] ?? '';

  toJson() {
    return {
      "id": id,
      "name": name,
      "bio": bio,
      "locale": locale,
      "photoURL": photoURL,
    };
  }
}
