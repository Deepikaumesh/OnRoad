import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Main_Screen/Main_Screen.dart';
import '../main.dart';
import 'Display_Customers.dart';
import 'Display_Service.dart';
import 'Display_Workshops.dart';
import 'Drawer_Admin.dart';
import 'View_Customer_Complaints.dart';

class Admin_Dash extends StatefulWidget {
  const Admin_Dash({Key? key}) : super(key: key);

  @override
  _Admin_DashState createState() => _Admin_DashState();
}

class _Admin_DashState extends State<Admin_Dash> {
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
                    sharedpreferences.remove('admin_id');
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
          Text(
            "Admin",
            style: GoogleFonts.hind(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          admin_id == null
              ? SizedBox(
                  height: 1,
                )
              : Text('${admin_id}', style: GoogleFonts.hind(fontSize: 15)),
          email_text_admin == null
              ? SizedBox(
                  height: 1,
                )
              : Text('${email_text_admin}',
                  style: GoogleFonts.hind(fontSize: 15)),
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
                  horizontal: 30,
                  vertical: 40,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Display_Service()));
                  },
                  child: Service_Center__Container(),
                ),
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
                                Display_Customers()));
                  },
                  child: Customer__Container(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,vertical: 40,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Customer_Complaints()));
                  },
                  child: Complaint__Container(),
                ),
              ),
            ]),
      ),
    );
  }

  Service_Center__Container() {
    return Container(
      decoration: BoxDecoration(
          //color: Color(0xfffad4d4),
          color: Colors.blueGrey.shade500,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Display_Service()));
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
          color: Colors.red.shade200,
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
                  // Get.to(Display_Workshops());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Display_Workshops()));
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

  Customer__Container() {
    return Container(
      decoration: BoxDecoration(
          //color: Color(0xfffad4d4),
          color: Colors.cyan.shade300,
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
                'assets/images/user (2).png',
                height: 75.0,
                width: 75.0,
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(Display_Workshops());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Display_Customers()));
                },
                child: Text(
                  "View Customer",
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
  Complaint__Container() {
    return Container(
      decoration: BoxDecoration(
        //color: Color(0xfffad4d4),
          color: Colors.black26,
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
                'assets/images/complain.png',
                height: 75.0,
                width: 75.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Customer_Complaints()));
                },
                child: Text(
                  "Complaints",
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
}
