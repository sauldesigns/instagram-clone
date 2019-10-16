import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:instagram/services/database.dart';
import 'package:instagram/ui/appbar.dart';
import 'package:provider/provider.dart';

class PhotoEditPage extends StatefulWidget {
  PhotoEditPage({Key key, this.image}) : super(key: key);
  final File image;
  _PhotoEditPageState createState() => _PhotoEditPageState();
}

class _PhotoEditPageState extends State<PhotoEditPage> {
  String caption;
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> uploadPhoto(File image, String caption, FirebaseUser user,
      PhotoCardModel photoProvider) async {
    if (image != null) {
      var imagePath = image.path;

      String fileName = imagePath.split('/').last;

      StorageReference reference =
          _storage.ref().child('users/${user.uid}/images/$fileName');

      StorageUploadTask uploadTask = reference.putFile(image);

      String location =
          await (await uploadTask.onComplete).ref.getDownloadURL();

      var now = DateTime.now();
      var data = {
        'photoUrl': location,
        'userUid': user.uid,
        'createdAt': now,
        'likes': 0,
        'description': caption,
      };
      photoProvider.addProduct(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    final photoProvider = Provider.of<PhotoCardModel>(context);
    return Scaffold(
      appBar: appBarCustom(
        title: 'New Post',
        actions: [
          FlatButton(
            highlightColor: Colors.transparent,
            focusColor: Colors.blue,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            color: Colors.transparent,
            child: Text(
              'Share',
              style: TextStyle(
                fontSize: 17,
                color: Colors.lightBlue,
              ),
            ),
            onPressed: () async {
              showDialog(
                context: context,
                builder: (_) => SpinKitChasingDots(
                  color: Colors.white,
                  size: 50.0,
                ),
              );

              await uploadPhoto(widget.image, caption, user, photoProvider);
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, top: 35.0, right: 20.0, bottom: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image(
                  image: FileImage(widget.image),
                  fit: BoxFit.cover,
                  height: 80,
                  width: 80,
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: TextField(
                    maxLines: 10,
                    minLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Write a caption...',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      caption = value;
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
