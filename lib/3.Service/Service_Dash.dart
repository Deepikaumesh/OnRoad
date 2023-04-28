import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Main_Screen/Main_Screen.dart';
import '../main.dart';
import 'Drawer_Service.dart';
import 'create_service.dart';
import 'display_Edit_Profile_Page.dart';

class Service_dash extends StatefulWidget {
  const Service_dash({Key? key}) : super(key: key);

  @override
  _Service_dashState createState() => _Service_dashState();
}

class _Service_dashState extends State<Service_dash> {
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
                    sharedpreferences.remove('service_email');
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
        toolbarHeight: 180,
        elevation: 0,
        backgroundColor: Colors.blueGrey.shade500,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Text('Welcome,',style: GoogleFonts.hind(fontSize: 15),),

          Text(
            "Onroad Service",
            style: GoogleFonts.hind(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          email_text_service == null ? SizedBox(height: 1,):

          Text('${email_text_service}', style: GoogleFonts.hind(fontSize: 15)),

          service_id == null ? SizedBox(height: 1,):

          Text('${service_id}', style: GoogleFonts.hind(fontSize: 15)),
        ]),
      ),
    drawer: Drawer(
         child: ServiceDrawer(),
       ),
    body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Create_service()));
                },
                child: Create_Service_Container(),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: Update_Service()),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: Request_container()),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: feedback_container()),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: Rating()),
          ],
        ),
      ),
    );
  }

  Create_Service_Container() {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xfffad4d4),
          // color: Colors.blueGrey.shade100,
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
                'assets/images/service.png',
                height: 75.0,
                width: 75.0,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(Create_service());
                },
                child: Text(
                  "Add Service",
                  style: GoogleFonts.quicksand(
                      fontSize: 25,
                      color: Colors.teal.shade900,
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

Update_Service() {
  return GestureDetector(
    onTap: () {
      Get.to(Display_Edit_Profile_Page());
    },
    child: Container(
      decoration: BoxDecoration(
          //   color: Color(0xfffad4d4),
          color: Colors.blueGrey.shade100,
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
                'assets/images/create_service.png',
                height: 75.0,
                width: 75.0,
              ),
              Text(
                "Edit Profile",
                style: GoogleFonts.quicksand(
                    fontSize: 25,
                    color: Colors.teal.shade900,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    ),
  );
}

feedback_container() {
  return Container(
    decoration: BoxDecoration(
        // color: Color(0xfffad4d5),
        color: Colors.orangeAccent.shade100,
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
              'assets/images/feedback.png',
              height: 75.0,
              width: 75.0,
            ),
            GestureDetector(
              onTap: () {
                //  Get.to(Feedback_service());
              },
              child: Text(
                "Customer Feedback",
                style: GoogleFonts.quicksand(
                    fontSize: 23,
                    color: Colors.teal.shade900,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Request_container() {
  return Container(
    decoration: BoxDecoration(
        // color: Color(0xfffad4d5),
        color: Colors.red.shade100,
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
              'assets/images/request.png',
              height: 75.0,
              width: 75.0,
            ),
            GestureDetector(
              onTap: () {
                //  Get.to(Feedback_service());
              },
              child: Text(
                "Customer Request",
                style: GoogleFonts.quicksand(
                    fontSize: 23,
                    color: Colors.teal.shade900,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Rating() {
  return Container(
    decoration: BoxDecoration(
        // color: Color(0xfffad4d5),
        color: Colors.green.shade200,
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
              'assets/images/rating_workshop.png',
              height: 75.0,
              width: 75.0,
            ),
            GestureDetector(
              onTap: () {
                //  Get.to(Feedback_service());
              },
              child: Text(
                "Customer Rating",
                style: GoogleFonts.quicksand(
                    fontSize: 23,
                    color: Colors.teal.shade900,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ],
    ),
    );
  }

