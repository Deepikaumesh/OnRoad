import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Admin/Admin_Dashboard.dart';
import 'package:untitled/Service/Service_Dashboard.dart';
import 'package:untitled/User/User_Dashboard.dart';
import 'package:untitled/User/User_SignUp.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class User_Login extends StatefulWidget {
  @override
  _User_LoginState createState() => _User_LoginState();
}

class _User_LoginState extends State<User_Login> {
  TextEditingController user_email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "User login",
          style: TextStyle(color: Colors.blueGrey),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/images/user_login.png')),
              ),
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    child: TextFormField(
                      controller: user_email,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter username";
                        }
                        return null;
                      },
                      onSaved: (username) {},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          //  labelText: 'Email',
                          hintText: 'username'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: password,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter password";
                        }
                        return null;
                      },
                      onSaved: (name) {},
                      style: TextStyle(),
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter secure password'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1.3,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan.shade400,
                ),
                onPressed: ()
                //async
                {
                  user_Login();
                  // final SharedPreferences sharedpreferences =
                  //     await SharedPreferences.getInstance();
                  //
                  // sharedpreferences.setString('user_email', user_email.text);
                  //email_text2 = user_email.text;
                  //Get.to(Service_Dashboard());
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) => User_Dashboard(
                  //               data_passing_user: email_text2,
                  //             )));

                  // Get.back();
                  // setState(() {
                  //  // checkLogin();
                  //
                  //
                  // });

                  if (formkey.currentState!.validate()) {
                    print("Successfully  logged user");
                    // email.clear();
                    // password.clear();
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New User?',
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(User_SignupPage());
                    },
                    child: Text("Create Account"))
              ],
            )
          ],
        ),
      ),
    );
  }

  Future user_Login() async {
    //var url ="https://anthracitic-pecks.000webhostapp.com/Hope_Charity_Project/Admin/Hope_Admin_Login.php"; //intego wifi password
    var url = "http://$ip/MySampleApp/ORBVA/User/login.php";
    var response = await http.post(Uri.parse(url), headers: {
      'Accept': 'application/json'
    }, body: {
      "username": user_email.text,
      "password": password.text,
    });
    var data = json.decode(response.body);
    // if (data.toString() == "Success") {
    if (data != null) {
      //var responseData = json.decode(response.body);

      for (var singleUser in data) {
        final SharedPreferences sharedpreferences = await SharedPreferences.getInstance();

       await sharedpreferences.setString('user_email', singleUser["email"]);




      }

      final snackBar = SnackBar(
        content: Text('Login Successfull'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // final _CustomersharedPrefs = await SharedPreferences.getInstance();
      // // await _CustomersharedPrefs.setBool(Customer_Key, true);
      // await _CustomersharedPrefs.setInt("userid", data["id"]);

      //
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => User_Dashboard(
                data_passing_user: email_text2,
              )));



    } else {
      final snackBar = SnackBar(
        content: Text('Username and password invalid'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
