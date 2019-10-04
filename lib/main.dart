import 'package:flutter/material.dart';
import 'package:instagram/pages/homescreen/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          brightness: Brightness.light,
        ),
        home: HomePage(),
      ),
    );
  }
}
