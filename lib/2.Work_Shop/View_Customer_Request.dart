import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import 'package:http/http.dart' as http;

class View_Customer_Request extends StatefulWidget {
  const View_Customer_Request({Key? key}) : super(key: key);

  @override
  _View_Customer_RequestState createState() => _View_Customer_RequestState();
}

class _View_Customer_RequestState extends State<View_Customer_Request> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse(
        "http://$ip/MySampleApp/ORBVA/Work_shop/Display_Customer_request.php"));
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
          "Customer Request",
          style: GoogleFonts.prompt(fontSize: 22, color: Colors.blueGrey),
        ),
      ),
      body:

      FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            Fluttertoast.showToast(
                msg: 'Error',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                textColor: Colors.white,
                webPosition: 1,
                backgroundColor: Colors.blueGrey);

          //   return snapshot.hasData ? Display_Data_Items(list: snapshot.data ?? [])  : Center(child: CircularProgressIndicator(),

          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Text(
                              (snapshot.data![index]["username"]),
                              style: GoogleFonts.lora(
                                  fontSize: 20, color: Colors.pink.shade700),
                            ),
                            Text(snapshot.data![index]["email"]),
                            Text(snapshot.data![index]["phone"]),
                            Text(snapshot.data![index]["request"]),
                            Text(snapshot.data![index]["request_date"]),
                            Divider(thickness: 2,color: Colors.grey,)
                          ],
                        ),
                      ),
                    );
                  })
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
