import 'package:ktcapk/firstscreen.dart';
import 'package:ktcapk/main.dart';
import 'package:flutter/material.dart';

class Feedback extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFF0000),
          title: Text('Feedback'),
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
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      onPressed: () => {},
                      color: Colors.red[800],
                      child: Text(
                        "Request a Appoiment.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  // TextFormField(
                  //   decoration: InputDecoration(hintText: 'Name :'),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
