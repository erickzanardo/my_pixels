import 'package:flutter/material.dart';

import '../../models/comment.dart';
import '../../models/pixel.dart';
import '../../pages/pixel_detail/widgets/pixel_detail.dart';
import '../../services/pixel_service.dart';

class _ViewModel {
  PixelModel pixel;
  List<Comment> comments;
}

Future<_ViewModel> _fetchData(String pixelId) async {
  final model = _ViewModel();
  model.pixel = await PixelService.fetchPixel(pixelId);

  return model;
}

class PixelDetailPage extends StatelessWidget {
  @override
  Widget build(_) {
    return FutureBuilder<_ViewModel>(
      future: _fetchData("gWQ7dXpRUNxUBOV7FcyA"),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(":/");
          } else {
            return PixelDetail(
              pixel: snapshot.data.pixel,
              comments: snapshot.data.comments,
            );
          }
        } else {
          return Text("Loading");
        }
      },
    );
  }
}
