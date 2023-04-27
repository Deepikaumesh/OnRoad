import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';
import '../Workshop_Dash.dart';
import '../Workshop_dashboard.dart';
import 'Edit_Spare_Parts.dart';

class Spare_Parts_detail extends StatefulWidget {
  List list;
  int index;

  Spare_Parts_detail({required this.index, required this.list});

  @override
  _Spare_Parts_detailState createState() => _Spare_Parts_detailState();
}

class _Spare_Parts_detailState extends State<Spare_Parts_detail> {
  void deleteData() {
    //var url="http://10.0.2.2/my_store/deleteData.php";
    var url = "http://$ip/MySampleApp/ORBVA/Work_shop/delete_spare_parts.php";
    http.post(Uri.parse(url), body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
          "Are You sure want to delete '${widget.list[widget.index]['parts_name']}'"),
      actions: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red.shade700),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 8, vertical: 8)),
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15))),
          child: Text(
            "OK DELETE!",
            style: TextStyle(color: Colors.white),
          ),
          //  color: Colors.red,
          onPressed: () {
            setState(() {});
            deleteData();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Workshop_Dash(

                        )));
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //   builder: (BuildContext context) => View_Workers(),
            // ));
          },
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green.shade700),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 8, vertical: 8)),
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15))),
          child: Text("CANCEL", style: TextStyle(color: Colors.white)),
          //  color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) => alertDialog,
    );

    // showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(title: new Text("${widget.list[widget.index]['name']}"),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan.shade50,
        // centerTitle: true,
        // title: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text(
        //       "${widget.list[widget.index]['Owner_name']}",
        //       style: TextStyle(color: Colors.orange.shade900, fontSize: 17),
        //     ),
        //     Text(
        //       "${widget.list[widget.index]['email']}",
        //       style: TextStyle(color: Colors.indigo, fontSize: 12),
        //     ),
        //   ],
        // ),

        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.delete),
        //     onPressed: () {
        //       confirm();
        //     },
        //   ),
        //   IconButton(
        //     icon: Icon(Icons.edit),
        //     onPressed: () {
        //       Navigator.of(context).push(
        //         new MaterialPageRoute(
        //           builder: (BuildContext context) =>  Edit_Worker(
        //             list: widget.list,
        //             index: widget.index,
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ],
      ),

      body: SingleChildScrollView(
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(color: Colors.cyan.shade50, height: 250),
                // Max stack size
                Positioned(
                  top: 10,
                  left: 30,
                  right: 30,
                  height: 200,
                  child: Material(
                      // elevation: 8.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        child: Image.asset(
                          "assets/images/spare_parts.png",
                        ),
                        height: 200,
                        color: Colors.cyan.shade50,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),

            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text(
                'OwnerName :',
                style: GoogleFonts.prompt(fontSize: 17),
              ),
              Text(
                widget.list[widget.index]['parts_name'],
                style: GoogleFonts.prompt(fontSize: 17),
              ),
              SizedBox(
                height: 40,
              ),
            ]),
            SizedBox(
              height: 20,
            ),

            Text("Spare Parts Details",
                style: GoogleFonts.prompt(fontSize: 20)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                height: MediaQuery.of(context).size.height / 2.2,
                width: MediaQuery.of(context).size.height / 2.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: Colors.pink),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    child: Text(
                      widget.list[widget.index]['parts_details'],
                      style: GoogleFonts.prompt(fontSize: 17),
                      textAlign: TextAlign.justify,
                    )),
              ),
            ),

            // Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //   new Text(widget.list[widget.index]['Owner_name'],
            //       style: GoogleFonts.prompt(fontSize: 17)),
            //   SizedBox(
            //     height: 40,
            //   ),
            //   new Text(widget.list[widget.index]['Crain_details'],
            //       style: GoogleFonts.prompt(fontSize: 17)),
            //   SizedBox(
            //     height: 40,
            //   ),
            //
            // ])

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
                              new Edit_Spare_Parts(
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
                      confirm();
                    },
                    child: Text("Delete")),
              ],
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ), // Column
      ),
    );
  }
}
