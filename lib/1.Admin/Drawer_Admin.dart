import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../About/About_Us.dart';
import '../Main_Screen/Main_Screen.dart';

class AdminDrawer extends StatelessWidget {
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
                    "assets/images/businessman.png",
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => About_Us()));
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
        // ListTile(
        //   onTap: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => Add_Worker()));
        //   },
        //   leading: Icon(
        //     Icons.man,
        //     color: Colors.blueGrey.shade900,
        //   ),
        //   title: Text("Add Worker",
        //       style: GoogleFonts.prompt(
        //         fontSize: 15,
        //       )),
        // ),
        // ListTile(
        //   onTap: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => Add_Crain()));
        //   },
        //   leading: Icon(
        //     Icons.add,
        //     color: Colors.blueGrey.shade900,
        //   ),
        //   title: Text("Add Crain",
        //       style: GoogleFonts.prompt(
        //         fontSize: 15,
        //       )),
        // ),

        // ListTile(
        //   onTap: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => Add_Spare_Parts()));
        //   },
        //   leading: Icon(
        //     Icons.add,
        //     color: Colors.blueGrey.shade900,
        //   ),
        //   title: Text("Add Spare parts",
        //       style: GoogleFonts.prompt(
        //         fontSize: 15,
        //       )),
        // ),

        ListTile(
          onTap: () async {
            final SharedPreferences sharedpreferences =
                await SharedPreferences.getInstance();
            sharedpreferences.remove('admin_email');
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
