import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:untitled/test/splashscreen.dart';

import '../main.dart';
import 'homepage.dart';
class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
final TextEditingController email_controller = TextEditingController();
final TextEditingController password_controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("login page"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: email_controller,
              decoration: InputDecoration(
                hintText: 'Enter email',
                contentPadding: const EdgeInsets.all(10.0),
                hintStyle: TextStyle(
                  color: Colors.blueGrey,fontWeight: FontWeight.bold
                )
              ),
            ),
            ),
            Padding(padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: password_controller,
                decoration: InputDecoration(
                    hintText: 'Enter password',
                    contentPadding: const EdgeInsets.all(10.0),
                    hintStyle: TextStyle(
                        color: Colors.blueGrey,fontWeight: FontWeight.bold
                    )
                ),
              ),
            ),
            MaterialButton(
                color: Colors.redAccent,
                child: Text('Login'),

                onPressed: () async {
final SharedPreferences sharedpreferences = await SharedPreferences.getInstance();

sharedpreferences.setString('email', email_controller.text);
Get.to(homepage(name: email_controller.text,));
//print(finalemail);

                })

          ],
        ),
      ),
    );
  }
}
