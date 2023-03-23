import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class Add_Worker extends StatefulWidget {
  @override
  _Add_WorkerState createState() => _Add_WorkerState();
}

class _Add_WorkerState extends State<Add_Worker> {
  var getResult = '';

  TextEditingController mech_name = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController post = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contact_no = TextEditingController();
  TextEditingController specification = TextEditingController();
  TextEditingController available = TextEditingController();

  var district_item = [
    'Kasaragod',
    'Kannur',
    ' Wayanad',
    'Kozhikode',
    'Malappuram',
    ' Palakkad',
    'Thrissur',
    'Ernakulam',
    'Idukki',
    'Kottayam',
    'Alappuzha',
    'Pathanamthitta',
    ' Kollam',
    'Thiruvananthapuram'
  ];
  var available_item = [
    '24 hrs',
    '10 am to 6 pm',
    '6 pm to 10 am',
  ];

  var specification_item = [
    'Car',
    'Bike',
    'All Cars and Bikes',
    'Autorickshaw',
    'Van',
  ];
  late bool sta;

  late String message;

  @override
  void initState() {
    mech_name = TextEditingController();
    place = TextEditingController();
    post = TextEditingController();
    pin = TextEditingController();
    district = TextEditingController();
    email = TextEditingController();
    contact_no = TextEditingController();
    specification = TextEditingController();
    available = TextEditingController();


    sta = false;
    message = "";

    super.initState();
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future worker_reg() async {
    var APIURL = "http://$ip/MySampleApp/ORBVA/Work_shop/add_worker.php";

    Map mapeddate = {
      'mech_name': mech_name.text,
      'place': place.text,
      'post': post.text,
      'pin': pin.text,
      'district': district.text,
      'email': email.text,
      'contact_no': contact_no.text,
      'specification': specification.text,
      'available': available.text,
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
      mech_name.clear();
      contact_no.clear();
      place.clear();
      post.clear();
      pin.clear();
      district.clear();
      email.clear();
      specification.clear();
      available.clear();

      setState(() {
        sta = true;
        message = responseMessage;
      });

      Fluttertoast.showToast(
          msg: 'worker added ',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
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
            "Add Worker",
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
                  controller: mech_name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter mechanic name";
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
                      hintText: "Enter mechanic name",
                      label: Text('mechanic name'),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: new TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter  email";
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                  onSaved: (email) {},
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
                      hintText: "Enter email id",
                      label: Text('Email'),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextFormField(
                  controller: contact_no,
                  // validator: (value) {
                  //   if (value!.isEmpty && value.length < 10) {
                  //     return "Please enter phone number";
                  //   }
                  //   return null;
                  // },
                  // onSaved: (contact_no) {},
                  validator: (value) {
                    if (value!.isEmpty && value.length < 10) {
                      return "Please enter contact no";
                    }
                    return null;
                  },
                  onSaved: (contact_no) {},
                  keyboardType: TextInputType.number,
                  //   style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        // borderSide: BorderSide(
                        //   color: Colors.black,
                        // ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Please enter Contact no",
                      label: Text('Contact no'),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: new TextFormField(
                  controller: place,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter  place";
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
                      hintText: "Enter place",
                      label: Text('place'),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextFormField(
                  controller: post,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter post";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
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
                      hintText: "Enter post",
                      label: Text('post'),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextFormField(
                  controller: pin,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter pin";
                    }
                    return null;
                  },
                  onSaved: (name) {},
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black),
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
                      hintText: "Please enter pin",
                      labelText: 'pin',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Row(
                  children: <Widget>[
                    new Expanded(
                        child: TextFormField(
                      controller: district,
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
                          hintText: "Please select your District",
                          label: Text('District'),
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    )),
                    new PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value1) {
                        district.text = value1;
                      },
                      itemBuilder: (BuildContext ctx) {
                        return district_item
                            .map<PopupMenuItem<String>>((String value1) {
                          return new PopupMenuItem(
                              child: new Text(value1), value: value1);
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Row(
                  children: <Widget>[
                    new Expanded(
                        child: TextFormField(
                          controller: specification,
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
                              hintText: "Please select your Specification",
                              label: Text('Specification'),
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        )),
                    new PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value1) {
                        specification.text = value1;
                      },
                      itemBuilder: (BuildContext ctx) {
                        return specification_item
                            .map<PopupMenuItem<String>>((String value1) {
                          return new PopupMenuItem(
                              child: new Text(value1), value: value1);
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Row(
                  children: <Widget>[
                    new Expanded(
                        child: TextFormField(
                          controller: available,
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
                              hintText: "Please select your available time",
                              label: Text('Available'),
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        )),
                    new PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value1) {
                        available.text = value1;
                      },
                      itemBuilder: (BuildContext ctx) {
                        return available_item
                            .map<PopupMenuItem<String>>((String value1) {
                          return new PopupMenuItem(
                              child: new Text(value1), value: value1);
                        }).toList();
                      },
                    ),
                  ],
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
                      worker_reg();
                    });
                    mech_name.clear();
                    contact_no.clear();
                    place.clear();
                    post.clear();
                    pin.clear();
                    district.clear();
                    email.clear();
                    specification.clear();
                    available.clear();
                  }
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
