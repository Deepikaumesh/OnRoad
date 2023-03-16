import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Main_Screen/Main_Screen.dart';
const Merchant_Key = "MerchantLoggedIn";
var em;
var em1;
// var em2;
var email_text ='';
var email_text1 ='';
var email_text2 ='';
var ip_address = '192.168.29.64';
var mer ;

void main() async{
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:Main_screen() ));
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const GetMaterialApp(
//       debugShowCheckedModeBanner: false,// -> changed the material app to GetMaterialApp for using Get keyword for navigation
//       home: Main_screen(),
//     );
//   }
// }


