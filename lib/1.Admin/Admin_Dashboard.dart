import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Main_Screen/Main_Screen.dart';
import 'Admin_splashscreen.dart';
import 'Display_Workshops.dart';
import 'Drawer_Admin.dart';

class Admin_Dashboard extends StatefulWidget {
  //
  var data_passing_admin;

  Admin_Dashboard({required this.data_passing_admin});

  @override
  _Admin_DashboardState createState() => _Admin_DashboardState();
}

class _Admin_DashboardState extends State<Admin_Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              IconButton(
                  onPressed: () async {
                    final SharedPreferences sharedpreferences =
                        await SharedPreferences.getInstance();
                    sharedpreferences.remove('admin_email');
                    Get.to(Main_screen());
                  },
                  icon: Icon(Icons.exit_to_app)),
              Text("Logout")
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
        toolbarHeight: 150,
        elevation: 0,
        backgroundColor: Colors.brown.shade200,
        //  backgroundColor:  Color(0xF5951B),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Text('Welcome,',style: GoogleFonts.hind(fontSize: 15),),

          Text(
            "Admin",
            style: GoogleFonts.hind(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text('${Admin_key}', style: GoogleFonts.hind(fontSize: 15)),
        ]),
      ),
      drawer: Drawer(child: AdminDrawer()),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Display_Workshops()));
                  },
                  child: Workshop__Container(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30, vertical: 40,
                ),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) =>
                    //             Workshop_data_Page()));
                  },
                  child: Service_Center__Container(),
                ),
              ),
            ]),
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     // Center(
        //     //   child: emai == null ? Text('') : Text(em)),
        //     SizedBox(
        //       height: 20,
        //     ),
        //     // Text("hai"+widget.data_passing_service.toString()),
        //     Text('welcome${Admin_key}'),
        //     MaterialButton(
        //         color: Colors.lightBlueAccent,
        //         child: Text('remove credentials admin'),
        //         onPressed: () async {
        //           final SharedPreferences sharedpreferences =
        //               await SharedPreferences.getInstance();
        //           sharedpreferences.remove('admin_email');
        //           Get.to(Main_screen());
        //         })
        //   ],
        // ),
      ),
    );
  }

  Service_Center__Container() {
    return Container(
      decoration: BoxDecoration(
          //color: Color(0xfffad4d4),
          color:  Colors.blueGrey.shade500,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      height: 100,
      width: 340,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/customer-service.png',
                height: 75.0,
                width: 75.0,
              ),
              GestureDetector(
                onTap: () {
                    // Get.to(Display_Workshops());
                },
                child: Text(
                  "Service Center",
                  style: GoogleFonts.quicksand(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  Workshop__Container() {
    return Container(
      decoration: BoxDecoration(
        //color: Color(0xfffad4d4),
          color:  Colors.red.shade200,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      height: 100,
      width: 340,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/workshop.png',
                height: 75.0,
                width: 75.0,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(Display_Workshops());
                },
                child: Text(
                  "Workshop",
                  style: GoogleFonts.quicksand(
                      fontSize: 25,
                      color: Colors.brown.shade600,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
