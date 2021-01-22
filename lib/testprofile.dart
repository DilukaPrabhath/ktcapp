import 'package:ktcapk/firstscreen.dart';
import 'package:ktcapk/homepage.dart';
import 'package:ktcapk/main.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ktcapk/button_widget.dart';
import 'dart:convert';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
// }

class TestProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestProfileState();
  }
}

class TestProfileState extends State<TestProfile> {
  TextEditingController full_name;
  TextEditingController email;
  TextEditingController mobile;
  TextEditingController social_link;
  TextEditingController dob;
  TextEditingController password;

  addData() {
    var url = 'https://ktcapp.aitlab.xyz/api/customer/register';
    http.post(url, body: {
      'feedback': full_name.text,
      'email': email.text,
      'mobile': mobile.text,
      'social_link': social_link.text,
      'dob': dob.text,
      'password': password.text,
    });
  }

  void initState() {
    full_name = TextEditingController(text: '');
    email = TextEditingController(text: '');
    mobile = TextEditingController(text: '');
    social_link = TextEditingController(text: '');
    dob = TextEditingController(text: '');
    password = TextEditingController(text: '');
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _buildName() {
    return TextFormField(
      decoration:
          InputDecoration(hintText: 'Full Name', border: OutlineInputBorder()),
      maxLines: 1,
      controller: full_name,
      validator: (value) {
        if (value.isEmpty) {
          return 'Name is Required';
        } else {
          return null;
        }
      },
      maxLength: 30,
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration:
          InputDecoration(hintText: 'E Mail', border: OutlineInputBorder()),
      maxLines: 1,
      controller: email,
      validator: (value) {
        final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
        final regExp = RegExp(pattern);

        if (value.isEmpty) {
          return 'Enter an email';
        } else if (!regExp.hasMatch(value)) {
          return 'Enter a valid email';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildMobile() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Mobile Number', border: OutlineInputBorder()),
      maxLines: 1,
      controller: mobile,
      validator: (value) {
        if (value.length < 4) {
          return 'Enter Valied Mobile Number';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.phone,
    );
  }

  Widget _buildUrl() {
    return TextFormField(
      decoration:
          InputDecoration(hintText: 'Social URL', border: OutlineInputBorder()),
      maxLines: 1,
      controller: social_link,
      keyboardType: TextInputType.url,
    );
  }

  Widget _buildDob() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Date of Birth',
          labelText: 'Date Of Birth',
          border: OutlineInputBorder()),
      maxLines: 1,
      controller: dob,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Date of Birth is Required';
        }

        return null;
      },
      keyboardType: TextInputType.datetime,
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
          border: OutlineInputBorder()),
      maxLines: 1,
      controller: password,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.red[800],
          Colors.red[700],
          Colors.red[600],
        ])),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "APT Hair Saloon",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - -60,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60))),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(195, 75, 17, 3),
                                          blurRadius: 20,
                                          offset: Offset(0, 5))
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                        color: Colors.grey[200],
                                      ))),
                                      child: Form(
                                        key: _formKey,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            _buildName(),
                                            SizedBox(height: 15),
                                            _buildEmail(),
                                            SizedBox(height: 15),
                                            _buildMobile(),
                                            SizedBox(height: 15),
                                            _buildUrl(),
                                            SizedBox(height: 15),
                                            _buildDob(),
                                            SizedBox(height: 15),
                                            _buildPassword(),
                                            SizedBox(height: 40),
                                            Container(
                                              height: 50,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              child: RaisedButton(
                                                shape:
                                                    new RoundedRectangleBorder(
                                                        borderRadius:
                                                            new BorderRadius
                                                                    .circular(
                                                                30.0)),
                                                color: Colors.red[800],
                                                child: Text(
                                                  "Register",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                onPressed: () {
                                                  if (!_formKey.currentState
                                                      .validate()) {
                                                    return;
                                                  }
                                                  setState(() {
                                                    addData();
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Homepage(),
                                                      ),
                                                    );
                                                  });

                                                  debugPrint('Clicked');

                                                  //_formKey.currentState.save();

                                                  //Response responceClient = await Dio().get('http://ktcapp.aitlab.xyz/api/feedback');

                                                  // print(feedback);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 200,
              // ),
            ],
          ),
        ),
      ),
    ));
  }
}
