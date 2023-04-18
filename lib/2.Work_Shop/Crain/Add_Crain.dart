import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class Add_Crain extends StatefulWidget {
  @override
  _Add_CrainState createState() => _Add_CrainState();
}

class _Add_CrainState extends State<Add_Crain> {
  var getResult = '';

  TextEditingController Owner_name = TextEditingController();
  TextEditingController Crain_details = TextEditingController();

  late bool sta;

  late String message;

  @override
  void initState() {
    Owner_name = TextEditingController();
    Crain_details = TextEditingController();

    sta = false;
    message = "";

    super.initState();
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future crain_reg() async {
    var APIURL = "http://$ip/MySampleApp/ORBVA/Work_shop/add_crain.php";

    Map mapeddate = {
      'Owner_name': Owner_name.text,
      'Crain_details': Crain_details.text,
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL), body: mapeddate);

    //getting response from php code, here
    var data = jsonDecode(reponse.body);
    var responseMessage = data["message"];
    var responseError = data["error"];
    print("DATA: ${data}");
    if (responseError) {
      setState(() {
        sta = false;
        message = responseMessage;
      });
      Fluttertoast.showToast(
          msg: 'worker not added',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          webPosition: 1,
          backgroundColor: Colors.blueGrey);
    } else {
      Owner_name.clear();
      Crain_details.clear();

      setState(() {
        sta = true;
        message = responseMessage;
      });

      Fluttertoast.showToast(
          msg: 'worker added ',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Add Crain",
            style: TextStyle(color: Colors.blue.shade700),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: new TextFormField(
                  controller: Owner_name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Owner  name";
                    }
                    return null;
                  },
                  onSaved: (name) {},
                  textCapitalization: TextCapitalization.words,
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
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Enter Owner name",
                      label: Text('Owner name'),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: new TextFormField(
                  maxLines: 5,
                  controller: Crain_details,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter  Crain_details";
                    }
                    return null;
                  },
                  onSaved: (place) {},
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
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Enter Crain_details",
                      label: Text('Crain_details'),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.red.shade900,
                  padding: EdgeInsets.only(
                      left: 110, right: 110, top: 20, bottom: 20),
                ),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      crain_reg();
                    });
                    Owner_name.clear();
                    Crain_details.clear();
                    Fluttertoast.showToast(
                        msg: 'worker added ',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.blueGrey);
                  }
                },
                child: Text('Submit'),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
