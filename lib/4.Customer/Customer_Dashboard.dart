import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Main_Screen/Main_Screen.dart';

import 'Customer_splashscreen.dart';
import 'Drawer_Customer.dart';
import 'Find_Service_Page.dart';
import 'Find_Workshop_Page.dart';

class Customer_Dashboard extends StatefulWidget {
  //
  var data_passing_user;

  Customer_Dashboard({required this.data_passing_user});

  @override
  _Customer_DashboardState createState() => _Customer_DashboardState();
}

class _Customer_DashboardState extends State<Customer_Dashboard> {
  // void initState() {
  //   setState(() {
  //     email_text;
  //   });
  //
  //   super.initState();
  // }

  // var emai;
  //
  //
  //
  // Future getEmail() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     emai =preferences.getString('email');
  //   });
  // }

  // Future logout(BuildContext context) async {
  //   SharedPreferences service_preference = await SharedPreferences.getInstance();
  //   service_preference.clear();
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Main_screen()));
  // }

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
                    sharedpreferences.remove('user_email');
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
        backgroundColor: Colors.cyan.shade300,
        //  backgroundColor:  Color(0xF5951B),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Text('Welcome,',style: GoogleFonts.hind(fontSize: 15),),

          Text(
            "Customer",
            style: GoogleFonts.hind(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Customer_key == null ? SizedBox(height: 1,) :
          Text('${Customer_key}', style: GoogleFonts.hind(fontSize: 15)),
        ]),
      ),
      drawer: Drawer(
        child: CustomerDrawer(),
      ),
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
                              Customer_Workshop_searchbar()));
                },
                child: Workshop__Container(),
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
                              Customer_Service_searchbar()));
                },
                child: Service__Container(),
              ),
            ),



            // Text('welcome${Customer_key}'),
            // MaterialButton(
            //     color: Colors.lightBlueAccent,
            //     child: Text('remove credentials user'),
            //     onPressed: () async {
            //       final SharedPreferences sharedpreferences =
            //           await SharedPreferences.getInstance();
            //       sharedpreferences.remove('user_email');
            //       Get.to(Main_screen());
            //     })
          ],
        ),
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
                  // Get.to(Display_Workshops());
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>Customer_Workshop_searchbar ()));
                },
                child: Text(
                  "Find Workshop",
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
  Service__Container() {
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
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>Customer_Service_searchbar ()));
                },
                child: Text(
                  "Find Service",
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
