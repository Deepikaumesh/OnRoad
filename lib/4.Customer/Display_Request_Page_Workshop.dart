import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

import 'package:http/http.dart' as http;

class Display_Request_Page_workshop extends StatefulWidget {
  const Display_Request_Page_workshop({Key? key}) : super(key: key);

  @override
  _Display_Request_Page_workshopState createState() =>
      _Display_Request_Page_workshopState();
}

class _Display_Request_Page_workshopState
    extends State<Display_Request_Page_workshop> {
  TextEditingController request = TextEditingController();

  Future Send() async {
    var APIURL =
        "http://$ip/MySampleApp/ORBVA/Customer/send_workshop_request.php";

    Map mapeddate = {
      'customer_id': cust_id,
      'request': request.text,
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL), body: mapeddate);

    //getting response from php code, here
    var data = jsonDecode(reponse.body);
    var responseMessage = data["message"];
    var responseError = data["error"];
    print("DATA: ${data}");
    if (responseError) {
      Fluttertoast.showToast(
          msg: 'error',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey);
    } else {
      Fluttertoast.showToast(
          msg: 'Request send',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey);
    }
  }

  @override
  void initState() {
    request = TextEditingController();

    super.initState();
  }

  Future<List> getData() async {
    final response = await http.get(Uri.parse(
        "http://$ip/MySampleApp/ORBVA/Customer/Display_workshops.php"));
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
          "Workshop",
          style: GoogleFonts.prompt(fontSize: 22, color: Colors.blueGrey),
        ),
      ),
      body: FutureBuilder<List>(
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
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              (snapshot.data![index]["name"]),
                              style: GoogleFonts.lora(
                                  fontSize: 18,
                                  color: Colors.pink.shade700),
                            ),
                            SizedBox(
                              width: 70,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(
                                      Colors.grey.shade500),
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title:
                                      const Text("Enter Your Request"),
                                      content: TextField(
                                        controller: request,
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                          child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  Send();
                                                });
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                        context) =>
                                                            Display_Request_Page_workshop()));
                                              },
                                              child: Text("Ok")),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Text(
                                  "Send",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.teal,
                        )
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