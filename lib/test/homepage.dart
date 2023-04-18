import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/test/login_page.dart';
import 'package:untitled/test/splashscreen.dart';

import '../main.dart';

class homepage extends StatefulWidget {
  var name = '';

  homepage({required this.name});

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Welcome' + widget.name),
          ),
          MaterialButton(
              color: Colors.lightBlueAccent,
              child: Text('remove credentials'),
              onPressed: () async {
                final SharedPreferences sharedpreferences =
                    await SharedPreferences.getInstance();
                sharedpreferences.remove('email');
                Get.to(login_page());
              })
        ],
      ),
    );
  }
}
