import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class Add_Workshop extends StatefulWidget {
  @override
  _Add_WorkshopState createState() => _Add_WorkshopState();
}

class _Add_WorkshopState extends State<Add_Workshop> {
  String locationns = 'null press button';
  String Addresss = 'search';

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> GetAddressFromLatiLongi(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemark);
    Placemark place = placemark[0];
    Addresss =
        '${place.name},${place.administrativeArea},${place.locality},${place.country}';
    address.text = Addresss;
    setState(() {});
  }

  var getResult = '';

  TextEditingController name = TextEditingController();
  TextEditingController contact_no = TextEditingController();
  TextEditingController email_id = TextEditingController();
  TextEditingController license_no = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController status = TextEditingController();

  late bool sta;

  late String message;

  @override
  void initState() {
    name = TextEditingController();
    contact_no = TextEditingController();
    email_id = TextEditingController();
    license_no = TextEditingController();
    address = TextEditingController();
    location = TextEditingController();
    status = TextEditingController(text: 'pending');

    sta = false;
    message = "";

    super.initState();
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future Service_Reg() async {
    var APIURL = "http://$ip/MySampleApp/ORBVA/Work_shop/add_workshop.php";

    Map mapeddate = {
      'name': name.text,
      'contact_no': contact_no.text,
      'email_id': email_id.text,
      'license_no': license_no.text,
      'address': address.text,
      'location': location.text,
      'status': status.text,
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
          msg: 'workshop not added',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          webPosition: 1,
          backgroundColor: Colors.blueGrey);
    } else {
      name.clear();
      contact_no.clear();
      email_id.clear();
      license_no.clear();
      address.clear();
      location.clear();
      status.clear();

      setState(() {
        sta = true;
        message = responseMessage;
      });

      Fluttertoast.showToast(
          msg: 'workshop added',
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
            "Add Workshop",
            style: TextStyle(color: Colors.red.shade300),
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
                  controller: name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter workshop name";
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
                      hintText: "Enter Workshop name",
                      label: Text('Workshop name'),
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
                  controller: email_id,
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
                  controller: license_no,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter license no";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
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
                      hintText: "Enter license no",
                      label: Text('License no'),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 55,
                    width: 150,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black),
                      controller: location,
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "Please add your location";
                      //   }
                      //   //return null;
                      // },
                      // onSaved: (location) {},
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            //borderRadius: BorderRadius.circular(10),
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
                          hintText: "Tap the button to get the location",
                          label: Text("Location"),
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                  SizedBox(
                      height: 55,
                      child: ElevatedButton(
                          onPressed: () async {
                            Position position = await _determinePosition();
                            print(position.latitude);
                            print(position.longitude);
                            locationns =
                                'Lat${position.latitude},Log${position.longitude}';
                            location.text = locationns;
                            GetAddressFromLatiLongi(position);
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade200),
                          child: Row(
                            children: [
                              Text("Get location"),
                              Icon(Icons.add_location),
                            ],
                          ))),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextFormField(
                  controller: address,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please add address";
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
                      hintText: "Please enter a address",
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
                  backgroundColor: Colors.blueGrey.shade300,
                  padding: EdgeInsets.only(
                      left: 110, right: 110, top: 20, bottom: 20),
                ),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      Service_Reg();
                    });
                    name.clear();
                    contact_no.clear();
                    email_id.clear();
                    license_no.clear();
                    address.clear();
                    location.clear();
                    //status.clear();
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
