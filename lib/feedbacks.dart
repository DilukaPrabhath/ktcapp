import 'package:ktcapk/firstscreen.dart';
import 'package:ktcapk/homepage.dart';
import 'package:ktcapk/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Feedbacks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FeedbacksState();
  }
}

class FeedbacksState extends State<Feedbacks> {
  TextEditingController feedback;

  addData() {
    var url = 'http://ktcapp.aitlab.xyz/api/feedback';
    http.post(url, body: {
      'feedback': feedback.text,
    });
  }

  void initState() {
    feedback = TextEditingController(text: '');
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'How is our service ?', border: OutlineInputBorder()),
      maxLines: 10,
      controller: feedback,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Feedback is Required';
        }

        return null;
      },
      // onSaved: (String value) {
      //   feedback = value;
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF0000),
        title: Text('Feedbacks'),
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
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                SizedBox(height: 40),
                RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.red[800],
                  child: Text(
                    "Send Feedback",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    setState(() {
                      addData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Homepage(),
                        ),
                      );
                    });

                    debugPrint('Clicked');

                    //_formKey.currentState.save();

                    //Response responceClient = await Dio().get('http://ktcapp.aitlab.xyz/api/feedback');

                    // print(feedback);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
