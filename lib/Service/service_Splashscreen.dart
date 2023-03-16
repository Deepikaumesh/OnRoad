import 'dart:async';
import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Admin/Admin_Dashboard.dart';
import 'package:untitled/Service/Service_Login.dart';
import '../../main.dart';






class service_Splashscreen extends StatefulWidget {
  _service_SplashscreenState createState() => _service_SplashscreenState();
}

class _service_SplashscreenState extends State<service_Splashscreen> {

  void initState() {
    checkMerchantLoogedIn();
    super.initState();
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
  }


    // Timer(
    //   Duration(seconds: 2),
    //       () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MyLogin())),
    // );


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
            "welcome",
            style: GoogleFonts.aclonica(
              color: Colors.red.shade900,
              fontSize: 11.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],


      ),
    );
  }
  Future Merchant_gotoLogin() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Service_Login()));
  }


  Future<void> checkMerchantLoogedIn() async{
    final _MerchanrsharedPrefs =await SharedPreferences.getInstance();
    print(Merchant_Key);
    final _merchantLoggedIn=_MerchanrsharedPrefs.getBool(Merchant_Key);
    if(_merchantLoggedIn == null || _merchantLoggedIn == false){
      Merchant_gotoLogin();
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Service_Dashboard(email_passing: email_text1)));
    }

  }


}