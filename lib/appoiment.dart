import 'package:ktcapk/firstscreen.dart';
import 'package:ktcapk/main.dart';
import 'package:flutter/material.dart';

class Appoiments extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  DateTime _dateTime;
  List listitem = [
    "Branch 01",
    "Branch 02",
    "Branch 03",
    "Branch 04",
  ];
  String valueChoose;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFF0000),
          title: Text('Apoiments'),
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Text(_dateTime == null
                            ? 'Date not Picked Yet'
                            : _dateTime.toString()),
                        RaisedButton(
                            child: Text('Pick a Date'),
                            onPressed: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2222))
                                  .then((date) {});
                            }),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.all(18),
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButton(
                      hint: Text('Select Branch'),
                      value: valueChoose,
                      onChanged: (newValue) {},
                      items: listitem.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
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
