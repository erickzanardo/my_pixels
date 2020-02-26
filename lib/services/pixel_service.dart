import 'package:my_pixels/models/comment.dart';

import '../models/pixel.dart';

class PixelService {
  static Future<PixelModel> fetchPixel() {
    return Future.value(
      PixelModel(
        likes: 55,
        author: "Toyotomi Hideyoshi",
        createdAt: DateTime.parse("2020-02-01 09:00:00"),
        url: 'https://cptblackpixel.dev/assets/projects/relic_raider.png',
        comments: [
          Comment(
            pixelId: "ab42cd",
            posted: DateTime.parse("2020-02-01 12:15:00"),
            author: CommentAuthor(
              id: "thomashorta",
              name: "Thomas",
            ),
            text: "This pixel is awesome! And I would like to post a very long comment just to test this comment list system.",
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
            posted: DateTime.parse("2020-02-12 11:10:00"),
            author: CommentAuthor(
              id: "robison",
              name: "Robison",
            ),
            text:
                "What an amazing landscape, never seen something like this!!!",
          ),
          Comment(
            pixelId: "ab42cd",
            posted: DateTime.parse("2020-01-31 12:15:00"),
            author: CommentAuthor(
              id: "elias",
              name: "Elias",
            ),
            text: "Really great!",
          ),
          Comment(
            pixelId: "ab42cd",
            posted: DateTime.parse("2020-02-07 19:10:00"),
            author: CommentAuthor(
              id: "marcio",
              name: "Marcio",
            ),
            text: "I've seen this before...",
          ),
          Comment(
            pixelId: "ab42cd",
            posted: DateTime.parse("2020-02-15 09:10:00"),
            author: CommentAuthor(
              id: "erickz",
              name: "Erick",
            ),
            text:
                "Not bad!",
          ),
          Comment(
            pixelId: "ab42cd",
            posted: DateTime.parse("2020-01-28 15:15:00"),
            author: CommentAuthor(
              id: "tyemy",
              name: "Tyemy",
            ),
            text: "Niiiiceeee!",
          ),
          Comment(
            pixelId: "ab42cd",
            posted: DateTime.parse("2020-02-08 09:15:00"),
            author: CommentAuthor(
              id: "valonga",
              name: "Fabio",
            ),
            text: "Cool pixel art, bro!",
          ),
          Comment(
            pixelId: "ab42cd",
            posted: DateTime.parse("2020-02-04 09:10:00"),
            author: CommentAuthor(
              id: "danilo",
              name: "Danilo",
            ),
            text:
                "Very cool, with the moon and all!",
          ),
        ],
      ),
    );
  }
}
