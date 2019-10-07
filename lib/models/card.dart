import 'package:cloud_firestore/cloud_firestore.dart';

class PhotoCardData {
  final String uid;
  final String photoURL;
  final int likes;
  final String description;
  final Timestamp createdAt;

  PhotoCardData(
      {this.uid, this.photoURL, this.likes, this.description, this.createdAt});

  factory PhotoCardData.fromFirestore(
    DocumentSnapshot photoDoc,
  ) {
    Map photoData = photoDoc.data;

    if (photoData == null) {
      return PhotoCardData.initialData();
    } else {
      return PhotoCardData(
        uid: photoDoc.documentID,
        description: photoData['description'],
        photoURL: photoData['photoUrl'] ?? 'https://bit.ly/336eLGv',
        likes: photoData['likes'],
        createdAt: photoData['createdAt'],
      );
    }
  }

  factory PhotoCardData.initialData() {
    return PhotoCardData(
      uid: null,
      description: 'Loading...',
      photoURL: 'https://bit.ly/336eLGv',
      likes: 0,
      createdAt: null,
    );
  }

  toJson() {
    return {
      'uid': uid,
      'description': description,
      'photoURL': photoURL,
      'likes': likes,
      'createdAt': createdAt,
    };
  }
}
