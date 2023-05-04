import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/4.Customer/Customer_Dash.dart';

import '../main.dart';


import 'package:http/http.dart' as http;

class CustomerDrawer extends StatefulWidget {

  @override
  State<CustomerDrawer> createState() => _CustomerDrawerState();
}

class _CustomerDrawerState extends State<CustomerDrawer> {
  TextEditingController complaint = TextEditingController();
  var complaint_item = [
    'Poor Service',
    'Average Service',

  ];
  @override
  void initState() {
    complaint = TextEditingController();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70.0,
                  backgroundImage: AssetImage(
                    "assets/images/user_login.png",
                  ),
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Hope",
                    style: GoogleFonts.aclonica(
                      color: Colors.pink,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        //Now let's Add the button for the Menu
        //and let's copy that and modify it

        ListTile(
          onTap: () {},
          trailing: Icon(
            Icons.quick_contacts_mail_sharp,
            color: Colors.blueGrey.shade900,
          ),
          leading: TextButton(
            onPressed: () {
              showModalBottomSheet(
                elevation: 10,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight:Radius.circular(20),
                     topLeft: Radius.circular(20))),
                  context: context,
                  builder: (BuildContext context) {
                return Container(
                  height: 500,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          child: Row(
                            children: <Widget>[
                              new Expanded(
                                  child: new TextFormField(
                                    controller: complaint,
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
                                  complaint.text = value;
                                },
                                itemBuilder: (BuildContext context) {
                                  return complaint_item
                                      .map<PopupMenuItem<String>>((String value) {
                                    return new PopupMenuItem(
                                        child: new Text(value), value: value);
                                  }).toList();
                                },
                              ),
                            ],
                          ),
                        ),
                       ElevatedButton(
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.teal, // background (button) color
                             foregroundColor: Colors.white,
                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                             shadowColor: Colors.blueGrey,
                             elevation: 2,
                             minimumSize: Size(300, 50),// foreground (text) color
                           ),
                           onPressed: (){

                             setState(() {
                               Send();

                             });
                             Navigator.pushReplacement(
                                 context,
                                 MaterialPageRoute(
                                     builder: (BuildContext
                                     context) =>
                                         Customer_Dash()));

                           }, child: Text("Send",style: TextStyle(fontSize: 20),))
                      ],
                    ),
                  ),
                );
                  });

            },
            child: Text("Complaint Registration",
                style: GoogleFonts.prompt(
                  fontSize: 15,
                )),
          ),
        ),
        ListTile(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             Hope_Admin_event_Display_edit_page()));
          },
          leading: Icon(
            Icons.mode_edit,
            color: Colors.blueGrey.shade900,
          ),
          title: Text(
            "Edit Events",
            style: GoogleFonts.prompt(fontSize: 15),
          ),
        ),
      ]),
    );
  }

  Future Send() async {
    var APIURL =
        "http://$ip/MySampleApp/ORBVA/Customer/send_complaints.php";

    Map mapeddate = {
      'customer_id': cust_id,
      'complaint': complaint.text,
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL), body: mapeddate);

    //getting response from php code, here
    var data = jsonDecode(reponse.body);
    var responseMessage = data["message"];
    var responseError = data["error"];
    print("DATA: ${data}");
    if (responseError) {
      Fluttertoast.showToast(
          msg: 'error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey);
    } else {
      Fluttertoast.showToast(
          msg: 'Complaint send',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey);
    }
  }
}
