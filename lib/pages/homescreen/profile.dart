import 'package:flutter/material.dart';
import 'package:instagram/services/user_repo.dart';
import 'package:instagram/ui/appbar.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var userRepo = Provider.of<UserRepository>(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: appBarCustom(
        actions: <Widget>[],
        title: 'Profile',
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: ListTile(
                  title: Text('Sign Out'),
                  onTap: () {
                    userRepo.signOut();
                  },
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
