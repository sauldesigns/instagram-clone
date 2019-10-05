import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram/pages/homescreen/home.dart';
import 'package:instagram/pages/homescreen/profile.dart';

class TabBarViewPage extends StatefulWidget {
 TabBarViewPage({Key key}) : super(key: key);

   TabBarViewPageState createState() =>  TabBarViewPageState();
}

class TabBarViewPageState extends State<TabBarViewPage>
    with SingleTickerProviderStateMixin {
  // PageController pageController = Controller(
  //   initialPage: 0,
  //   keepPage: true,
  // );

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: TabBar(
          controller: _tabController,
          indicatorColor: Colors.transparent,
          labelPadding: EdgeInsets.only(top: 5, bottom: 25),
          
          tabs: <Widget>[
            Tab(
              icon: Icon(FontAwesomeIcons.home),
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.search),
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.plusSquare),
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.heart),
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.user),
            ),
          ],
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          HomePage(),
          Container(),
          Container(),
          Container(),
          ProfilePage(),
        ],
      ),
    );
  }
}
