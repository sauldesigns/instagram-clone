import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

class PhotoCard extends StatefulWidget {
  PhotoCard({Key key, this.photoUrl, this.comment}) : super(key: key);
  final String photoUrl;
  final String comment;
  _PhotoCardState createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> {
  final fifteenAgo = new DateTime.now().subtract(new Duration(minutes: 15));
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                spreadRadius: 0,
                offset: Offset(0, 2),
                color: Colors.grey[400])
          ]),
      child: Column(
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
          InkWell(
            onDoubleTap: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Double Tap'),
              ));
            },
            onTap: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Tap'),
              ));
            },
            child: Image(
              fit: BoxFit.fitWidth,
              image: NetworkImage(widget.photoUrl),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(FontAwesomeIcons.heart),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Heart'),
              ));
                },
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.comment),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Comment'),
              ));
                },
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.paperPlane),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Share'),
              ));
                },
              ),
              Expanded(
                child: Container(),
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.bookmark),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Bookmark'),
              ));
                },
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
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              timeago.format(
                fifteenAgo,
              ),
            ),
          ),
          SizedBox(height: 10.0,)
        ],
      ),
    );
  }
}
