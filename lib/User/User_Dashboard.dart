import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Main_Screen/Main_Screen.dart';
import 'package:untitled/main.dart';

class User_Dashboard extends StatefulWidget {

  var name ='';

  User_Dashboard({required this.name});



  @override
  _User_DashboardState createState() => _User_DashboardState();
}

class _User_DashboardState extends State<User_Dashboard> {

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
            Text(widget.name.toString()),


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
