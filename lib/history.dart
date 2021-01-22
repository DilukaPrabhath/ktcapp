import 'dart:convert';

import 'package:ktcapk/firstscreen.dart';
import 'package:ktcapk/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() => runApp(MaterialApp(
      home: History(),
    ));

class History extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HistoryState();
  }
}

List dataSet = [];
var responceDecod;

class _HistoryState extends State<History> {
  fetchHistory() async {
    await http
        .get("http://ktcapp.aitlab.xyz/api/history")
        .then((response) async {
      setState(() {
        responceDecod = jsonDecode(response.body);
      });
      print("----------------------- response---------------");
      print(response.body);
      print("----------------------- res---------------");
      print(responceDecod.length);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchHistory();
  }

  @override
  Widget build(BuildContext context) {
    print("------------------------ssssssssssssssssss--------------------");
    print(responceDecod);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF0000),
        title: Text('History'),
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
      body: Center(
          child: Container(
        child: (responceDecod == null)
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: responceDecod.length,
                itemBuilder: (context, index) {
                  print("---------------------------------------snapshot");
                  print(responceDecod["$index"]);
                  print(responceDecod["1"]);
                  print(responceDecod["2"]);
                  return ListTile(
                    title:
                        Text(responceDecod["${index + 1}"]['invoice_number']),
                    subtitle:
                        Text(responceDecod["${index + 1}"]['invoice_date']),
                  );
                },
              ),
      )),
    );
  }
}
