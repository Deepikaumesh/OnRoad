import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Main_Screen/Main_Screen.dart';

import 'Customer_splashscreen.dart';
import 'Drawer_Customer.dart';

class Customer_Dashboard extends StatefulWidget {
  //
  var data_passing_user;

  Customer_Dashboard({required this.data_passing_user});

  @override
  _Customer_DashboardState createState() => _Customer_DashboardState();
}

class _Customer_DashboardState extends State<Customer_Dashboard> {
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
        title: Text("user"),
      ),
      drawer: Drawer(
        child: CustomerDrawer(),
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
          Text('welcome${Customer_key}'),
          MaterialButton(
              color: Colors.lightBlueAccent,
              child: Text('remove credentials user'),
              onPressed: () async {
                final SharedPreferences sharedpreferences =
                    await SharedPreferences.getInstance();
                sharedpreferences.remove('user_email');
                Get.to(Main_screen());
              })
        ],
      ),
    );
  }
}