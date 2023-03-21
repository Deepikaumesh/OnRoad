import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class Create_service extends StatefulWidget {
  @override
  _Create_serviceState createState() => _Create_serviceState();
}

class _Create_serviceState extends State<Create_service> {
  String locationn = 'null press button';
  String Address = 'search';

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
    Address =
        '${place.name},${place.administrativeArea},${place.locality},${place.country}';
    address.text = Address;
    setState(() {});
  }

  var getResult = '';

  TextEditingController service_name = TextEditingController();
  TextEditingController mech_name = TextEditingController();
  TextEditingController services = TextEditingController();
  TextEditingController available = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController status = TextEditingController();
  late bool sta;

  late String message;

  @override
  void initState() {
    service_name = TextEditingController();
    mech_name = TextEditingController();
    services = TextEditingController();
    available = TextEditingController();
    address = TextEditingController();
    city = TextEditingController();
    location = TextEditingController();
    mobile = TextEditingController();
    status = TextEditingController(text: 'pending');

    sta = false;
    message = "";

    super.initState();
  }

  var service_item = [
    'Onroad Mech',
  ];

  var services_item = [
    'Cars',
    'Bike',
    'All Cars and Bikes',
    'Autorikshaw',
    'Van',
  ];

  var available_item = [
    '24 hrs',
    '10 am to 6 pm',
    '6 pm to 10 am',
  ];

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Future Service_Reg() async {
    var APIURL = "http://$ip/MySampleApp/ORBVA/Service/create_service.php";

    Map mapeddate = {
      'service_name': service_name.text,
      'mech_name': mech_name.text,
      'services': services.text,
      'available': available.text,
      'address': address.text,
      'city': city.text,
      'location': location.text,
      'mobile': mobile.text,
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
          msg: 'service not created ',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          webPosition: 1,
          backgroundColor: Colors.blueGrey);
    } else {
      service_name.clear();
      mech_name.clear();
      services.clear();
      available.clear();
      address.clear();
      city.clear();
      location.clear();
      mobile.clear();
      status.clear();

      setState(() {
        sta = true;
        message = responseMessage;
      });

      Fluttertoast.showToast(
          msg: 'service created ',
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
            "Create Service",
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
                child: Row(
                  children: <Widget>[
                    new Expanded(
                        child: new TextFormField(
                      controller: service_name,
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
                          hintText: "Please select the service type",
                          label: Text('Service name'),
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    )),
                    new PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value) {
                        service_name.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return service_item
                            .map<PopupMenuItem<String>>((String value) {
                          return new PopupMenuItem(
                              child: new Text(value), value: value);
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: TextFormField(
                  controller: mech_name,
                  keyboardType: TextInputType.text,
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
                      hintText: "Please enter Mechanic name",
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
                        child: new TextFormField(
                      controller: services,
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
                          hintText: "Please select the services",
                          label: Text('Services'),
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    )),
                    new PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value1) {
                        services.text = value1;
                      },
                      itemBuilder: (BuildContext ctx) {
                        return services_item
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
                        child: new TextFormField(
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
                          hintText: "Please select available time",
                          label: Text('Available'),
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    )),
                    new PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value) {
                        available.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return available_item
                            .map<PopupMenuItem<String>>((String value) {
                          return new PopupMenuItem(
                              child: new Text(value), value: value);
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              //   child: TextFormField(
              //     controller: location,
              //     keyboardType: TextInputType.number,
              //     style: TextStyle(color: Colors.black),
              //     decoration: InputDecoration(
              //         enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(
              //             color: Colors.black,
              //           ),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(
              //             color: Colors.black,
              //           ),
              //         ),
              //         hintText: "select your location",
              //         hintStyle: TextStyle(color: Colors.grey),
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //         )),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              //   child: TextFormField(
              //     controller: address,
              //     keyboardType: TextInputType.text,
              //     style: TextStyle(color: Colors.black),
              //     decoration: InputDecoration(
              //         enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(
              //             color: Colors.black,
              //           ),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(
              //             color: Colors.black,
              //           ),
              //         ),
              //         hintText: "Please enter a address",
              //         hintStyle: TextStyle(color: Colors.grey),
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //         )),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextFormField(
                  controller: city,
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
                      hintText: "enter city",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextFormField(
                  controller: mobile,
                  keyboardType: TextInputType.number,
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
                      hintText: "enter mobile no",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(
                height: 15,
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
                            locationn =
                                'Lat${position.latitude},Log${position.longitude}';
                            location.text = locationn;
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
              SizedBox(height: 20,),


              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextFormField(
                  controller: address,
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



              SizedBox(height: 30,),







              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.blueGrey.shade300,
                  padding: EdgeInsets.only(
                      left: 110, right: 110, top: 20, bottom: 20),
                ),
                onPressed: () {
                  setState(() {});
                  Service_Reg();
                  service_name.clear();
                  mech_name.clear();
                  services.clear();
                  available.clear();
                  address.clear();
                  city.clear();
                  location.clear();
                  mobile.clear();
                  //status.clear();
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
