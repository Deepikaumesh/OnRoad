import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Carousel slider.dart';
import '../test/Admin_News_Registration.dart';
import '../test/New_News_Display.dart';
import 'Crain/View_crains.dart';
import 'Spare_Parts/View_Spare_Parts.dart';
import 'Worker/View_workers.dart';

class Workshop_data_Page extends StatefulWidget {
  const Workshop_data_Page({Key? key}) : super(key: key);

  @override
  _Workshop_data_PageState createState() => _Workshop_data_PageState();
}

class _Workshop_data_PageState extends State<Workshop_data_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
        Stack(
          children: [
            Container(
                color: Colors.cyan.shade50, height: 400), // Max stack size
            // Container(
            //   alignment: Alignment.topCenter,
            //   color: Colors.red,
            //   height: 150,),
            Positioned(
              top: 200,
              left: 30,
              right: 30,
              height: 200,
              child: Material(
                  elevation: 8.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    child: Image.asset(
                      "assets/images/workshop_dashboard.jpg",
                    ),
                    height: 200,
                    // color: Colors.red,
                  )),
            ),
          ],
        ), // Stack
        SizedBox(
          height: 40,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding:
                    EdgeInsets.only(left: 110, right: 110, top: 20, bottom: 20),
                shape: StadiumBorder(),
                backgroundColor: Colors.red.shade900),
            onPressed: () {
              // Get.to(View_Workers());
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => View_Workers()));
            },
            child: Text('View Workers')),

        SizedBox(
          height: 40,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding:
                    EdgeInsets.only(left: 110, right: 110, top: 20, bottom: 20),
                shape: StadiumBorder(),
                backgroundColor: Colors.red.shade900),
            onPressed: () {
              Get.to(View_Crains());
            },
            child: Text('View Crains')),

        SizedBox(
          height: 40,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding:
                    EdgeInsets.only(left: 110, right: 110, top: 20, bottom: 20),
                shape: StadiumBorder(),
                backgroundColor: Colors.red.shade900),
            onPressed: () {
              Get.to(View_Spare_Parts());
            },
            child: Text('View Spare Parts')),

        SizedBox(
          height: 40,
        ),
        Carousel_slider(),
        SizedBox(
          height: 40,
        ),
      ]) // Column
          ), //SingleChildScrollView
    );
  }
}
