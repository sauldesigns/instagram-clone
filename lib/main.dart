import 'package:flutter/material.dart';
import 'package:instagram/pages/auth/root.dart';
// import 'package:instagram/pages/homescreen/home.dart';
import 'package:instagram/services/user_repo.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserRepository>(
          builder: (_) => UserRepository.instance(),
        ),
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
        }
      ),
    );
  }
}
