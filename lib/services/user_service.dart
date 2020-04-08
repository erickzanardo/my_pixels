import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_pixels/models/user.dart';

class UserService {
  static Future<UserModel> fetchUser(String userId) {
    return Firestore.instance
        .collection('users')
        .document(userId)
        .get()
        .then((DocumentSnapshot ds) => UserModel.fromMap(ds.data, userId));
  }
}
