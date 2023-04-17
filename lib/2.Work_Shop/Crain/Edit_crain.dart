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
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/2.Work_Shop/Worker/View_workers.dart';
import 'package:untitled/2.Work_Shop/Workshop_data.dart';
import 'package:untitled/2.Work_Shop/workshop_Dashboard.dart';
import 'package:untitled/Main_Screen/Main_Screen.dart';

import '../../main.dart';


class Edit_Crain extends StatefulWidget {
  final List list;
  final int index;

  Edit_Crain({required this.list, required this.index});

  @override
  _Edit_CrainState createState() => new _Edit_CrainState();
}

class _Edit_CrainState extends State<Edit_Crain> {
  TextEditingController Owner_name = TextEditingController();
  TextEditingController Crain_details = TextEditingController();


  void UpdateData() {
    var url = "http://$ip/MySampleApp/ORBVA/Work_shop/Edit_crain.php";
    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['id'],
      'Owner_name': Owner_name.text,
      'Crain_details': Crain_details.text,

    });
  }

  @override
  void initState() {
    //controllername= new TextEditingController(text: widget.list[widget.index]['name'] );
    Owner_name =
        TextEditingController(text: widget.list[widget.index]['Owner_name']);
    Crain_details = TextEditingController(text: widget.list[widget.index]['Crain_details']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
            new Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: new TextFormField(
                    controller: Owner_name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter Owner_name";
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
                        hintText: "Enter Owner_name",
                        label: Text('Owner_name'),
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: new TextFormField(
                    textCapitalization: TextCapitalization.words,
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



                new Padding(
                  padding: const EdgeInsets.all(10.0),
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
                        Navigator.of(context).pushReplacement(new MaterialPageRoute(
                            builder: (BuildContext context) => Workshop_Dashboard(data_passing_workshop:null
                            )));
                      });

                    },
                    child: Text("Submit")),
                SizedBox(height: 20,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}