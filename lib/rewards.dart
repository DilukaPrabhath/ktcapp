import 'package:ktcapk/firstscreen.dart';
import 'package:flutter/material.dart';
import 'package:ktcapk/main.dart';

class Rewards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      appBar: AppBar(
        backgroundColor: Color(0xFFFF0000),
        title: Text('Rewards'),
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
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/img11.jpg',
                      height: 200,
                    ),
                    Text(
                      "My Rewards",
                      style:
                          TextStyle(fontSize: 56, fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Points",
                      style:
                          TextStyle(fontSize: 31, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      color: Colors.black38,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "45.1",
                      style:
                          TextStyle(fontSize: 31, fontWeight: FontWeight.w800),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Colors.black38,
                    ),
                    // SizedBox(
                    //   width: 303.0,
                    //   height: 180.0,
                    //   child: SingleChildScrollView(
                    //     child: Text(
                    //         "Used worldwide by professional makeup artists, the beautyblender Sponge is an absolute essential for applying and blending base makeup. This teardrop shaped sponge absorbs water rather than product, so your foundation, concealer, BB cream etc. will last even longer. Using a bouncing technique, the top of the sponge hugs the contours of the face and covers blemishes whilst the bottom flawlessly blends makeup over larger areas. Perfecting for achieving that natural, streak-free finish, beautyblender has been dubbed a modern-day phenomenon, and we totally agree.Used worldwide by professional makeup artists, the beautyblender Sponge is an absolute essential for applying and blending base makeup. This teardrop shaped sponge absorbs water rather than product, so your foundation, concealer, BB cream etc. will last even longer. Using a bouncing technique, the top of the sponge hugs the contours of the face and covers blemishes whilst the bottom flawlessly blends makeup over larger areas. Perfecting for achieving that natural, streak-free finish, beautyblender has been dubbed a modern-day phenomenon, and we totally agree."),
                    //   ),
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
