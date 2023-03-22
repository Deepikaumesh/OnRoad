import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Main_Screen/Main_Screen.dart';



class ServiceDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70.0,
                  backgroundImage: AssetImage(
                    "assets/images/customer-service.png",
                  ),
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "ORBVA",
                    style: GoogleFonts.aclonica(
                      color: Colors.orange.shade900,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        //Now let's Add the button for the Menu
        //and let's copy that and modify it

        ListTile(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => Hope_Admin_event_registration()));
          },
          leading: Icon(
            Icons.person,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("About us",
              style: GoogleFonts.prompt(
                fontSize: 15,
              )),
        ),
        ListTile(
          onTap: () async{
              final SharedPreferences sharedpreferences =
              await SharedPreferences.getInstance();
              sharedpreferences.remove('service_email');
              Get.to(Main_screen());
          },
          leading: Icon(
            Icons.exit_to_app_sharp,
            color: Colors.blueGrey.shade900,
          ),
          title: Text(
            "Logout",
            style: GoogleFonts.prompt(fontSize: 15),
          ),
        ),


      ]),
    );
  }
}
