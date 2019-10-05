import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram/enums/auth.dart';
import 'package:instagram/pages/auth/login.dart';
import 'package:instagram/pages/homescreen/tabview.dart';
import 'package:instagram/services/user_repo.dart';
import 'package:instagram/ui/splashscreen.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key}) : super(key: key);

  _RootPageState createState() => _RootPageState();
}

// this helps define the state the app should be in depending if
// user was previously logged in, if no user is logged in, or if
// user is being authenthicated.
class _RootPageState extends State<RootPage> {
  Firestore db = Firestore.instance;
  // final _db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    // var _user = Provider.of<FirebaseUser>(context);
    var user = Provider.of<UserRepository>(context);
    if (user.status == Status.Authenticated) {
      return TabBarViewPage();
    } else if (user.status == Status.Uninitialized) {
      return SplashScreen(
        title: 'Instagram',
      );
    } else {
      return LoginPage();
    }
  }
}
