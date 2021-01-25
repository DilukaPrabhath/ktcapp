import 'package:flutter/material.dart';
import 'package:ktcapk/loginview.dart';

showMessage(BuildContext context, String contentMessage) {
  Widget yesButton = FlatButton(
    child: Text("OK", style: TextStyle(color: Color(0xffb744b8))),
    onPressed: () {
      Navigator.pop(context);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loginview()),
          (Route<dynamic> route) => false);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Message"),
    content: Text(contentMessage),
    actions: [
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

showMessage2(BuildContext context, String contentMessage) {
  Widget yesButton = FlatButton(
    child: Text("OK", style: TextStyle(color: Color(0xffb744b8))),
    onPressed: () {
      Navigator.pop(context);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Loginview()),
          (Route<dynamic> route) => false);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Message"),
    content: Text(contentMessage),
    actions: [
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
