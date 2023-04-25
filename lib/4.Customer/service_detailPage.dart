import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/main.dart';
import 'package:http/http.dart' as http;

class service_Detail_Page extends StatefulWidget {
  final data_pass;

  const service_Detail_Page({required this.data_pass});

  @override
  _service_Detail_PageState createState() => _service_Detail_PageState();
}

class _service_Detail_PageState extends State<service_Detail_Page> {
  TextEditingController status = TextEditingController();

  @override
  void initState() {
    status = TextEditingController(text: widget.data_pass.status);

    super.initState();
  }

  var status_item = [
    // 'Pending',
    'Approved',
    'Rejected',
    'Pending'
  ];
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.data_pass.services,
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
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  //color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: AssetImage("assets/images/w.jpg"),
                      fit: BoxFit.fill),
                  //Image.asset("assets/images/workshop.png"),
                ),
              ),
            ),
            Positioned(
              top: 290,
              left: 20,
              right: 200,
              child: Column(
                children: [
                  Text("Available"),
                  SizedBox(height: 8,),
                  Data_Box(widget.data_pass.available),
                ],
              )


            ),
            Positioned(
              top: 290,
              left: 200,
              right: 20,
                child: Column(
                  children: [
                    Text("Mobile No"),
                    SizedBox(height: 8,),
                    Data_Box(widget.data_pass.mobile),
                  ],
                )
            ),
            Positioned(
              top: 390,
              left: 20,
              right: 200,
                child: Column(
                  children: [
                    Text("Service name"),
                    SizedBox(height: 8,),
                    Data_Box(widget.data_pass.service_name),
                  ],
                )
            ),
            Positioned(
              top: 390,
              left: 200,
              right: 20,
                child: Column(
                  children: [
                    Text("Mech Name"),
                    SizedBox(height: 8,),
                    Data_Box(widget.data_pass.mech_name),
                  ],
                )
            ),
            Positioned(
                top: 500,
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
      child: Row(
        children: [
          Text(''),
          Text(
            data,
            style: TextStyle(fontSize: 15, color: Colors.black87),
            overflow: TextOverflow.clip,
          ),
        ],
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
        "http://$ip/MySampleApp/ORBVA/Customer/send_Service_request.php";

    Map mapeddate = {
      'customer_id': cust_id,
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
          msg: 'Request send to ${widget.data_pass.services}',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey);
    }
  }
}
