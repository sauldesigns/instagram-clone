import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram/models/card.dart';
import 'package:instagram/services/api.dart';
import 'package:instagram/services/locator.dart';

class PhotoCardModel extends ChangeNotifier {
  PhotoApi _photoApi = locator<PhotoApi>();

  List<PhotoCardData> photoCards;

  Future<List<PhotoCardData>> fetchProducts() async {
    var photoResult = await _photoApi.getDataCollection();

    photoCards = photoResult.documents
        .map((doc) => PhotoCardData.fromFirestore(doc))
        .toList();
    return photoCards;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _photoApi.streamDataCollection();
  }

  Future<PhotoCardData> getProductById(String id) async {
    var doc = await _photoApi.getDocumentById(id);
    return PhotoCardData.fromFirestore(doc);
  }

  Future removeProduct(String id) async {
    await _photoApi.removeDocument(id);
    return;
  }

  Future updateProduct(PhotoCardData data, String id) async {
    await _photoApi.updateDocument(data.toJson(), id);
    return;
  }

  Future addProduct(data) async {
    await _photoApi.addDocument(data);

    return;
  }
}
