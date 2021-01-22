import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ktcapk/appoiment.dart';
import 'package:ktcapk/feedbacks.dart';
import 'package:ktcapk/history.dart';
import 'package:ktcapk/homepage.dart';
import 'package:ktcapk/listtest.dart';
import 'package:ktcapk/profile.dart';
import 'package:ktcapk/rewards.dart';
import 'package:ktcapk/firstscreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ktcapk/testprofile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APT Saloon',
      theme: ThemeData(
        primarySwatch: Colors.red,
        backgroundColor: Color(0xFFFF0000),
      ),
      home: MyHomePage(title: 'APT Hair Saloon'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MyDrawer extends StatelessWidget {
  final Function onTap;

  MyDrawer({this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 60.0,
                      height: 60.0,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/img5.jpg'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Nethmi Roshel Rogers",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "nethmiroshel@info.com",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "Home",
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(
                "Appoiment",
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Appoiments()));
              },
            ),
            ListTile(
              leading: Icon(Icons.card_giftcard),
              title: Text(
                "Rewards",
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Rewards()));
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text(
                "History",
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Listtest()));
              },
            ),
            ListTile(
              leading: Icon(Icons.comment),
              title: Text(
                "Feedback",
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Feedbacks()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                "Profile",
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.exit_to_app),
            //   title: Text(
            //     "Test Form",
            //   ),
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => TestProfile()));
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                "Log Out",
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  List<Widget> list = [
    Profile(),
    Homepage(),
  ];

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => FirstScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/apt.png',
            height: 100.0,
          ),
          SizedBox(height: 30.0),
          SpinKitRipple(color: Colors.red),
        ],
      ),
    );
  }
}
