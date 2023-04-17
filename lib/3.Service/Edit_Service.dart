import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import 'display_Edit_Profile_Page.dart';

class Edit_Service extends StatefulWidget {
  List list;
  int index;

  Edit_Service({required this.list, required this.index});

  @override
  _Edit_ServiceState createState() => _Edit_ServiceState();
}

class _Edit_ServiceState extends State<Edit_Service> {
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

  void UpdateData() {
    var url = "http://$ip/MySampleApp/ORBVA/Service_center/Edit_Service.php";
    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['id'],
      'service_name': service_name.text,
      'mech_name': mech_name.text,
      'services': services.text,
      'available': available.text,
      'address': address.text,
      'city': city.text,
      'location': location.text,
      'mobile': mobile.text,
      'status': status.text,
    });
  }

  @override
  void initState() {
    service_name =
        TextEditingController(text: widget.list[widget.index]['service_name']);
    mech_name =
        TextEditingController(text: widget.list[widget.index]['mech_name']);
    services =
        TextEditingController(text: widget.list[widget.index]['services']);
    available =
        TextEditingController(text: widget.list[widget.index]['available']);
    address = TextEditingController(text: widget.list[widget.index]['address']);
    city = TextEditingController(text: widget.list[widget.index]['city']);
    location =
        TextEditingController(text: widget.list[widget.index]['location']);
    mobile = TextEditingController(text: widget.list[widget.index]['mobile']);
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
            "Edit Profile",
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
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
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
              SizedBox(
                height: 20,
              ),
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
                  setState(() {});
                  UpdateData();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>Display_Edit_Profile_Page()));
                 // Navigator.pushNamed(context, 'Display_Edit_Profile_Page');
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
