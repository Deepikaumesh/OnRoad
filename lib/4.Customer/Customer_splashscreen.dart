import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'Customer_Dash.dart';
import 'Customer_Login.dart';

var Customer_key;

class Customer_Splashscreen extends StatefulWidget {
  _Customer_SplashscreenState createState() => _Customer_SplashscreenState();
}

class _Customer_SplashscreenState extends State<Customer_Splashscreen> {
  void initState() {
    getValidationData().whenComplete(() async {
      // Timer(Duration(seconds: 2),() => Get.to(finalemail == null ?
      // login_page() : homepage()));

      await Timer(Duration(seconds: 1), () {
        Customer_key == null
            ? Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Customer_Login()))
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Customer_Dash()));
      });
    });

    setState(() {
      get();
      getmail();
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
    var obtainedid = await sharedprefs.getString('user_id');

    setState(() {
      Customer_key = obtainedid;
    });
  }

  get() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtainedide = await sharedprefs.getString('userid');

    setState(() {
      cust_id = obtainedide;
    });
  }

  getmail() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtaineemail = await sharedprefs.getString('email_cust');

    setState(() {});
    email_text_customer = obtaineemail!;
  }
}
