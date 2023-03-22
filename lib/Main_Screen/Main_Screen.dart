import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Customer/Customer_splashscreen.dart';

import '../Admin/Admin_Login.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Admin/Admin_splashscreen.dart';
import '../Service/Service_Dashboard.dart';
import '../Service/service_Splashscreen.dart';
import '../test/geo_location.dart';
import '../test/splashscreen.dart';

class Main_screen extends StatefulWidget {
  const Main_screen({Key? key}) : super(key: key);

  @override
  _Main_screenState createState() => _Main_screenState();
}

class _Main_screenState extends State<Main_screen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan.shade50,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  // color:Colors.red,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height / 14,
                  child: Text("ORBVA",
                      style: GoogleFonts.sourceSerifPro(
                          fontSize: 50, color: Colors.red.shade900))),
              Text(
                "On Road Breakdown Vehicle Assistance",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    //  color: Colors.teal,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://img.freepik.com/premium-vector/"
                            "car-breakdown-road-assistance-cartoon-illustration-businessman-need-car-repair-service_80590-7724.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 40),
                child: SizedBox(
                  width: 330.0,
                  height: 70.0,
                  child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //  shape: StadiumBorder(),
                      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Colors.brown.shade200,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width / 7,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width / 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              // color: Colors.teal,
                              image: DecorationImage(
                                  image:
                                  AssetImage("assets/images/businessman.png"),
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ),
                        Spacer(),
                        // Text("----------------------------------"),
                        Text(
                          'ADMIN',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      //Get.to(Admin_Login());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Admin_Splashscreen()));
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40,),
                child: SizedBox(
                  width: 330.0,
                  height: 70.0,
                  child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //  shape: StadiumBorder(),
                      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Colors.amber.shade400,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width / 7,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width / 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              // color: Colors.teal,
                              image: DecorationImage(
                                  image:
                                  AssetImage("assets/images/workshop.png"),
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ),
                        Spacer(),
                        // Text("----------------------------------"),
                        Text(
                          'WORKSHOP',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      //Get.to(Admin_Login());
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 40),
                child: SizedBox(
                  width: 330.0,
                  height: 70.0,
                  child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //  shape: StadiumBorder(),
                      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Colors.blueGrey.shade500,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width / 7,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width / 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              // color: Colors.teal,
                              image: DecorationImage(
                                  image:
                                  AssetImage("assets/images/customer-service.png"),
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ),
                        Spacer(),
                        // Text("----------------------------------"),
                        Text(
                          'SERVICE CENTER',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      setState(() {});
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => service_Splashscreen()));
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  width: 330.0,
                  height: 70.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //  shape: StadiumBorder(),
                      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Colors.cyan.shade300,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width / 7,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width / 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              // color: Colors.teal,
                              image: DecorationImage(
                                  image:
                                  AssetImage("assets/images/user (2).png"),
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ),
                        Spacer(),
                        //  Text("--------------------------------------"),
                        Text(
                          'CUSTOMER',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Customer_Splashscreen()));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              // SizedBox(
              //   width: 330.0,
              //   height: 70.0,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       //  shape: StadiumBorder(),
              //       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              //       backgroundColor: Colors.blueGrey.shade500,
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         SizedBox(
              //           height: MediaQuery.of(context).size.height / 2,
              //           width: MediaQuery.of(context).size.width / 7,
              //           child: Container(
              //             height: MediaQuery.of(context).size.height / 2,
              //             width: MediaQuery.of(context).size.width / 7,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(6),
              //               // color: Colors.teal,
              //               image: DecorationImage(
              //                   image: AssetImage(
              //                       "assets/images/customer-service.png"),
              //                   fit: BoxFit.contain),
              //             ),
              //           ),
              //         ),
              //         Spacer(),
              //         //    Text("-------------------------------"),
              //         Text(
              //           'SERVICE CENTER',
              //           style: TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.w700,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ],
              //     ),
              //     onPressed: () {
              //       setState(() {});
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => service_Splashscreen()));
              //       // mer == null ? Navigator.push(context, MaterialPageRoute(builder: (context)=>Service_Login())) :
              //       // Navigator.push(context, MaterialPageRoute(builder: (context)=>Service_Dashboard(email_passing: email_text1,)));
              //       // em == null ? Service_Login() : Service_SignupPage();
              //
              //       //   Get.to(Service_Login());
              //       //    em1 == null ? Navigator.push(context, MaterialPageRoute(builder: (context)=>Service_Login())) :
              //       //    Navigator.push(context, MaterialPageRoute(builder: (context)=>Service_Dashboard(email_passing: email_text1,)));
              //       // em == null ? Service_Login() : Service_SignupPage();
              //     },
              //   ),
              // ),
              SizedBox(
                height: 40,
              ),
              // SizedBox(
              //   width: 330.0,
              //   height: 70.0,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       //  shape: StadiumBorder(),
              //       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              //       backgroundColor: Colors.brown.shade200,
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         SizedBox(
              //           height: MediaQuery.of(context).size.height / 2,
              //           width: MediaQuery.of(context).size.width / 7,
              //           child: Container(
              //             height: MediaQuery.of(context).size.height / 2,
              //             width: MediaQuery.of(context).size.width / 7,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(6),
              //               // color: Colors.teal,
              //               image: DecorationImage(
              //                   image:
              //                       AssetImage("assets/images/businessman.png"),
              //                   fit: BoxFit.contain),
              //             ),
              //           ),
              //         ),
              //         Spacer(),
              //         // Text("----------------------------------"),
              //         Text(
              //           'ADMIN',
              //           style: TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.w700,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ],
              //     ),
              //     onPressed: () {
              //       //Get.to(Admin_Login());
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (BuildContext context) =>
              //                   Admin_Splashscreen()));
              //     },
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              // ElevatedButton(onPressed: (){
              //   Navigator.push(context, MaterialPageRoute(builder: (context)=>frst()));
              // },
              // child: Text("test")),


            ElevatedButton(onPressed: (){
              Get.to(geo_location());
            }, child:Text("location test"))

            ],
          ),
        ),
      ),
    );
  }
}
