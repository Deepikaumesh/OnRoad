import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Main_Screen/Main_Screen.dart';
import 'package:untitled/main.dart';

import 'Service_Login.dart';

class Service_Dashboard extends StatefulWidget {

  var email_passing;

  Service_Dashboard({required this.email_passing});



  @override
  _Service_DashboardState createState() => _Service_DashboardState();
}

class _Service_DashboardState extends State<Service_Dashboard> {

  // var emai;
  //
  //
  //
  // Future getEmail() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     emai =preferences.getString('email');
  //   });
  // }

  // Future logout(BuildContext context) async {
  //   SharedPreferences service_preference = await SharedPreferences.getInstance();
  //   service_preference.clear();
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Main_screen()));
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            // Center(
            //   child: emai == null ? Text('') : Text(em)),
            SizedBox(height: 20,),
            Text(widget.email_passing.toString()),


            ElevatedButton(
            onPressed: (){

              Merchant_Signout();
            },
            child: Text("logout"),
          ),

      ],
        ),

    );


  }
  Merchant_Signout() async //using navigator so we need context
      {
    final _MerchanntsharedPrefs = await SharedPreferences.getInstance();
    //await _MerchanntsharedPrefs.clear();
    await _MerchanntsharedPrefs.remove(Merchant_Key);
    //push new page and remove all other pages

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (ctx1) => Service_Login()),
            (route) => false);
  }
}
