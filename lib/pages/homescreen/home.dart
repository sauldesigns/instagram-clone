import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram/ui/photo_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 1,
        centerTitle: true,
        title: Text(
          'Instagram',
          style: TextStyle(color: Colors.black),
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
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 20.0, ),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: PhotoCard(
                        comment: 'this is where all this stuff would go, this is where i should be writting stuffthis is where all this stuff would go, this is where i should be writting stuffthis is where all this stuff would go, this is where i should be writting stuff',
                        photoUrl:
                            'https://drscdn.500px.org/photo/76092365/m%3D900/v2?sig=a4a238b75ea4a93d3066dde4ee26b6b4b77e21fb404b010a5e689347f56bed28',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Container(),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
