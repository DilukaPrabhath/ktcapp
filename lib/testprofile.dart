import 'package:ktcapk/firstscreen.dart';
import 'package:ktcapk/homepage.dart';
import 'package:ktcapk/main.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ktcapk/button_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

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

  addData() {
    var url = 'http://ktcapp.aitlab.xyz/api/feedback';
    http.post(url, body: {
      'feedback': full_name.text,
      'email': email.text,
      'mobile': mobile.text,
      'social_link': social_link.text,
      'dob': dob.text,
    });
  }

  void initState() {
    full_name = TextEditingController(text: '');
    email = TextEditingController(text: '');
    mobile = TextEditingController(text: '');
    social_link = TextEditingController(text: '');
    dob = TextEditingController(text: '');
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  // String full_name = '';
  // String email = '';
  // String mobile = '';
  // String social_link = '';
  // String dob = '';

  @override
  Widget build(BuildContext context) => Scaffold(
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
        drawer: MyDrawer(),
        body: Form(
          key: formKey,
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              buildUsername(),
              const SizedBox(height: 16),
              buildEmail(),
              const SizedBox(height: 32),
              buildMobile(),
              const SizedBox(height: 32),
              buildSocial(),
              const SizedBox(height: 32),
              buildDob(),
              const SizedBox(height: 32),
              buildSubmit(),
            ],
          ),
        ),
      );

  Widget buildUsername() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Full Name',
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
        ),
        controller: full_name,
        validator: (value) {
          if (value.length < 4) {
            return 'Enter at least 4 characters';
          } else {
            return null;
          }
        },
        maxLength: 30,
        //onSaved: (value) => setState(() => full_name = value),
      );

  Widget buildEmail() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
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
        // onSaved: (value) => setState(() => email = value),
      );

  Widget buildMobile() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Mobile number',
          border: OutlineInputBorder(),
        ),
        controller: mobile,
        validator: (value) {
          if (value.length < 4) {
            return 'Enter Valied Mobile Number';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.phone,
        //onSaved: (value) => setState(() => mobile = value),
      );

  Widget buildSocial() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Social URL',
          border: OutlineInputBorder(),
        ),
        controller: social_link,
        keyboardType: TextInputType.url,
        //onSaved: (value) => setState(() => social_link = value),
      );

  Widget buildDob() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Date Of Birth',
          border: OutlineInputBorder(),
        ),
        controller: dob,
        validator: (value) {
          if (value.length < 1) {
            return 'Enter Date Of Birth';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.datetime,
        //onSaved: (value) => setState(() => dob = value),
      );

  Widget buildSubmit() => Builder(
        builder: (context) => ButtonWidget(
          text: 'Submit',
          onClicked: () {
            final isValid = formKey.currentState.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              formKey.currentState.save();

              final message =
                  'full_name: $full_name\nmobile: $mobile\nemail: $email\ndob: $dob';
              final snackBar = SnackBar(
                content: Text(
                  message,
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      );
}
