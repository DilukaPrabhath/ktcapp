import 'package:ktcapk/firstscreen.dart';
import 'package:ktcapk/main.dart';
import 'package:flutter/material.dart';
import 'package:ktcapk/util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Profile extends StatefulWidget {
  String userId;
  String full_name;
  String email;
  String mobile;
  //String dob;
  String social_link;
  Profile(
      {this.userId,
      this.full_name,
      this.email,
      this.mobile,
      //this.dob,
      this.social_link});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _controllerFullName = new TextEditingController();
  final TextEditingController _controllerEmail = new TextEditingController();
  final TextEditingController _controllerMobile = new TextEditingController();
  final TextEditingController _controllerSocialurl =
      new TextEditingController();
  //final TextEditingController _controllerdob = new TextEditingController();
  String userId = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      userId = widget.userId;
      _controllerFullName.text = widget.full_name;
      _controllerEmail.text = widget.email;
      _controllerMobile.text = widget.mobile;
      _controllerSocialurl.text = widget.social_link;
      // _controllerdob.text = widget.dob;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFF0000),
          title: Text('Profile'),
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
        // padding: EdgeInsets.only(
        //     left: 16.0,
        //     top: 25.0,
        //     right: 16.0,
        //   ),
        drawer: MyDrawer(),
        body: Container(
          padding: EdgeInsets.only(
            left: 16.0,
            top: 25.0,
            right: 16.0,
          ),
          child: ListView(children: [
            Text(
              "Edit Profile",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 35,
            ),
            // TextFormField(
            //   decoration: InputDecoration(
            //       hintText: 'Full Name', border: OutlineInputBorder()),
            //   //   controller: _controllerFullName,
            //   //   cursorColor: Color(0xffb744b8),
            //   //   decoration: InputDecoration(
            //   //     hintText: "Full Name",
            //   validator: (value) {
            //     if (value.isEmpty) {
            //       return 'Please Enter Full Name';
            //     } else {
            //       return null;
            //     }
            //   },
            // ),
            TextField(
              controller: _controllerFullName,
              cursorColor: Color(0xffb744b8),
              decoration: InputDecoration(
                hintText: "Full Name",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _controllerEmail,
              cursorColor: Color(0xffb744b8),
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _controllerMobile,
              cursorColor: Color(0xffb744b8),
              decoration: InputDecoration(
                hintText: "Mobile",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: _controllerSocialurl,
              cursorColor: Color(0xffb744b8),
              decoration: InputDecoration(
                hintText: "Social URL",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // TextField(
            //   controller: _controllerdob,
            //   cursorColor: Color(0xffb744b8),
            //   decoration: InputDecoration(
            //     hintText: "Date of Birth",
            //   ),
            // ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
                color: Color(0xFFFF0000),
                onPressed: () {
                  editUser();
                },
                child: Text("update",
                    style: TextStyle(
                      color: Color(0xffffffff),
                    ))),
            SizedBox(
              height: 40,
            ),
          ]),
        ));
  }

  editUser() async {
    var full_name = _controllerFullName.text;
    var email = _controllerEmail.text;
    var mobile = _controllerMobile.text;
    //var dob = _controllerdob.text;
    var social_link = _controllerSocialurl.text;
    if (full_name.isNotEmpty && email.isNotEmpty) {
      var url = "http://ktcapp.aitlab.xyz/api/profile/update";
      var bodyData = json.encode({
        "full_name": full_name,
        "email": email,
        //"dob": dob,
        "social_link": social_link,
        "mobile": mobile
      });
      var response = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json"
          },
          body: bodyData);
      if (response.statusCode == 200) {
        var messageSuccess = "Profile Updated !!";
        showMessage(context, messageSuccess);
      } else {
        var messageError = "Can not update this user!!";
        showMessage(context, messageError);
      }
    }
  }
}
