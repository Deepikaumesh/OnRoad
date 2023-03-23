import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Main_Screen/Main_Screen.dart';

import '../main.dart';
import 'Add_Workshop.dart';
import 'Drawer_Workshop.dart';
import 'Workshop_data.dart';
import 'Workshop_splashscreen.dart';


class Workshop_Dashboard extends StatefulWidget {
  //
  var data_passing_workshop;

  Workshop_Dashboard({required this.data_passing_workshop});

  @override
  _Workshop_DashboardState createState() => _Workshop_DashboardState();
}

class _Workshop_DashboardState extends State<Workshop_Dashboard> {
  // void initState() {
  //   setState(() {
  //     if(Workshop_key == null ? Text("") : Workshop_key ){
  //
  //     }
  //
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
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              IconButton(
                  onPressed: () async {
                    final SharedPreferences sharedpreferences =
                    await SharedPreferences.getInstance();
                    sharedpreferences.remove('workshop_email');
                    Get.to(Main_screen());
                  },
                  icon: Icon(Icons.exit_to_app)),
              Text("Logout")
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
       toolbarHeight: 150,
        elevation: 0,
       backgroundColor:  Colors.red.shade200,
       //  backgroundColor:  Color(0xF5951B),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Text('Welcome,',style: GoogleFonts.hind(fontSize: 15),),

          Text(
            "Work Shop",
            style: GoogleFonts.hind(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text('${Workshop_key}', style: GoogleFonts.hind(fontSize: 15)),
            ]),
      ),
      drawer:Drawer( child: WorkshopDrawer()),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_Workshop()));
              },
              child: Container(
                decoration: BoxDecoration(
                   color: Colors.grey,
                  borderRadius: BorderRadius.circular(4),),
                margin: EdgeInsets.only(top: 40),
                height: 50,
                width: MediaQuery.of(context).size.width / 1.2,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        //border: Border.all(width: 0.5,color: Colors.pink),
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: AssetImage("assets/images/workshop.png",),
                              fit: BoxFit.contain)),
                    ),
          Icon(Icons.arrow_right_alt_rounded,color: Colors.white,),
                    Text(
                    "Add Workshop",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
        ],
                ),

              ),
            ),
            SizedBox(height: 40,),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25,),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width ,
                decoration: BoxDecoration(
                  //border: Border.all(width: 0.5,color: Colors.pink),
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: AssetImage("assets/images/workshop_dashboard.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),

            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 95, vertical: 10),
            //   height: 50,
            //   width: MediaQuery.of(context).size.width / 1.2,
            //   child: Text(
            //     "View Requests",
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 20),
            //   ),
            //   color: Colors.black45,
            // ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 40),
              child:GestureDetector(
                onTap: (){
                 // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Create_service()));
                },
                child:View_Requests_Container() ,
              ),

            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,),
              child:GestureDetector(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Create_service()));
                },
                child:View_Feedback_Container() ,
              ),

            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 40),
              child:GestureDetector(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Create_service()));
                },
                child:View_Rating_Container() ,
              ),

            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child:GestureDetector(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Create_service()));
                },
                child:Account_Container() ,
              ),

            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 40),
              child:GestureDetector(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Create_service()));
                },
                child:Chat_Container() ,
              ),

            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,),
              child:GestureDetector(
                onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Workshop_data_Page()));
                },
                child:Work_shop_data_Container() ,
              ),

            ),
            // Text("hai"+widget.data_passing_service.toString()),

            // MaterialButton(
            //     color: Colors.lightBlueAccent,
            //     child: Text('remove credentials workshop'),
            //     onPressed: () async {
            //       final SharedPreferences sharedpreferences =
            //           await SharedPreferences.getInstance();
            //       sharedpreferences.remove('workshop_email');
            //       Get.to(Main_screen());
            //     })
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }

  View_Requests_Container() {
    return Container(
      decoration: BoxDecoration(
          //color: Color(0xfffad4d4),
           color: Colors.black26,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      height: 100,
      width: 340,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/request.png',
                height: 75.0,
                width: 75.0,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>News_Display_with_delete()));
                },
                child: Text(
                  "View Request",
                  style: GoogleFonts.quicksand(
                      fontSize: 25,
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
}}
  View_Feedback_Container() {
    return Container(
      decoration: BoxDecoration(
        //color: Color(0xfffad4d4),
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      height: 100,
      width: 340,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/feedback_workshop.png',
                height: 75.0,
                width: 75.0,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>News_Display_with_delete()));
                },
                child: Text(
                  "View Feedback",
                  style: GoogleFonts.quicksand(
                      fontSize: 25,
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
View_Rating_Container() {
  return Container(
    decoration: BoxDecoration(
      //color: Color(0xfffad4d4),
        color: Colors.lightBlue.shade100,
        borderRadius: BorderRadius.circular(10)),
    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
    height: 100,
    width: 340,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/rating_workshop.png',
              height: 75.0,
              width: 75.0,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>News_Display_with_delete()));
              },
              child: Text(
                "View Rating",
                style: GoogleFonts.quicksand(
                    fontSize: 25,
                    color: Colors.teal.shade900,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
Account_Container() {
  return Container(
    decoration: BoxDecoration(
      //color: Color(0xfffad4d4),
        color: Colors.red.shade200,
        borderRadius: BorderRadius.circular(10)),
    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
    height: 100,
    width: 340,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/account_workshop.png',
              height: 75.0,
              width: 75.0,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>News_Display_with_delete()));
              },
              child: Text(
                "Account",
                style: GoogleFonts.quicksand(
                    fontSize: 25,
                    color: Colors.teal.shade900,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Chat_Container() {
  return Container(
    decoration: BoxDecoration(
      //color: Color(0xfffad4d4),
        color: Colors.orange.shade200,
        borderRadius: BorderRadius.circular(10)),
    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
    height: 100,
    width: 340,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/chat_workshop.png',
              height: 75.0,
              width: 75.0,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>News_Display_with_delete()));
              },
              child: Text(
                "Chat with Customer",
                style: GoogleFonts.quicksand(
                    fontSize: 25,
                    color: Colors.teal.shade900,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
Work_shop_data_Container() {
  return Container(
    decoration: BoxDecoration(
      //color: Color(0xfffad4d4),
        color: Colors.teal.shade200,
        borderRadius: BorderRadius.circular(10)),
    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
    height: 100,
    width: 340,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/workshop_data.png',
              height: 75.0,
              width: 75.0,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>News_Display_with_delete()));
              },
              child: Text(
                "Workshop Data",
                style: GoogleFonts.quicksand(
                    fontSize: 25,
                    color: Colors.teal.shade900,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ],
    ),
  );
}





