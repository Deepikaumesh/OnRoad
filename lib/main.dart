import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Main_Screen/Main_Screen.dart';

var em;
var email_text ='';
var ip_address = '192.168.29.64';

void main() async{
  runApp(GetMaterialApp(home:Main_screen() ));
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


