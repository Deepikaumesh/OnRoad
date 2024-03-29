import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import 'Approve_Reject_Page.dart';

//Creating a class user to store the data;
class workers_model {
  final String id;
  final String name;
  final String contact_no;
  final String email_id;
  final String location;
  final String address;
  final String license_no;
  final String status;

  workers_model({
    required this.id,
    required this.name,
    required this.contact_no,
    required this.email_id,
    required this.location,
    required this.address,
    required this.license_no,
    required this.status,
  });
}

class Display_Workshops extends StatefulWidget {
  @override
  _Display_WorkshopsState createState() => _Display_WorkshopsState();
}

class _Display_WorkshopsState extends State<Display_Workshops> {

  var load_status_first;



  //Applying get request.
  Future<List<workers_model>> getRequest() async {
    //replace your restFull API here.

    final response = await http.get(
        Uri.parse("http://$ip/MySampleApp/ORBVA/Admin/Display_workshops.php"));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<workers_model> users = [];
    for (var singleUser in responseData) {
      workers_model user = workers_model(
        // productqty: singleUser["productqty"].toString(),

        name: singleUser["name"].toString(),
        id: singleUser["id"].toString(),
        contact_no: singleUser["contact_no"].toString(),
        email_id: singleUser["email_id"].toString(),
        location: singleUser["location"].toString(),
        address: singleUser["address"].toString(),
        license_no: singleUser["license_no"].toString(),
        status: singleUser["status"].toString(),
      );

      //Adding user to the list.
      users.add(user);

    }


    return users;
  }


@override
void initState() {
    // TODO: implement initState

  load_status_first;

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(Icons.arrow_back)),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Workshop",
          style: GoogleFonts.prompt(fontSize: 22, color: Colors.brown.shade900),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            FutureBuilder(
              future: getRequest(),
              builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                if (snapshot.data == null || snapshot.data == false) {
                  return Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: Colors.red.shade900,
                            strokeWidth: 5,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Loading...",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Flexible(
                    child: Column(
                      children: [
                        Flexible(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (ctx, index) {

                                load_status_first = snapshot.data[index].status;

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 1),
                                        child: Card(
                                          color: Colors.brown.shade100,
                                          //shadowColor: Colors.red,
                                          elevation: 8,
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),

                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Approve_Reject_Workshop(
                                                              data_pass:
                                                                  snapshot.data[
                                                                      index])));
                                            },
                                            child: Container(
                                              // color: Colors.red,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  10,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.2,
                                              //padding: EdgeInsets.fromLTRB(10, 15, 50, 15),
                                              child:
                                              ListTile(
                                                // minVerticalPadding:20,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                title: Row(
                                                  children: [
                                                    Text("Name:"),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      snapshot.data[index].name,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.lora(
                                                          fontSize: 15,
                                                          color: Colors
                                                              .brown.shade900),
                                                    ),
                                                    //
                                                    // snapshot.data[index].status == 'Rejected' ?
                                                    // // Text("hai")
                                                    // Icon(Icons.delete)
                                                    //     :SizedBox(height: 1,),
                                                  ],
                                                ),

                                                subtitle: RichText(
                                                  text: snapshot.data[index]
                                                              .status ==
                                                          'Pending'
                                                      ? TextSpan(
                                                          text: 'Pending',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .orange
                                                                  .shade600))
                                                      : snapshot.data[index]
                                                                  .status ==
                                                              'Rejected'
                                                          ? TextSpan(
                                                              text: 'Rejected',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red
                                                                      .shade900))
                                                          : TextSpan(
                                                              text: snapshot
                                                                  .data[index]
                                                                  .status,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .green
                                                                      .shade900)),
                                                ),

                                                trailing: InkWell(
                                                    onTap: () {
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  Approve_Reject_Workshop(
                                                                      data_pass:
                                                                          snapshot
                                                                              .data[index])));
                                                      // Navigator.pushReplacement(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //         builder: (BuildContext context) =>
                                                      //             Approve_Reject_Workshop(
                                                      //                 data_pass:
                                                      //                     snapshot
                                                      //                         .data[index])));
                                                    },
                                                    child: Icon(Icons
                                                        .arrow_forward_ios_rounded)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
