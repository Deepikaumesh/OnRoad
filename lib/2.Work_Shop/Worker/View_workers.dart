// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:untitled/2.Work_Shop/workers_detail.dart';
// import 'package:untitled/main.dart';
//
//
//
//
// //Creating a class user to store the data;
// class worker_data_model {
//   final String id;
//   final String mech_name;
//   final String place;
//   final String post;
//   final String pin;
//   final String district;
//   final String email;
//   final String contact_no;
//   final String specification;
//   final String available;
//
//   worker_data_model({
//     required this.id,
//     required this.mech_name,
//     required this.place,
//     required this.post,
//     required this.pin,
//     required this.district,
//     required this.email,
//     required this.contact_no,
//     required this.specification,
//     required this. available,
//   });
// }
//
// class View_Workers extends StatefulWidget {
//   @override
//   _View_WorkersState createState() =>
//       _View_WorkersState();
// }
//
// class _View_WorkersState extends State<View_Workers> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         title: Text(
//           "Workers",
//           style: GoogleFonts.prompt(fontSize: 22),
//         ),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             FutureBuilder(
//               future: Display_Data(),
//               builder: (BuildContext ctx, AsyncSnapshot snapshot) {
//                 if (snapshot.data == null || snapshot.data == false) {
//                   return Container(
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CircularProgressIndicator(
//                             color: Colors.red.shade900,
//                             strokeWidth: 5,
//                           ),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           Text(
//                             "Loading...",
//                             style: TextStyle(),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 } else {
//                   return Flexible(
//                     child: Column(
//                       children: [
//                         Flexible(
//                           child: ListView.builder(
//                               shrinkWrap: true,
//                               itemCount: snapshot.data.length,
//                               itemBuilder: (ctx, index) {
//                                 return SingleChildScrollView(
//                                   scrollDirection: Axis.horizontal,
//                                   child: Column(
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 10, vertical: 2),
//                                         child: Card(
//                                           color: Colors.red.shade100,
//                                           elevation: 8,
//                                           clipBehavior: Clip.antiAlias,
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                             BorderRadius.circular(10),
//                                           ),
//                                           child: Container(
//                                               height: MediaQuery.of(context)
//                                                   .size
//                                                   .height /
//                                                   14,
//                                               width: MediaQuery.of(context)
//                                                   .size
//                                                   .width /
//                                                   1.2,
//                                               child: ListTile(
//
//                                                 leading:  Text(snapshot.data[index].mech_name,style: TextStyle(color: Colors.red.shade900),),
//                                                 trailing:  IconButton(
//                                                     onPressed: () {
//                                                       Navigator.push(
//                                                           context,
//                                                           MaterialPageRoute(
//                                                               builder:
//                                                                   (context) =>
//                                                                       Workers_detail(snapshot.data[index])));
//                                                     },
//                                                     icon: Icon(Icons
//                                                         .arrow_forward_ios_rounded,color: Colors.cyan,))
//                                               )),
//                                         ),
//                                       ),
//                                       SizedBox(height: 10,)
//                                  ], ),
//                                 );
//                               }),
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<List<worker_data_model>> Display_Data() async {
//     //replace your restFull API here.
//
//     final response = await http.get(Uri.parse(
//         "http://$ip/MySampleApp/ORBVA/Work_shop/workers_display.php"));
//
//     var responseData = json.decode(response.body);
//
//     //Creating a list to store input data;
//     List<worker_data_model> users = [];
//     for (var singleUser in responseData) {
//       worker_data_model user = worker_data_model(
//
//         mech_name: singleUser["mech_name"].toString(),
//         place: singleUser["place"].toString(),
//         post: singleUser["post"].toString(),
//         id: singleUser["id"].toString(),
//         district: singleUser["district"].toString(),
//         pin: singleUser["pin"].toString(),
//         email:singleUser["email"].toString(),
//         contact_no:singleUser["contact_no"].toString(),
//         specification:singleUser["specification"].toString(),
//         available:singleUser["available"].toString(),
//       );
//
//       //Adding user to the list.
//       users.add(user);
//     }
//     return users;
//   }
//
//   Future<void> delrecord(String id) async {
//     String url =
//
//         "http://$ip/MySampleApp/ORBVA/Work_shop/workers_display.php";
//
//     var res = await http.post(Uri.parse(url), body: {
//       "id": id,
//     });
//     var resoponse = jsonDecode(res.body);
//     if (resoponse["success"] == "true") {
//       print(id);
//       setState(() {
//         Display_Data();
//       });
//       //
//
//     } else {
//       print("some issue");
//     }
//   }
// }
//
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/2.Work_Shop/Worker/workers_detail.dart';

import '../../main.dart';


class View_Workers extends StatefulWidget {
  @override
  _View_WorkersState createState() =>
       _View_WorkersState();
}

class _View_WorkersState extends State<View_Workers> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse(
        "http://$ip/MySampleApp/ORBVA/Work_shop/workers_display.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Workers",
          style: GoogleFonts.prompt(fontSize: 22,color: Colors.blueGrey),
        ),
      ),
      body:  FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ?  ItemList(
            // list: snapshot.data,
            list: snapshot.data ?? [],
          )
              :  Center(
            child:  CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return  Container(
          padding: const EdgeInsets.all(10.0),
          child:  GestureDetector(

            onTap: () => Navigator.of(context).push( MaterialPageRoute(
                builder: (BuildContext context) =>  Workers_detail(
                  list: list,
                  index: i,
                ))),
            child:  Card(
              color: Colors.red.shade100,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListTile(
                minLeadingWidth: 5,
                // contentPadding: EdgeInsets.all(5.0),
                leading: Icon(
                  Icons.circle,
                  size: 10,
                  color: Colors.red.shade900,
                ),

                title: Text(
                  (list[i]['mech_name']),
                  style: GoogleFonts.lora(
                      fontSize: 13, color: Colors.pink.shade700),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.cyan,),
              ),
            ),
          ),
        );
      },
    );
  }
}


