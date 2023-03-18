import 'dart:async';
import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Admin/Admin_Login.dart';
import 'package:untitled/User/User_Login.dart';

import '../main.dart';
import 'User_Dashboard.dart';






var User_key;

class User_Splashscreen extends StatefulWidget {
  _User_SplashscreenState createState() => _User_SplashscreenState();
}

class _User_SplashscreenState extends State<User_Splashscreen> {

  void initState() {
    getValidationData().whenComplete(() async{
      // Timer(Duration(seconds: 2),() => Get.to(finalemail == null ?
      // login_page() : homepage()));

      await Timer(Duration(microseconds: 1),() {
        User_key == null ?  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>User_Login())):
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => User_Dashboard(data_passing_user: email_text2,)));
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Service_Dashboard()));

      });

    });

    // Timer(Duration(seconds: 2),()=>Get.to(login_page()));
    // TODO: implement initState
    super.initState();
  }

  // @override
  // void didChangeDependencies(){
  //   super.didChangeDependencies();
  // }


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
  // Future Merchant_gotoLogin() async {
  //   await Future.delayed(Duration(seconds: 1));
  //   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Service_Login()));
  // }
  Future getValidationData() async{
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtainedemail = await  sharedprefs.getString('user_email');
    //value = obtainedemail;
    setState(() {
      User_key= obtainedemail;
    });
    print('thisis user  value $User_key');
  }

// Future<void> checkMerchantLoogedIn() async{
//   final _MerchanrsharedPrefs =await SharedPreferences.getInstance();
//   print(Merchant_Key);
//   final _merchantLoggedIn=_MerchanrsharedPrefs.getBool(Merchant_Key);
//   if(_merchantLoggedIn == null || _merchantLoggedIn == false){
//     Merchant_gotoLogin();
//   }
//   else{
//     Navigator.push(context, MaterialPageRoute(builder: (context)=>Service_Dashboard(email_passing: email_text1)));
//   }
//
// }


}