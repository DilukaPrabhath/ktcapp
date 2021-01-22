import 'package:ktcapk/appoiment.dart';
import 'package:ktcapk/feedbacks.dart';
import 'package:ktcapk/firstscreen.dart';
import 'package:ktcapk/history.dart';
import 'package:ktcapk/listtest.dart';
import 'package:ktcapk/main.dart';
import 'package:ktcapk/profile.dart';
import 'package:ktcapk/rewards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Homepage extends StatelessWidget {
  Material Myitems(IconData icon, String heading, int color) {
    return Material(
      color: Colors.white,
      elevation: 14,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      heading,
                      style: TextStyle(
                          color: new Color(color),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Material(
                    color: new Color(color),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF0000),
        title: Text('Home'),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (content) =>
                [PopupMenuItem(value: 2, child: Text("Log out"))],
            onSelected: (int menu) {
              if (menu == 2) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstScreen()));
                // navigatorKey.currentState.push(
                //     MaterialPageRoute(builder: (context) => Loginview()));
              }
            },
          )
        ],
      ),
      drawer: MyDrawer(),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Appoiments()),
              );
            },
            child: Myitems(Icons.calendar_today, "Appoiments", 0xffb50c00),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Rewards()),
              );
            },
            child: Myitems(Icons.settings, "Rewards", 0xffb50c00),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Listtest()),
              );
            },
            child: Myitems(Icons.list, "History", 0xffb50c00),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Feedbacks()),
              );
            },
            child: Myitems(Icons.comment, "Feedback", 0xffb50c00),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            child: Myitems(Icons.person, "Profile", 0xffb50c00),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          // SizedBox(
          //   height: 20,
          // ),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 50),
          StaggeredTile.extent(2, 150),
          StaggeredTile.extent(1, 150),
          StaggeredTile.extent(1, 150),
          StaggeredTile.extent(1, 150),
          StaggeredTile.extent(1, 150),
          StaggeredTile.extent(1, 150),
        ],
      ),
    );
  }
}
