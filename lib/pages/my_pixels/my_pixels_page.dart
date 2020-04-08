import 'package:flutter/material.dart';
import 'package:my_pixels/models/user.dart';
import 'package:my_pixels/pages/my_pixels/widgets/my_pixels.dart';
import 'package:my_pixels/services/user_service.dart';

class _ViewModel {
  UserModel userModel;
  int postsCount;
  int followingCount;
  int followersCount;
  List<String> pixels;
}

Future<_ViewModel> _fetchData(String id) async {
  final model = _ViewModel();
  model.userModel = await UserService.fetchUser(id);

  model.followingCount = 2;
  model.followersCount = 3;
  model.pixels = [
    "https://previews.123rf.com/images/saphatthachat/saphatthachat1903/saphatthachat190300175/124220583-vector-pixel-art-donut-bite-isolated-cartoon.jpg"
  ];

  return model;
}

class MyPixelsPage extends StatelessWidget {
  @override
  Widget build(_) {
    return FutureBuilder<_ViewModel>(
      future: _fetchData("KftPRybKEeNUwFv4rOdN"),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(":/");
          } else {
            return MyPixels(
              userModel: snapshot.data.userModel,
              followingCount: snapshot.data.followingCount,
              followersCount: snapshot.data.followersCount,
              pixels: snapshot.data.pixels,
            );
          }
        } else {
          return Text("Loading");
        }
      },
    );
  }
}
