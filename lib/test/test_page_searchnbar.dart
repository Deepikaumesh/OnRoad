import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/test/searchbar.dart';

class testpagesearchbar extends StatefulWidget {
  const testpagesearchbar({Key? key}) : super(key: key);

  @override
  _testpagesearchbarState createState() => _testpagesearchbarState();
}

class _testpagesearchbarState extends State<testpagesearchbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            //Cust_Search_Bar(),


          ],
        ),
      ),

    );
  }
}
