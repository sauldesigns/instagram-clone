import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class PhotoCard extends StatefulWidget {
  PhotoCard({Key key, this.photoUrl, this.createdAt, this.comment, this.likes})
      : super(key: key);
  final String photoUrl;
  final String comment;
  final int likes;
  final Timestamp createdAt;
  _PhotoCardState createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> {
  final fifteenAgo = new DateTime.now().subtract(new Duration(minutes: 15));
  final likes = NumberFormat.compact();
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
                  'https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
                ),
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
              FlatButton(
                splashColor: Colors.transparent,
                child: Text(
                  '...',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {},
              )
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
            child: TransitionToImage(
              image: AdvancedNetworkImage(
                widget.photoUrl,
              ),
              loadingWidgetBuilder: (
                BuildContext context,
                double progress,
                imageData,
              ) =>
                  Container(
                width: double.infinity,
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(
                    value: progress,
                  ),
                ),
              ),
              fit: BoxFit.fitWidth,
              placeholder: Container(
                width: double.infinity,
                height: 300,
                child: Center(
                  child: const Icon(
                    Icons.refresh,
                    size: 40,
                  ),
                ),
              ),
              enableRefresh: true,
            ),

            // child: Image(
            //   fit: BoxFit.fitWidth,
            //   image: AdvancedNetworkImage(widget.photoUrl, ),
            // ),
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
              likes.format(widget.likes) + ' likes',
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
                  child: RichText(
                    text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Saul Designs',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '\t\t${widget.comment}',
                          ),
                        ]),
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
              timeago.format(widget.createdAt.toDate()),
            ),
          ),
          SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }
}
