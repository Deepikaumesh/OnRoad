import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About_Us extends StatefulWidget {
  const About_Us({Key? key}) : super(key: key);

  @override
  State<About_Us> createState() => _About_UsState();
}

class _About_UsState extends State<About_Us> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(flex: 2, child: Container(color: Colors.cyan.shade50,)),
            Expanded(child: Container(color: Colors.white)),
          ],
        ),
        Align(
          alignment: Alignment(0, 0.2),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 1.5,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              elevation: 12,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        "assets/images/logo.png",
                        height: 70,
                        width: 70,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          'On Road Vehicle Breakdown Assistance (ORVBA) is going to be a good solution for the '
    'people who seek help in the remote locations with mechanical issues of their vehicle. Users of the On Road Vehicle Breakdown Assistance'
   ' will be the registered public and they will be getting connected with the particular mechanic through the trustworthy On Road Vehicle Breakdown Assistance (ORVBA) system. Because only the legally licensed and approved mechanics are enlisted in the On Road Vehicle Breakdown'
                              ' Assistance (ORVBA) App.',

                          textAlign: TextAlign.justify,
                          //style: TextStyle(fontSize: 15),
                          style: GoogleFonts.sourceSerifPro(fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
