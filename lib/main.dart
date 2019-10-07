import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/pages/auth/root.dart';
import 'package:instagram/services/database.dart';
import 'package:instagram/services/locator.dart';
import 'package:instagram/services/user_repo.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(
          value: FirebaseAuth.instance.onAuthStateChanged,
        ),
        ChangeNotifierProvider<UserRepository>(
          builder: (_) => UserRepository.instance(),
        ),
        ChangeNotifierProvider(builder: (_) => locator<PhotoCardModel>()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Instagram',
          theme: ThemeData(
            primarySwatch: Colors.grey,
            brightness: Brightness.light,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => RootPage(),
          }),
    );
  }
}
