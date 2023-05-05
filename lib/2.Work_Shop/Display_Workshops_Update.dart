import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/2.Work_Shop/Worker/workers_detail.dart';

import '../../main.dart';
import 'Workshop_Update_Page.dart';


class Display_Workshops_Update extends StatefulWidget {
  @override
  _Display_Workshops_UpdateState createState() => _Display_Workshops_UpdateState();
}

class _Display_Workshops_UpdateState extends State<Display_Workshops_Update> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse(
        "http://$ip/MySampleApp/ORBVA/Work_shop/Display_Workshops.php"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Workshops",
          style: GoogleFonts.prompt(fontSize: 22, color: Colors.blueGrey),
        ),
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ItemList(
            // list: snapshot.data,
            list: snapshot.data ?? [],
          )
              : Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
           onTap: () =>
                Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Workshop_Update_Page(
                  list: list,
                  index: i,
                ))),
            child: Card(
              color: Colors.white70,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                minLeadingWidth: 5,
                // contentPadding: EdgeInsets.all(5.0),


                title: Text(
                  (list[i]['name']),
                  style: GoogleFonts.lora(
                      fontSize: 18, color: Colors.pink.shade900),
                ),
                subtitle:  RichText(
                  text: list[i]['status']==
                      'Pending'
                      ? TextSpan(
                      text: 'Pending',
                      style: TextStyle(
                          color: Colors
                              .orange
                              .shade600))
                      :list[i]['status'] ==
                      'Rejected'
                      ? TextSpan(
                      text: 'Rejected',
                      style: TextStyle(
                          color: Colors
                              .red
                              .shade900))
                      : TextSpan(
                      text: list[i]['status'],
                      style: TextStyle(
                          color: Colors
                              .green
                              .shade900)),
                ),
                // Text(
                //   (list[i]['status']),
                //   style: GoogleFonts.lora(
                //       fontSize: 13, color: Colors.amber.shade900),
                // ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.cyan,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
