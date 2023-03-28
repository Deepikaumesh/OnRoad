import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/test/homepage.dart';
import 'package:untitled/test/login_page.dart';

import '../main.dart';


var finalemail;
class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState() {
    getValidationData().whenComplete(() async{
      // Timer(Duration(seconds: 2),() => Get.to(finalemail == null ?
      // login_page() : homepage()));

     await Timer(Duration(milliseconds: 1),() {
       finalemail == null ?  Navigator.push(context, MaterialPageRoute(builder: (context)=>login_page())):
       Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage(name: '',)));

      });

    });

   // Timer(Duration(seconds: 2),()=>Get.to(login_page()));
    // TODO: implement initState
    super.initState();
  }

Future getValidationData() async{
    final SharedPreferences sharedprefs = await SharedPreferences.getInstance();
    var obtainedemail = await  sharedprefs.getString('email');
    //value = obtainedemail;
    setState(() {
      finalemail= obtainedemail;
    });
    print('thisisvalue $finalemail');
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Icon(Icons.local_activity),
              radius: 50.0,
            )

          ],
        ),
      ),
    );
  }
}
