import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Carousel slider.dart';
import 'Crain/View_crains.dart';
import 'Edit_Workshop_Page.dart';
import 'Spare_Parts/View_Spare_Parts.dart';
import 'Worker/View_workers.dart';

class Workshop_Update_Page extends StatefulWidget {
  List list;
  int index;

  Workshop_Update_Page({required this.index, required this.list});

  @override
  _Workshop_Update_PageState createState() => _Workshop_Update_PageState();
}

class _Workshop_Update_PageState extends State<Workshop_Update_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
        Stack(
          children: [
            Container(
                color: Colors.grey.shade400, height: 400), // Max stack size
            // Container(
            //   alignment: Alignment.topCenter,
            //   color: Colors.red,
            //   height: 150,),
            Positioned(
              top: 180,
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

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              Row(
                children: [
                  Icon(Icons.account_box),
                  SizedBox(
                    width: 5,
                  ),
                  work(
                    widget.list[widget.index]['name'],
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Icon(Icons.email),
                  SizedBox(
                    width: 5,
                  ),
                  work(
                    widget.list[widget.index]['email_id'],
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Icon(Icons.phone),
                  SizedBox(
                    width: 5,
                  ),
                  work(
                    widget.list[widget.index]['contact_no'],
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Icon(Icons.note),
                  SizedBox(
                    width: 5,
                  ),
                  work(
                    widget.list[widget.index]['address'],
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Icon(Icons.adjust),
                  SizedBox(
                    width: 5,
                  ),
                  work(
                    widget.list[widget.index]['license_no'],
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.green),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                          textStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 20))),
                      onPressed: () {
                        Navigator.of(context).push(
                          new MaterialPageRoute(
                            builder: (BuildContext context) =>
                            new Edit_Workshop_Page(
                              list: widget.list,
                              index: widget.index,
                            ),
                          ),
                       );
                      },
                      child: Text("Edit")),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.red.shade700),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                          textStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 20))),
                      onPressed: () {
                       // confirm();
                      },
                      child: Text("Delete")),
                ],
              ),
            ],
          ),
        ),
      ]) // Column
          ), //SingleChildScrollView
    );
  }

  work(String txt) {
    return Text(txt,
        style: TextStyle(fontSize: 18, color: Colors.blueGrey.shade600));
  }
}
