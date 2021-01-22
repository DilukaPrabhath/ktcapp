import 'package:ktcapk/loginview.dart';
import 'package:flutter/material.dart';

class Productspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      appBar: AppBar(
        backgroundColor: Color(0xFFFF0000),
        title: Text('APT Saloon'),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (content) =>
                [PopupMenuItem(value: 1, child: Text("Login"))],
            onSelected: (int menu) {
              if (menu == 1) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Loginview()));
                // navigatorKey.currentState.push(
                //     MaterialPageRoute(builder: (context) => Loginview()));
              }
            },
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/img62.jpg'),
                    Text(
                      "Sponch",
                      style:
                          TextStyle(fontSize: 56, fontWeight: FontWeight.w900),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "BEAUTYBLENDER",
                      style:
                          TextStyle(fontSize: 31, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      color: Colors.black38,
                    ),
                    SizedBox(
                      width: 303.0,
                      height: 180.0,
                      child: SingleChildScrollView(
                        child: Text(
                            "Used worldwide by professional makeup artists, the beautyblender Sponge is an absolute essential for applying and blending base makeup. This teardrop shaped sponge absorbs water rather than product, so your foundation, concealer, BB cream etc. will last even longer. Using a bouncing technique, the top of the sponge hugs the contours of the face and covers blemishes whilst the bottom flawlessly blends makeup over larger areas. Perfecting for achieving that natural, streak-free finish, beautyblender has been dubbed a modern-day phenomenon, and we totally agree.Used worldwide by professional makeup artists, the beautyblender Sponge is an absolute essential for applying and blending base makeup. This teardrop shaped sponge absorbs water rather than product, so your foundation, concealer, BB cream etc. will last even longer. Using a bouncing technique, the top of the sponge hugs the contours of the face and covers blemishes whilst the bottom flawlessly blends makeup over larger areas. Perfecting for achieving that natural, streak-free finish, beautyblender has been dubbed a modern-day phenomenon, and we totally agree."),
                      ),
                    )
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
