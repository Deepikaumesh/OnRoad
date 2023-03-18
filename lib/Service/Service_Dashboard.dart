import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Main_Screen/Main_Screen.dart';
import 'package:untitled/Service/service_Splashscreen.dart';
import 'package:untitled/main.dart';

import '../test/login_page.dart';
import 'Service_Login.dart';

class Service_Dashboard extends StatefulWidget {
  //
  var data_passing_service;

  Service_Dashboard({required this.data_passing_service});

  @override
  _Service_DashboardState createState() => _Service_DashboardState();
}

class _Service_DashboardState extends State<Service_Dashboard> {
  // void initState() {
  //   setState(() {
  //     email_text;
  //   });
  //
  //   super.initState();
  // }

  // var emai;
  //
  //
  //
  // Future getEmail() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     emai =preferences.getString('email');
  //   });
  // }

  // Future logout(BuildContext context) async {
  //   SharedPreferences service_preference = await SharedPreferences.getInstance();
  //   service_preference.clear();
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Main_screen()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("service"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Center(
          //   child: emai == null ? Text('') : Text(em)),
          SizedBox(
            height: 20,
          ),
          // Text("hai"+widget.data_passing_service.toString()),
          Text('welcome${service_key}'),
          MaterialButton(
              color: Colors.lightBlueAccent,
              child: Text('remove credentials service'),
              onPressed: () async {
                final SharedPreferences sharedpreferences =
                    await SharedPreferences.getInstance();
                sharedpreferences.remove('service_email');
                Get.to(Main_screen());
              })

          //   ElevatedButton(
          //   onPressed: (){
          //
          //     Merchant_Signout();
          //   },
          //   child: Text("logout"),
          // ),
        ],
      ),
    );
  }
}
