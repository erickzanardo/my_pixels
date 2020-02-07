import '../models/pixel.dart';

class PixelService {
  static Future<PixelModel> fetchPixel() {
    return Future.value(
        PixelModel(
            url: 'https://cptblackpixel.dev/assets/projects/relic_raider.png',
        )
    );
  }
}
