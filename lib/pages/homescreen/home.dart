import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram/models/card.dart';
import 'package:instagram/services/database.dart';
import 'package:instagram/ui/photo_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PhotoCardData> photos;

  @override
  Widget build(BuildContext context) {
    final photoProvider = Provider.of<PhotoCardModel>(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Instagram',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Billabong',
            fontSize: 35,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(FontAwesomeIcons.paperPlane),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: photoProvider.fetchProductsAsStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    photos = snapshot.data.documents
                        .map((doc) => PhotoCardData.fromFirestore(doc))
                        .toList();
                    return ListView.builder(
                      addAutomaticKeepAlives: true,
                      padding: EdgeInsets.only(bottom: 20.0, top: 5.0),
                      shrinkWrap: true,
                      itemCount: photos.length,
                      itemBuilder: (context, index) {
                        if (photos.length == 0) {
                          return Text('No photos');
                        } else {
                          PhotoCardData photo = photos[index];
                          return Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10.0, top: 10.0),
                            child: PhotoCard(
                              likes: photo.likes,
                              comment: photo.description,
                              photoUrl: photo.photoURL,
                              createdAt: photo.createdAt,
                            ),
                          );
                        }
                      },
                    );
                  } else {
                    return Text('No data found');
                  }
                }),
          ),
        ],
      ),
    );
  }
}
