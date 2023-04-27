import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'Workshop_Dash.dart';
import 'Workshop_Login.dart';
import 'Workshop_dashboard.dart';

var Workshop_key;

class Workshop_Splashscreen extends StatefulWidget {
  _Workshop_SplashscreenState createState() => _Workshop_SplashscreenState();
}

class _Workshop_SplashscreenState extends State<Workshop_Splashscreen> {
  void initState() {
    getValidationData().whenComplete(() async {
      // Timer(Duration(seconds: 2),() => Get.to(finalemail == null ?
      // login_page() : homepage()));

      await Timer(Duration(seconds: 1), () {
        Workshop_key == null
            ? Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Work_shop_Login()))
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Workshop_Dash(

                        )));
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Service_Dashboard()));
      });
    });

   setState(() {
     get_work_id();
     get_work_email();
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
          // Image.asset(
          //   "assets/nileswram.png",
          //   height: 45,
          //   width: 45,
          // ),
          // SizedBox(
          //   height: 10,
          // ),
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
    var obtainedemail = await sharedprefs.getString('workshop_email');

    setState(() {
      Workshop_key = obtainedemail;
    });
    print('thisis workshop  value $Workshop_key');
  }


  Future get_work_id()async {
    final SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    var obain_workid =await sharedPreferences.getString('workid');

    setState(() {
      work_id = obain_workid;
    });

  }
  Future get_work_email()async {
    final SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    var obain_workemail =await sharedPreferences.getString('workemail');

    setState(() {
      email_text_workshop = obain_workemail!;
    });

  }

}
