import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'Service_Dash.dart';
import 'Service_Login.dart';

var service_key;

class service_Splashscreen extends StatefulWidget {
  _service_SplashscreenState createState() => _service_SplashscreenState();
}

class _service_SplashscreenState extends State<service_Splashscreen> {
  void initState() {
    getValidationData().whenComplete(() async {
      // Timer(Duration(seconds: 2),() => Get.to(finalemail == null ?
      // login_page() : homepage()));

      await Timer(Duration(seconds: 1), () {
        service_key == null
            ? Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Service_Login()))
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Service_dash(

                        )));
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
    var obtainedemail = await sharedprefs.getString('service_email');
    //value = obtainedemail;
    setState(() {
      service_key = obtainedemail;
    });
    print('thisis service  value $service_key');
  }

  get() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtainedide = await sharedprefs.getString('serviceid');

    setState(() {
      service_id = obtainedide;
    });
  }

  getmail() async {
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtaineemail = await sharedprefs.getString('email_service');

    setState(() {});
    email_text_service = obtaineemail!;
  }
}
