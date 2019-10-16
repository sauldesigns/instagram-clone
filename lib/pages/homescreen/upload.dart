import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/pages/photo_editor/photo_editor.dart';
import 'package:instagram/ui/appbar.dart';

class PhotoUploadPage extends StatefulWidget {
  PhotoUploadPage({Key key}) : super(key: key);

  _PhotoUploadPageState createState() => _PhotoUploadPageState();
}

class _PhotoUploadPageState extends State<PhotoUploadPage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: appBarCustom(title: 'Upload'),
      body: Center(
        child: RaisedButton(
          color: Colors.white,
          child: Text('Upload'),
          onPressed: () async {
            _image = await getImage();
            if (_image != null) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PhotoEditPage(image: _image)));
            }
          },
        ),
      ),
    );
  }
}
