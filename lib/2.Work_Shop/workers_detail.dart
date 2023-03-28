
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/Main_Screen/Main_Screen.dart';

import 'Edit_worker.dart';

class Workers_detail extends StatefulWidget {
  List list;
  int index;

  Workers_detail({required this.index, required this.list});

  @override
  _Workers_detailState createState() => new _Workers_detailState();
}

class _Workers_detailState extends State<Workers_detail> {
  void deleteData() {
    //var url="http://10.0.2.2/my_store/deleteData.php";
    var url =
        "https://jcizone19.in/._A_nileswaram/directoryapp/Nileswaram.com/Delete/News_Delete.php";
    http.post(Uri.parse(url), body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Are You sure want to delete '${widget.list[widget.index]['name']}'"),
      actions: <Widget>[
        new ElevatedButton(
          child: new Text(
            "OK DELETE!",
            style: new TextStyle(color: Colors.black),
          ),
          //  color: Colors.red,
          onPressed: () {
            deleteData();
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => Main_screen(),
            ));
          },
        ),
        new ElevatedButton(
          child: new Text("CANCEL", style: new TextStyle(color: Colors.black)),
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
    return new Scaffold(
      // appBar: new AppBar(title: new Text("${widget.list[widget.index]['name']}"),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan.shade50,
        // centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.list[widget.index]['mech_name']}",
              style: TextStyle(color: Colors.orange.shade900, fontSize: 17),
            ),
            Text(
              "${widget.list[widget.index]['email']}",
              style: TextStyle(color: Colors.indigo, fontSize: 12),
            ),
          ],
        ),

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
        //           builder: (BuildContext context) => new Edit_Worker(
        //             list: widget.list,
        //             index: widget.index,
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ],
      ),

      body:SingleChildScrollView(
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
                        "assets/images/worker.png",
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Place',
                style: GoogleFonts.prompt(fontSize: 17),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Post',
                style: GoogleFonts.prompt(fontSize: 17),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Pin',
                style: GoogleFonts.prompt(fontSize: 17),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'District',
                style: GoogleFonts.prompt(fontSize: 17),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Contact no',
                style: GoogleFonts.prompt(fontSize: 17),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Specification',
                style: GoogleFonts.prompt(fontSize: 17),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Available',
                style: GoogleFonts.prompt(fontSize: 17),
              ),
              SizedBox(
                height: 40,
              ),
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              new Text(widget.list[widget.index]['place'],style: GoogleFonts.prompt(fontSize: 17)),
              SizedBox(
                height: 40,
              ),
              new Text(widget.list[widget.index]['post'],style: GoogleFonts.prompt(fontSize: 17)),
              SizedBox(
                height: 40,
              ),
              new Text(widget.list[widget.index]['pin'],style: GoogleFonts.prompt(fontSize: 17)),
              SizedBox(
                height: 40,
              ),
              new Text(widget.list[widget.index]['district'],style: GoogleFonts.prompt(fontSize: 17)),
              SizedBox(
                height: 40,
              ),
              new Text(widget.list[widget.index]['contact_no'],style: GoogleFonts.prompt(fontSize: 17)),
              SizedBox(
                height: 40,
              ),
              new Text(widget.list[widget.index]['specification'],style: GoogleFonts.prompt(fontSize: 17)),
              SizedBox(
                height: 40,
              ),
              new Text(widget.list[widget.index]['available'],style: GoogleFonts.prompt(fontSize: 17)),
              SizedBox(
                height: 40,
              ),
            ])
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style:  ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50,vertical: 15)),
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),
                  onPressed: (){
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context) => new Edit_Worker(
                          list: widget.list,
                          index: widget.index,
                        ),
                      ),
                    );

                  }, child: Text("Edit")),
              ElevatedButton(
                  style:  ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red.shade700),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50,vertical: 15)),
                      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),
                  onPressed: (){}, child: Text("Delete")),
            ],
          ),SizedBox(height: 40,),

        ],
      ), // Column

          ),
      // new Container(
      //   height: MediaQuery.of(context).size.height,
      //   padding: const EdgeInsets.all(20.0),
      //   child: new Center(
      //     child: new Column(
      //       children: <Widget>[
      //         //new Padding(padding: const EdgeInsets.only(top: 30.0),),
      //         new Text(
      //           widget.list[widget.index]['place'],
      //           textAlign: TextAlign.justify,
      //           style: const TextStyle(
      //             fontSize: 20.0,
      //             color: Colors.black,
      //           ),
      //           overflow: TextOverflow.visible,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
