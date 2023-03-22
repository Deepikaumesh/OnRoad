import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class CustomerDrawer extends StatelessWidget {
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
                    "assets/images/user_login.png",
                  ),
                ),
                // SizedBox(
                //   height: 20.0,
                // ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Hope",
                    style: GoogleFonts.aclonica(
                      color: Colors.pink,
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
            Icons.event,
            color: Colors.blueGrey.shade900,
          ),
          title: Text("Add Events",
              style: GoogleFonts.prompt(
                fontSize: 15,
              )),
        ),
        ListTile(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             Hope_Admin_event_Display_edit_page()));
          },
          leading: Icon(
            Icons.mode_edit,
            color: Colors.blueGrey.shade900,
          ),
          title: Text(
            "Edit Events",
            style: GoogleFonts.prompt(fontSize: 15),
          ),
        ),


      ]),
    );
  }
}
