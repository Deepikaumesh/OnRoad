import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/test/login_page.dart';
import 'package:untitled/test/splashscreen.dart';

import 'Main_Screen/Main_Screen.dart';

var email_text = '';
var email_text1 = '';
var email_text2 = '';
var ip='192.168.29.102';
void main() async {
  runApp(
      GetMaterialApp(debugShowCheckedModeBanner: false, home: Main_screen()));
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
