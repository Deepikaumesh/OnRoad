import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Carousel slider.dart';
import '../Main_Screen/Main_Screen.dart';
import '../main.dart';
import 'Display_Request_Page_Service.dart';
import 'Display_Request_Page_Workshop.dart';
import 'Drawer_Customer.dart';
import 'Find_Service_Page.dart';
import 'Find_Workshop_Page.dart';


class Customer_Dash extends StatefulWidget {
  const Customer_Dash({Key? key}) : super(key: key);

  @override
  _Customer_DashState createState() => _Customer_DashState();
}

class _Customer_DashState extends State<Customer_Dash> {
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
                    sharedpreferences.remove('user_id');
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
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Customer",
            style: GoogleFonts.hind(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          cust_id == null
              ? SizedBox(
                  height: 1,
                )
              : Text('${cust_id}',
                  style: GoogleFonts.hind(fontSize: 15, color: Colors.pink)),
          // Text('${Customer_key}', style: GoogleFonts.hind(fontSize: 15)),

          email_text_customer == null
              ? SizedBox(
                  height: 1,
                )
              : Text('${email_text_customer}',
                  style: GoogleFonts.hind(fontSize: 15)),
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
                horizontal: 30,
                vertical: 40,
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
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      child: Image.asset(
                        "assets/images/request.png",
                        height: 80,
                        width: 80,
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    TextButton(
                      onPressed: () {
                        // Get.to(bottom_sht());
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              //Scrolling given for content in Container()
                              return SingleChildScrollView(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: Container(
                                    //Create a Column to display it's content
                                    padding: const EdgeInsets.all(20),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                    ),
                                    //Create a Column to display it's content
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10.0),
                                        // TextField for giving some Input
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            minimumSize:
                                                MaterialStateProperty.all(Size(
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                    50)),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.grey.shade500),
                                          ),
                                          onPressed: () {
                                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Display_Request_Page_workshop()));
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Display_Request_Page_workshop()));
                                          },
                                          child: Text(
                                            "Workshop",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        const SizedBox(height: 10.0),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            minimumSize:
                                                MaterialStateProperty.all(Size(
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                    50)),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.grey.shade500),
                                          ),
                                          onPressed: () {

                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                    context) =>
                                                        Display_Request_Page_Service()));


                                          },
                                          child: Text(
                                            "Service Center",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      child: Text(
                        "Send Request",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                )),

            SizedBox(height: 20,),
            Carousel_slider_customer(),

          ],
        ),
      ),
    );
  }

  Workshop__Container() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red.shade200, borderRadius: BorderRadius.circular(10)),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Customer_Workshop_searchbar()));
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
                  // Get.to(Display_Workshops());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Customer_Service_searchbar()));
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
class Carousel_slider_customer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        //1st Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            border: Border.all(width: 0.5,color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage("assets/images/crain.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Container(
        //   margin: EdgeInsets.all(6.0),
        //   decoration: BoxDecoration(
        //     border: Border.all(width: 2,color: Colors.red),
        //     borderRadius: BorderRadius.circular(8.0),
        //     image: DecorationImage(
        //       image: AssetImage("assets/images/mech4.jpg"),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            border: Border.all(width: 0.5,color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage("assets/images/parts2.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            border: Border.all(width: 0.5,color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage("assets/images/spare.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            border: Border.all(width: 0.5,color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage("assets/images/workshop1.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],

      //Slider Container properties
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 100),
        viewportFraction: 0.8,
      ),
    );
  }

}