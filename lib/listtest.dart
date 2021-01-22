import 'dart:convert';

import 'package:ktcapk/edit.dart';
import 'package:ktcapk/firstscreen.dart';
import 'package:ktcapk/loginview.dart';
import 'package:ktcapk/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:async';

class Listtest extends StatefulWidget {
  // final String title;
  @override
  _ListtestState createState() => _ListtestState();
}

class _ListtestState extends State<Listtest> {
  List users = [];
  bool isLoading = false;
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = "https://ktcapp.aitlab.xyz/api/history2";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['data'];
      setState(() {
        users = items;
        isLoading = false;
      });
    } else {
      setState(() {
        users = [];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: getBody(),
    );
  }

  Widget getBody() {
    if (isLoading || users.length == 0) {
      return Center(
          child: CircularProgressIndicator(
              valueColor:
                  new AlwaysStoppedAnimation<Color>(Color(0xffffffff))));
    }
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return cardItem(users[index]);
        });
  }

  Widget cardItem(item) {
    var fullname = item['invoice_number'];
    var email = item['invoice_date'];
    var invoice_total = item['invoice_total'];

    //return
    return Card(
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          color: Colors.white,
          child: ListTile(
            title: Text("Invoice No : " + fullname),
            subtitle: Text(email),
          ),
        ),
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'View',
            color: Colors.blueAccent,
            icon: Icons.arrow_forward,
            onTap: () => editUser(item),
          ),
          // IconSlideAction(
          //   caption: 'Delete',
          //   color: Colors.red,
          //   icon: Icons.delete,
          //   onTap: () => showDeleteAlert(context, item),
          // ),
        ],
      ),
    );
  }

  editUser(item) {
    var userId = item['id'].toString();
    var fullname = item['invoice_number'].toString();
    var email = item['invoice_date'].toString();
    var invoice_total = item['invoice_total'].toString();
    var sales_tax = item['sales_tax'].toString();
    var service_tax = item['service_tax'].toString();
    var invoice_payment = item['invoice_payment'].toString();
    var invoice_discount = item['invoice_discount'].toString();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditUser(
                  userId: userId,
                  fullName: fullname,
                  email: email,
                  invoice_total: invoice_total,
                  sales_tax: sales_tax,
                  service_tax: service_tax,
                  invoice_payment: invoice_payment,
                  invoice_discount: invoice_discount,
                )));
  }

  deleteUser(userId) async {
    var url = "api/users/1";
    var response = await http.post(url, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    });
    if (response.statusCode == 200) {
      this.fetchUser();
    }
  }

  showDeleteAlert(BuildContext context, item) {
    // set up the buttons
    Widget noButton = FlatButton(
      child: Text(
        "No",
        style: TextStyle(color: Color(0xffb744b8)),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    Widget yesButton = FlatButton(
      child: Text("Yes", style: TextStyle(color: Color(0xffb744b8))),
      onPressed: () {
        Navigator.pop(context);

        deleteUser(item['id']);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Message"),
      content: Text("Would you like to delete this user?"),
      actions: [
        noButton,
        yesButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
