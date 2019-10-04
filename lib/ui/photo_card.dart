import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PhotoCard extends StatefulWidget {
  PhotoCard({Key key, this.photoUrl, this.comment}) : super(key: key);
  final String photoUrl;
  final String comment;
  _PhotoCardState createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80'),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Saul Designs',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Image(
          fit: BoxFit.fitWidth,
          image: NetworkImage(widget.photoUrl),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.heart),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.comment),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.paperPlane),
              onPressed: () {},
            ),
            Expanded(
              child: Container(),
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.bookmark),
              onPressed: () {},
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            '23,432 likes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 10.0, bottom: 10.0, right: 5.0),
                child: Text(
                  "SaulDesigns  " + widget.comment,
                  softWrap: true,
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('View Comments'),
        )
      ],
    );
  }
}
