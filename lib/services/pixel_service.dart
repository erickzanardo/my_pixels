import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/pixel.dart';

class PixelService {
  static Future<List<PixelModel>> listPixels(String userId) {
    return Firestore.instance
        .collection('pixels')
        .where('userId', isEqualTo: userId)
        .getDocuments()
        .then((snapshot) => snapshot.documents
            .map((document) =>
                PixelModel.fromMap(document.data, document.documentID))
            .toList());
  }

  static Future<PixelModel> fetchPixel(String pixelId) {
    return Firestore.instance
        .collection('pixels')
        .document(pixelId)
        .get()
        .then((DocumentSnapshot ds) => PixelModel.fromMap(ds.data, pixelId));
  }
}
