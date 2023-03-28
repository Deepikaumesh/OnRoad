import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class secnd extends StatefulWidget {
  var name ='';

  secnd({required this.name});


  @override
  _secndState createState() => _secndState();
}

class _secndState extends State<secnd> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(widget.name),
          )
        ],
      ),
    );
  }
}
