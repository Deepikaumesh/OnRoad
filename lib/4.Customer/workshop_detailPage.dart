import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/main.dart';
import 'package:http/http.dart' as http;

import 'Customer_splashscreen.dart';

class Workshop_Detail_Page extends StatefulWidget {
  final data_pass;

  const Workshop_Detail_Page({required this.data_pass});

  @override
  _Workshop_Detail_PageState createState() => _Workshop_Detail_PageState();
}

class _Workshop_Detail_PageState extends State<Workshop_Detail_Page> {
  TextEditingController status = TextEditingController();
  TextEditingController request = TextEditingController();

  @override
  void initState() {
    status = TextEditingController(text: widget.data_pass.status);
    request = TextEditingController();

    super.initState();
  }

  var request_item = [
    'Car Breakdown please help..',
    'Bike Breakdown please help..',
    'Autorikshaw Breakdown please help..',
    'Van Breakdown please help..',
  ];
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.data_pass.name,
          style: GoogleFonts.prompt(color: Colors.blueGrey.shade900),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              // color: Colors.red,
              height: 800,
              // color: Colors.green,
            ),
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: Container(
                height: MediaQuery.of(context).size.height / 2.9,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  //color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: AssetImage("assets/images/w.jpg"),
                      fit: BoxFit.fitWidth),
                  //Image.asset("assets/images/workshop.png"),
                ),
              ),
            ),
            Positioned(
              top: 285,
              left: 20,
              right: 200,
              child: Data_Box(widget.data_pass.email_id),
            ),
            Positioned(
              top: 285,
              left: 200,
              right: 20,
              child: Data_Box(widget.data_pass.contact_no),
            ),
            Positioned(
              top: 390,
              left: 20,
              right: 200,
              child: Data_Box(widget.data_pass.address),
            ),
            Positioned(
              top: 390,
              left: 200,
              right: 20,
              child: Data_Box(widget.data_pass.license_no),
            ),
            Positioned(
              top: 480,
              left: 2,
              right: 2,

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Row(
                  children: <Widget>[
                    new Expanded(
                        child: new TextFormField(
                          controller: request,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              hintText: "Please select the request info",
                              label: Text('Select request'),
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        )),
                    new PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value1) {
                        request.text = value1;
                      },
                      itemBuilder: (BuildContext ctx) {
                        return request_item
                            .map<PopupMenuItem<String>>((String value1) {
                          return new PopupMenuItem(
                              child: new Text(value1), value: value1);
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 580,
                left: 20,
                right: 20,
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width, 50)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.teal.shade900),
                  ),
                  onPressed: () {
                    print(request.text);
                    setState(() {
                      Send();
                    });
                  },
                  child: Text(
                    "Send Request",
                    style: TextStyle(fontSize: 20),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Data_Box(
    String data,
  ) {
    return Container(
      padding: EdgeInsets.only(
        left: 15,
        top: 15,
        right: 15,
      ),
      //  padding: EdgeInsets.all(7),
      child: Text(
        data,
        style: TextStyle(fontSize: 15, color: Colors.black87),
        overflow: TextOverflow.clip,
      ),
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
    );
  }

  Future Send() async {
    var APIURL =
        "http://$ip/MySampleApp/ORBVA/Customer/send_workshop_request.php";

    Map mapeddate = {
      'customer_id': cust_id,
      'request':request.text,
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL), body: mapeddate);

    //getting response from php code, here
    var data = jsonDecode(reponse.body);
    var responseMessage = data["message"];
    var responseError = data["error"];
    print("DATA: ${data}");
    if (responseError) {
      Fluttertoast.showToast(
          msg: 'error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey);
    } else {
      Fluttertoast.showToast(
          msg: 'Request send to ${widget.data_pass.name}',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey);
    }
  }
}
