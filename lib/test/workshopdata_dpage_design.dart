import 'dart:io';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Workshop_data_Page extends StatefulWidget {
  const Workshop_data_Page({Key? key}) : super(key: key);

  @override
  State<Workshop_data_Page> createState() => _Workshop_data_PageState();
}

class _Workshop_data_PageState extends State<Workshop_data_Page> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.cyan.shade50,
                )),
            Expanded(child: Container(color: Colors.grey.shade100)),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 150),
          width: MediaQuery.of(context).size.width / 1.3,
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
            //border: Border.all(width: 0.5,color: Colors.pink),
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage("assets/images/workshop_dashboard.jpg"),
                  fit: BoxFit.cover)),
        ),
        Column(
          children: [
            SizedBox(
              height: 450,
            ),
            Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                            left: 110, right: 110, top: 20, bottom: 20),
                        shape: StadiumBorder(),
                        backgroundColor: Colors.red),
                    onPressed: () {
                    //  Get.to(View_workers());
                    },
                    child: Text('View Workers'))
            ),
            SizedBox(
              height: 40,
            ),
            Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                            left: 110, right: 110, top: 20, bottom: 20),
                        shape: StadiumBorder(),
                        backgroundColor: Colors.red),
                    onPressed: () {},
                    child: Text('View Crains'))),
            SizedBox(
              height: 40,
            ),
            Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(
                            left: 110, right: 110, top: 20, bottom: 20),
                        shape: StadiumBorder(),
                        backgroundColor: Colors.red),
                    onPressed: () {},
                    child: Text('View Spare Parts'))),
          ],
        )
      ],
    );
  }
}
//
