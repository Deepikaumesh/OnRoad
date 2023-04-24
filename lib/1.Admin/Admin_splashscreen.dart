import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Admin_Login.dart';
import 'Admin_Main_Dashboard.dart';

var Admin_key;

class Admin_Splashscreen extends StatefulWidget {
  _Admin_SplashscreenState createState() => _Admin_SplashscreenState();
}

class _Admin_SplashscreenState extends State<Admin_Splashscreen> {
  void initState() {
    getValidationData().whenComplete(() async {
      await Timer(Duration(seconds: 1), () {
        Admin_key == null
            ? Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Admin_Login()))
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        //Admin_Dashboard(data_passing_admin: null,)
                        Admin_Main_dashboard()));
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Loading......",
            style: GoogleFonts.aclonica(
              color: Colors.red.shade900,
              fontSize: 11.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CircularProgressIndicator(
            color: Colors.lightBlue,
          ),
        ],
      ),
    );
  }

  Future getValidationData() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtainedemail = await sharedprefs.getString('admin_email');
    //value = obtainedemail;
    setState(() {
      Admin_key = obtainedemail;
    });
    print('thisis service  value $Admin_key');
  }
}
