import 'package:ktcapk/firstscreen.dart';
import 'package:ktcapk/listtest.dart';
import 'package:ktcapk/main.dart';
import 'package:flutter/material.dart';

class EditUser extends StatefulWidget {
  String userId;
  String fullName;
  String email;
  String invoice_total;
  String sales_tax;
  String service_tax;
  String invoice_payment;
  String invoice_discount;
  EditUser({
    this.userId,
    this.fullName,
    this.email,
    this.invoice_total,
    this.sales_tax,
    this.service_tax,
    this.invoice_payment,
    this.invoice_discount,
  });
  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final TextEditingController _controllerFullName = new TextEditingController();
  final TextEditingController _controllerEmail = new TextEditingController();
  final TextEditingController _controllerSaleTax = new TextEditingController();
  final TextEditingController _controllerServiceTax =
      new TextEditingController();
  final TextEditingController _controllerInvoiceTotal =
      new TextEditingController();
  final TextEditingController _controllerInvoiceDiscount =
      new TextEditingController();
  final TextEditingController _controllerInvoicePayment =
      new TextEditingController();
  String userId = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      userId = widget.userId;
      _controllerFullName.text = widget.fullName;
      _controllerEmail.text = widget.email;
      _controllerSaleTax.text = widget.sales_tax;
      _controllerServiceTax.text = widget.service_tax;
      _controllerInvoiceTotal.text = widget.invoice_total;
      _controllerInvoiceDiscount.text = widget.invoice_payment;
      _controllerInvoicePayment.text = widget.invoice_discount;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      padding: EdgeInsets.all(30),
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        TextField(
          enabled: false,
          controller: _controllerFullName,
          cursorColor: Color(0xffb744b8),
          decoration: InputDecoration(
            hintText: "FullName",
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          enabled: false,
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
          enabled: false,
          controller: _controllerSaleTax,
          cursorColor: Color(0xffb744b8),
          decoration: InputDecoration(
            hintText: "Sales Tax",
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          enabled: false,
          controller: _controllerServiceTax,
          cursorColor: Color(0xffb744b8),
          decoration: InputDecoration(
            hintText: "Service tax",
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          enabled: false,
          controller: _controllerInvoiceTotal,
          cursorColor: Color(0xffb744b8),
          decoration: InputDecoration(
            hintText: "Invoice Total",
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          enabled: false,
          controller: _controllerInvoiceDiscount,
          cursorColor: Color(0xffb744b8),
          decoration: InputDecoration(
            hintText: "Discount",
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          enabled: false,
          controller: _controllerInvoicePayment,
          cursorColor: Color(0xffb744b8),
          decoration: InputDecoration(
            hintText: "Invoice Payment",
          ),
        ),
        SizedBox(
          height: 40,
        ),
        FlatButton(
            color: Colors.red[800],
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Listtest(),
                      ))
                },
            child: Text(
              "Done",
              style: TextStyle(color: Color(0xffffffff)),
            ))
      ],
    );
  }

  // editUser() async {
  //   var fullName = _controllerFullName.text;
  //   var email = _controllerEmail.text;
  //   if (fullName.isNotEmpty && email.isNotEmpty) {
  //     var url = BASE_API + "history/$userId";
  //     var bodyData = json.encode({"invoice_date": fullName, "email": email});
  //     var response = await http.post(url,
  //         headers: {
  //           "Content-Type": "application/json",
  //           "Accept": "application/json"
  //         },
  //         body: bodyData);
  //     if (response.statusCode == 200) {
  //       var messageSuccess = json.decode(response.body)['message'];
  //       showMessage(context, messageSuccess);
  //     } else {
  //       var messageError = "Can not update this user!!";
  //       showMessage(context, messageError);
  //     }
  //   }
  // }
}
