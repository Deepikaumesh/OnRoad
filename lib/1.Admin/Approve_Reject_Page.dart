import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/main.dart';
import 'package:http/http.dart' as http;


class Approve_Reject_Workshop extends StatefulWidget {
  final data_pass;

  const Approve_Reject_Workshop({required this.data_pass});

  @override
  _Approve_Reject_WorkshopState createState() =>
      _Approve_Reject_WorkshopState();
}

class _Approve_Reject_WorkshopState extends State<Approve_Reject_Workshop> {
  TextEditingController status = TextEditingController();

  @override
  void initState() {
    status = TextEditingController(text: widget.data_pass.status);

    super.initState();
  }

  var status_item = [
    // 'Pending',
    'Approved',
    'Rejected',
    'Pending'
  ];
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Approve or Reject Workshop",
          style: GoogleFonts.prompt(color: Colors.red.shade900),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              // color: Colors.red,
              height: 1000,
              // color: Colors.green,
            ),
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  //color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: AssetImage("assets/images/workshop1.jpg"),
                      fit: BoxFit.fill),
                  //Image.asset("assets/images/workshop.png"),
                ),
              ),
            ),
            Positioned(
              top: 270,
              left: 20,
              right: 20,
              child: Data_Box(widget.data_pass.name),
            ),
            Positioned(
              top: 340,
              left: 20,
              right: 20,
              child: Data_Box(widget.data_pass.email_id),
            ),
            Positioned(
              top: 410,
              left: 20,
              right: 20,
              child: Data_Box(widget.data_pass.contact_no),
            ),
            Positioned(
              top: 480,
              left: 20,
              right: 20,
              child: Data_Box(widget.data_pass.address),
            ),
            Positioned(
              top: 550,
              left: 20,
              right: 20,
              child: Data_Box(widget.data_pass.license_no),
            ),
            Positioned(
              top: 620,
              left: 20,
              right: 20,
              child: Form(
                key: _formkey,
                child: Row(
                  children: <Widget>[
                    new Expanded(
                        child: new TextFormField(
                      controller: status,
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
                          hintText: "Please select option",
                          label: Text('status'),
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    )),
                    new PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      onSelected: (String value1) {
                        status.text = value1;
                      },
                      itemBuilder: (BuildContext ctx) {
                        return status_item
                            .map<PopupMenuItem<String>>((String value1) {
                          return new PopupMenuItem(
                              child: new Text(value1), value: value1);
                        }).toList();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 700,
                left: 20,
                right: 20,
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width, 50)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.teal.shade900),
                  ),
                  onPressed: () {
                    setState(() {

                      UpdateData();
                      // Navigator.pushReplacement(
                      //     context, MaterialPageRoute(builder: (context) => Display_Workshops()));



                    });


                    Fluttertoast.showToast(
                        msg: 'status changed to ${status.text}',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        webPosition: 1,
                        backgroundColor: Colors.blueGrey);
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            Positioned(
              top: 770,
              left: 20,
              right: 20,
              child: widget.data_pass.status == 'Rejected'
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        //  side: BorderSide(width:3, color:Colors.brown,), //border width and color
                        elevation: 3,
                        shadowColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Colors.red.shade900,
                        // background (button) color
                        foregroundColor:
                            Colors.white, // foreground (text) color
                      ),
                      onPressed: () {
                        setState(() {
                          delrecord(widget.data_pass.id);
                          // Navigator.pushReplacement(
                          //     context, MaterialPageRoute(builder: (context) => Display_Workshops()));



                        });
                        Fluttertoast.showToast(
                            msg: 'Removed ${widget.data_pass.name}',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            webPosition: 1,
                            backgroundColor: Colors.blueGrey);

                      },
                      child: Text(
                        "Remove Workshop",
                        style: TextStyle(fontSize: 20),
                      ))
                  : SizedBox(
                      height: 1,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Data_Box(
    String data,
  ) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10),
      //  padding: EdgeInsets.all(7),
      child: Text(
        data,
        style: TextStyle(fontSize: 20),
      ),
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
    );
  }

  void UpdateData() {
    var url = "http://$ip/MySampleApp/ORBVA/Admin/Update_Workers.php";
    http.post(Uri.parse(url), body: {
      "id": widget.data_pass.id,
      "name": widget.data_pass.name,
      "contact_no": widget.data_pass.contact_no,
      "email_id": widget.data_pass.email_id,
      "location": widget.data_pass.location,
      "address": widget.data_pass.address,
      "license_no": widget.data_pass.license_no,
      'status': status.text,
    });
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //         builder: (BuildContext context) =>
    //             Display_Workshops()));

  }

  Future<void> delrecord(String id) async {
    String url = "http://$ip/MySampleApp/ORBVA/Admin/delete_workshop.php";
    var res = await http.post(Uri.parse(url), body: {
      "id": id,
    });
    var resoponse = jsonDecode(res.body);
    if (resoponse["success"] == "true") {
      // Navigator.push(context,MaterialPageRoute(builder: (context)=>Display_Workshops()));
      print(id);
    } else {
      print("some issue");
    }
    setState(() {
      //Display_Workshops();
    });
  }
}
