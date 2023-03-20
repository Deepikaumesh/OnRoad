import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Admin/Admin_Login.dart';
import 'package:untitled/Main_Screen/Main_Screen.dart';
import 'package:untitled/User/Drawer_User.dart';
import 'package:untitled/User/User_splashscreen.dart';


class User_Dashboard extends StatefulWidget {
  //
  var data_passing_user;

  User_Dashboard({required this.data_passing_user});

  @override
  _User_DashboardState createState() => _User_DashboardState();
}

class _User_DashboardState extends State<User_Dashboard> {
  // void initState() {
  //   setState(() {
  //     email_text;
  //   });
  //
  //   super.initState();
  // }

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user"),
      ),
      drawer: Drawer(
        child: UserDrawer(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Center(
          //   child: emai == null ? Text('') : Text(em)),
          SizedBox(
            height: 20,
          ),
          // Text("hai"+widget.data_passing_service.toString()),
          Text('welcome${User_key}'),
          MaterialButton(
              color: Colors.lightBlueAccent,
              child: Text('remove credentials user'),
              onPressed: () async {
                final SharedPreferences sharedpreferences =
                await SharedPreferences.getInstance();
                sharedpreferences.remove('user_email');
                Get.to(Main_screen());
              })
        ],
      ),
    );
  }
}
