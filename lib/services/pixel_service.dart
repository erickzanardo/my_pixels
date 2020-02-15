import 'package:my_pixels/models/comment.dart';

import '../models/pixel.dart';

class PixelService {
  static Future<PixelModel> fetchPixel() {
    return Future.value(
      PixelModel(
        url: 'https://cptblackpixel.dev/assets/projects/relic_raider.png',
        comments: [
          Comment(
            pixelId: "ab42cd",
            posted: DateTime.parse("2020-02-01 12:15:00"),
            author: CommentAuthor(
              id: "thomashorta",
              name: "Thomas",
            ),
            text: "This pixel is awesome!",
          ),
          Comment(
            pixelId: "ab42cd",
            posted: DateTime.parse("2020-02-07 09:10:00"),
            author: CommentAuthor(
              id: "xmenho",
              name: "Rafael",
            ),
            text: "That's cool...",
          ),
          Comment(
            pixelId: "ab42cd",
            posted: DateTime.parse("2020-02-14 09:10:00"),
            author: CommentAuthor(
              id: "erickz",
              name: "Erick",
            ),
            text:
                "What an amazing landscape, never seen something like this!!!",
          ),
        ],
      ),
    );
  }
}
