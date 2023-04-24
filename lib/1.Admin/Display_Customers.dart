import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import 'Approve_Reject_Page.dart';
import 'Service_Approve_Reject_Page.dart';

//Creating a class user to store the data;
class Customer_model {
  final String id;
  final String username;
  final String email;
  final String phone;
  final String password;

  Customer_model({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
  });
}

class Display_Customers extends StatefulWidget {
  @override
  _Display_CustomersState createState() => _Display_CustomersState();
}

class _Display_CustomersState extends State<Display_Customers> {
  //Applying get request.
  Future<List<Customer_model>> getRequest() async {
    //replace your restFull API here.

    final response = await http.get(
        Uri.parse("http://$ip/MySampleApp/ORBVA/Admin/Display_Customers.php"));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<Customer_model> users = [];
    for (var singleUser in responseData) {
      Customer_model user = Customer_model(
        // productqty: singleUser["productqty"].toString(),

        id: singleUser["id"].toString(),
        username: singleUser["username"].toString(),
        email: singleUser["email"].toString(),
        phone: singleUser["phone"].toString(),
        password: singleUser["password"].toString(),
      );

      //Adding user to the list.
      users.add(user);
    }
    return users;
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
          "Customer",
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
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 1),
                                        child: Card(
                                          color: Colors.blueGrey.shade100,
                                          //shadowColor: Colors.red,
                                          elevation: 8,
                                          clipBehavior: Clip.antiAlias,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),

                                          child: GestureDetector(
                                            onTap: () {
                                              // Navigator.pushReplacement(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             Approve_Reject_Service(
                                              //                 data_pass:
                                              //                     snapshot.data[
                                              //                         index])));
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
                                              child: ListTile(
                                                // minVerticalPadding:20,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                title: Text(
                                                  snapshot.data[index].username,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.lora(
                                                      fontSize: 15,
                                                      color: Colors
                                                          .brown.shade900),
                                                ),

                                                subtitle: Text(
                                                    snapshot.data[index].email),

                                                // trailing: InkWell(
                                                //     onTap: () {
                                                //       // Navigator.pushReplacement(
                                                //       //     context,
                                                //       //     MaterialPageRoute(
                                                //       //         builder: (BuildContext context) =>
                                                //       //             Approve_Reject_Service(
                                                //       //                 data_pass:
                                                //       //                     snapshot
                                                //       //                         .data[index])));
                                                //     },
                                                //     child: Icon(Icons
                                                //         .arrow_forward_ios_rounded),
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
