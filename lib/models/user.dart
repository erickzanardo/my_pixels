import './follow.dart';

class UserModel {
  final String name;
  final String locale;
  final String photoURL;
  final List<FollowModel> followers;
  final List<FollowModel> following;

  UserModel(
      {this.name, this.locale, this.photoURL, this.followers, this.following});
}
