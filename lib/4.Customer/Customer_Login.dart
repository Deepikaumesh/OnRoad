import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import 'Customer_Dash.dart';
import 'Customer_SignUp.dart';

class Customer_Login extends StatefulWidget {
  @override
  _Customer_LoginState createState() => _Customer_LoginState();
}

class _Customer_LoginState extends State<Customer_Login> {



  getId() async {
  final _CustomersharedPrefs = await SharedPreferences.getInstance();
  await _CustomersharedPrefs.setString("userid", cust_id);
}

getemail() async {
  final _CustomersharedPrefs = await SharedPreferences.getInstance();
  await _CustomersharedPrefs.setString("email_cust", email_text_customer);
}



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
                onPressed: () {
                  user_Login();
                  if (formkey.currentState!.validate()) {
                    print("Successfully  logged user");
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
                      Get.to(Customer_SignupPage());
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
    var url = "http://$ip/MySampleApp/ORBVA/Customer/login.php";
    var response = await http.post(Uri.parse(url), headers: {
      'Accept': 'application/json'
    }, body: {
      "username": user_email.text,
      "password": password.text,
    });
    var data = json.decode(response.body);
    if (data != null) {
      for (var singleUser in data) {
        final SharedPreferences sharedpreferences =
            await SharedPreferences.getInstance();

       // await sharedpreferences.setString('customer_email', singleUser['email']);
        await sharedpreferences.setString('user_id', singleUser['customer_id']);

        cust_id = singleUser["customer_id"];

        email_text_customer = singleUser["email"];
        print('hello click ${email_text_customer}');



        getId();
        getemail();
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

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Customer_Dash(
              )));

      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (BuildContext context) => Customer_Dashboard(
      //              data_passing_user: null,
      //             )));
    } else {
      final snackBar = SnackBar(
        content: Text('Username and password invalid'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
