import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Main_Screen/Main_Screen.dart';
import 'package:untitled/main.dart';

class Service_Dashboard extends StatefulWidget {

  var email_passing ='';

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

  Future logout(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Main_screen()));
  }

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

              logout(context);
            },
            child: Text("logout"),
          ),

      ],
        ),

    );
  }
}
