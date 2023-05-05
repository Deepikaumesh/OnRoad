// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
//
// import '../../main.dart';
// import '';
// import 'View_workers.dart';
//
//
//
//
//
//
//
//
// class Edit_Worker extends StatefulWidget {
//   final worker_data_model data_user;
//
//   const Edit_Worker({required this.data_user});
//
//   @override
//   _Edit_WorkerState createState() => _Edit_WorkerState();
// }
//
// class _Edit_WorkerState extends State<Edit_Worker> {
//   TextEditingController mech_name = TextEditingController();
//   TextEditingController place = TextEditingController();
//   TextEditingController post = TextEditingController();
//   TextEditingController pin = TextEditingController();
//   TextEditingController district = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController contact_no = TextEditingController();
//   TextEditingController specification = TextEditingController();
//   TextEditingController available = TextEditingController();
//
//
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   var district_item = [
//     'Kasaragod',
//     'Kannur',
//     ' Wayanad',
//     'Kozhikode',
//     'Malappuram',
//     ' Palakkad',
//     'Thrissur',
//     'Ernakulam',
//     'Idukki',
//     'Kottayam',
//     'Alappuzha',
//     'Pathanamthitta',
//     ' Kollam',
//     'Thiruvananthapuram'
//   ];
//   var available_item = [
//     '24 hrs',
//     '10 am to 6 pm',
//     '6 pm to 10 am',
//   ];
//
//   var specification_item = [
//     'Car',
//     'Bike',
//     'All Cars and Bikes',
//     'Autorickshaw',
//     'Van',
//   ];
//
//   submit() async {
//     final response = await http.post(
//         Uri.parse(
//             "http://$ip/MySampleApp/ORBVA/Work_shop/Edit_worker.php"),
//         body: {
//           //"id": widget.data_user.id.toString(),
//           'mech_name': mech_name.text,
//           'place': place.text,
//           'post': post.text,
//           'pin': pin.text,
//           'district': district.text,
//           'email': email.text,
//           'contact_no': contact_no.text,
//           'specification': specification.text,
//           'available': available.text,
//         });
//     if (response.statusCode == 200) {
//       mech_name.clear();
//       contact_no.clear();
//       place.clear();
//       post.clear();
//       pin.clear();
//       district.clear();
//       email.clear();
//       specification.clear();
//       available.clear();
//
//
//       final snackBar = await SnackBar(
//         content: const Text('Event updated successfully!'),
//         action: SnackBarAction(
//           label: 'Ok',
//           onPressed: () {
//             //Navigator.pop(context);
//             // Some code to undo the change.
//           },
//         ),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     } else {
//       print("not");
//       final snackBar = await SnackBar(
//         content: const Text('Event updation failed!'),
//         action: SnackBarAction(
//           label: 'Ok',
//           onPressed: () {
//             //Navigator.pop(context);
//             // Some code to undo the change.
//           },
//         ),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }
//     setState(() {
//     });
//
//   }
//
//   @override
//   void initState() {
//     mech_name = TextEditingController(text: widget.data_user.mech_name);
//     place = TextEditingController(text: widget.data_user.place);
//     post = TextEditingController(text: widget.data_user.post);
//     pin = TextEditingController(text: widget.data_user.pin);
//     district = TextEditingController(text: widget.data_user.district);
//     email = TextEditingController(text: widget.data_user.email);
//     contact_no = TextEditingController(text: widget.data_user.contact_no);
//     specification = TextEditingController(text: widget.data_user.specification);
//     available = TextEditingController(text: widget.data_user.available);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           "Edit Event",
//           style: GoogleFonts.prompt(color: Colors.pink.shade300),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(
//             Icons.arrow_back_rounded, color: Colors.pink.shade300,
//             size: 35, // add custom icons also
//           ),
//         ),
//       ),
//       body: Container(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all(30),
//             child: Form(
//               key: _formkey,
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     // padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
//                     child: TextFormField(
//                       controller: mech_name,
//                       decoration: InputDecoration(
//                         labelText: "Enter event name",
//                         border: new OutlineInputBorder(
//                           borderSide: new BorderSide(color: Colors.teal),
//                         ),
//                       ),
//                       keyboardType: TextInputType.text,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     // padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                     child: TextFormField(
//                       controller: email,
//                       decoration: InputDecoration(
//                         labelText: "Pick event date",
//                         border: new OutlineInputBorder(
//                           borderSide: new BorderSide(color: Colors.teal),
//                         ),
//                       ),
//                       keyboardType: TextInputType.datetime,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     //  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                     child: TextFormField(
//                       controller: contact_no,
//                       decoration: InputDecoration(
//                         labelText: "Enter event time",
//                         border: new OutlineInputBorder(
//                           borderSide: new BorderSide(color: Colors.teal),
//                         ),
//                       ),
//                       keyboardType: TextInputType.text,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     //  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                     child: TextFormField(
//                       controller: place,
//                       decoration: InputDecoration(
//                         labelText: "Enter event description",
//                         border: new OutlineInputBorder(
//                           borderSide: new BorderSide(color: Colors.teal),
//                         ),
//                       ),
//                       keyboardType: TextInputType.multiline,
//                       maxLines: 5,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     //  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                     child: TextFormField(
//                       controller: post,
//                       decoration: InputDecoration(
//                         labelText: "Enter event description",
//                         border: new OutlineInputBorder(
//                           borderSide: new BorderSide(color: Colors.teal),
//                         ),
//                       ),
//                       keyboardType: TextInputType.multiline,
//                       maxLines: 5,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     //  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                     child: TextFormField(
//                       controller: pin,
//                       decoration: InputDecoration(
//                         labelText: "Enter event description",
//                         border: new OutlineInputBorder(
//                           borderSide: new BorderSide(color: Colors.teal),
//                         ),
//                       ),
//                       keyboardType: TextInputType.multiline,
//                       maxLines: 5,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     //  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                     child: TextFormField(
//                       controller: place,
//                       decoration: InputDecoration(
//                         labelText: "Enter event description",
//                         border: new OutlineInputBorder(
//                           borderSide: new BorderSide(color: Colors.teal),
//                         ),
//                       ),
//                       keyboardType: TextInputType.multiline,
//                       maxLines: 5,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                     child: Row(
//                       children: <Widget>[
//                         new Expanded(
//                             child: TextFormField(
//                               textCapitalization: TextCapitalization.words,
//                               controller: district,
//                               decoration: InputDecoration(
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   hintText: "Please select your Specification",
//                                   label: Text('Specification'),
//                                   hintStyle: TextStyle(color: Colors.grey),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   )),
//                             )),
//                         new PopupMenuButton<String>(
//                           icon: const Icon(Icons.arrow_drop_down),
//                           onSelected: (String value1) {
//                             specification.text = value1;
//                           },
//                           itemBuilder: (BuildContext ctx) {
//                             return specification_item
//                                 .map<PopupMenuItem<String>>((String value1) {
//                               return new PopupMenuItem(
//                                   child: new Text(value1), value: value1);
//                             }).toList();
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                     child: Row(
//                       children: <Widget>[
//                         new Expanded(
//                             child: TextFormField(
//                               textCapitalization: TextCapitalization.words,
//                               controller: specification,
//                               decoration: InputDecoration(
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   hintText: "Please select your Specification",
//                                   label: Text('Specification'),
//                                   hintStyle: TextStyle(color: Colors.grey),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   )),
//                             )),
//                         new PopupMenuButton<String>(
//                           icon: const Icon(Icons.arrow_drop_down),
//                           onSelected: (String value1) {
//                             specification.text = value1;
//                           },
//                           itemBuilder: (BuildContext ctx) {
//                             return specification_item
//                                 .map<PopupMenuItem<String>>((String value1) {
//                               return new PopupMenuItem(
//                                   child: new Text(value1), value: value1);
//                             }).toList();
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//                     child: Row(
//                       children: <Widget>[
//                         new Expanded(
//                             child: TextFormField(
//                               textCapitalization: TextCapitalization.words,
//                               controller: available,
//                               decoration: InputDecoration(
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                     borderSide: BorderSide(
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   hintText: "Please select your available time",
//                                   label: Text('Available'),
//                                   hintStyle: TextStyle(color: Colors.grey),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   )),
//                             )),
//                         new PopupMenuButton<String>(
//                           icon: const Icon(Icons.arrow_drop_down),
//                           onSelected: (String value1) {
//                             available.text = value1;
//                           },
//                           itemBuilder: (BuildContext ctx) {
//                             return available_item
//                                 .map<PopupMenuItem<String>>((String value1) {
//                               return new PopupMenuItem(
//                                   child: new Text(value1), value: value1);
//                             }).toList();
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//
//
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 shape: StadiumBorder(),
//                 backgroundColor: Colors.pink.shade200,
//                 padding: EdgeInsets.only(
//                     left: 100, right: 100, top: 20, bottom: 20),
//               ),
//               onPressed: () {
//                 submit();
//                 mech_name.clear();
//                 contact_no.clear();
//                 place.clear();
//                 post.clear();
//                 pin.clear();
//                 district.clear();
//                 email.clear();
//                 specification.clear();
//                 available.clear();
//               }, child: Text("Update",style: TextStyle(fontSize: 20),),
//
//
//             ),
//
//
//
//             ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';
import 'Workshop_Dash.dart';


class Edit_Workshop_Page extends StatefulWidget {
  final List list;
  final int index;

  Edit_Workshop_Page({required this.list, required this.index});

  @override
  _Edit_Workshop_PageState createState() => new _Edit_Workshop_PageState();
}

class _Edit_Workshop_PageState extends State<Edit_Workshop_Page> {
  TextEditingController name = TextEditingController();
  TextEditingController contact_no = TextEditingController();
  TextEditingController email_id = TextEditingController();
  TextEditingController license_no = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController status = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();





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

  void UpdateData() {
    var url = "http://$ip/MySampleApp/ORBVA/Work_shop/Edit_workshop.php";
    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['id'],
      'name': name.text,
      'contact_no': contact_no.text,
      'email_id':email_id.text,
      'license_no':license_no.text,
      'address':address.text,
      'location':location.text,
      'status':widget.list[widget.index]['status'],




    });
  }

  @override
  void initState() {
    name =
        TextEditingController(text: widget.list[widget.index]['name']);
    contact_no =
        TextEditingController(text: widget.list[widget.index]['contact_no']);
    email_id = TextEditingController(text: widget.list[widget.index]['email_id']);
    license_no = TextEditingController(text: widget.list[widget.index]['license_no']);
    address = TextEditingController(text: widget.list[widget.index]['address']);
    location = TextEditingController(text: widget.list[widget.index]['location']);
    status = TextEditingController(text: widget.list[widget.index]['status']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Edit Data",
          style: GoogleFonts.prompt(color: Colors.red.shade900),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Form(
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
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.red.shade900),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                          textStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 20))),
                      onPressed: () {
                        setState(() {
                          UpdateData();
                          Navigator.of(context).pushReplacement(
                              new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Workshop_Dash()));
                        });
                      },
                      child: Text("Submit")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
