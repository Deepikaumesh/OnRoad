import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Main_screen extends StatefulWidget {
  const Main_screen({Key? key}) : super(key: key);

  @override
  _Main_screenState createState() => _Main_screenState();
}

class _Main_screenState extends State<Main_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.cyan.shade50,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 95, top: 20, right: 95),
                  padding: EdgeInsets.all(15),
                  height: 77,
                  width: 200,
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
              Container(
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
              SizedBox(
                height: 40,
              ),
              SizedBox(
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
                        height:MediaQuery.of(context).size.height/2,
                        width: MediaQuery.of(context).size.width/7,
                        child: Container(
                          height:MediaQuery.of(context).size.height/2,
                          width: MediaQuery.of(context).size.width/7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            // color: Colors.teal,
                            image: DecorationImage(
                                image: AssetImage("assets/images/user (2).png"),
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                      Spacer(),
                    //  Text("--------------------------------------"),
                      Text(
                        'USER',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 330.0,
                height: 70.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //  shape: StadiumBorder(),
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    backgroundColor: Colors.blueGrey.shade500,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height:MediaQuery.of(context).size.height/2,
                        width: MediaQuery.of(context).size.width/7,
                        child: Container(
                          height:MediaQuery.of(context).size.height/2,
                          width: MediaQuery.of(context).size.width/7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            // color: Colors.teal,
                            image: DecorationImage(
                                image: AssetImage("assets/images/customer-service.png"),
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                      Spacer(),
                  //    Text("-------------------------------"),
                      Text(
                        'SERVICE',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 330.0,
                height: 70.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //  shape: StadiumBorder(),
                    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    backgroundColor: Colors.brown.shade200,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height:MediaQuery.of(context).size.height/2,
                        width: MediaQuery.of(context).size.width/7,
                        child: Container(
                          height:MediaQuery.of(context).size.height/2,
                          width: MediaQuery.of(context).size.width/7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            // color: Colors.teal,
                            image: DecorationImage(
                                image: AssetImage("assets/images/businessman.png"),
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
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
