import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/1.Admin/Display_Workshops.dart';
import 'package:untitled/test/Listview.dart';
import 'package:untitled/test/addition.dart';
import 'package:untitled/test/login_page.dart';
import 'package:untitled/test/splashscreen.dart';

import '3.Service/Edit_Service.dart';
import '3.Service/display_Edit_Profile_Page.dart';
import 'Main_Screen/Main_Screen.dart';

var email_text_customer;
 var email_text_admin;
 var email_text_workshop;
 var email_text_service;

var ip = '192.168.29.65';

var cust_id;
var admin_id;
var work_id;
var service_id;




// var getemailadmin;
 var getemailservice;
// var getemaiworkshop;



void main() async {
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:Main_screen(),
      routes: {
        'Display_WOrkshops':(context) => Display_Workshops(),
        'Display_Edit_Profile_Page': (context) => Display_Edit_Profile_Page(),
      }));
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
