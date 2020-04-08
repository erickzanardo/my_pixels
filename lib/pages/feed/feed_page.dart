import 'package:flutter/material.dart';
import '../../pages/feed/widgets/pixel_list.dart';

import '../../models/comment.dart';
import '../../models/pixel.dart';
import '../../services/pixel_service.dart';

class PixelItem {
  PixelModel pixel;
  List<Comment> comments;
  int likesCount;
}

Future<List<PixelItem>> _fetchData(String id) async {
  final pixels = await PixelService.listPixels(id);

  return pixels.map((pixel) {
    final item = PixelItem();
    item.pixel = pixel;
    item.comments = [];
    item.likesCount = 3;

    return item;
  }).toList();
}

class FeedPage extends StatelessWidget {
  @override
  Widget build(_) {
    return FutureBuilder<List<PixelItem>>(
      future: _fetchData("KftPRybKEeNUwFv4rOdN"),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text(":/");
          } else {
            return PixelList(
              items: snapshot.data,
            );
          }
        } else {
          return Text("Loading");
        }
      },
    );
  }
}
