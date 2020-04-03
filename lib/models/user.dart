class UserModel {
  final String name;
  final String locale;
  final String photoURL;
  final List<String> followers;
  final List<String> following;

  UserModel(
      {this.name, this.locale, this.photoURL, this.followers, this.following});
}
