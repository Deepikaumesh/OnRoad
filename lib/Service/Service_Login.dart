import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Service/Service_Dashboard.dart';
import 'package:untitled/User/User_SignUp.dart';

import '../main.dart';
import 'Service_SignUp.dart';



class Service_Login extends StatefulWidget {
  @override
  _Service_LoginState createState() => _Service_LoginState();
}

class _Service_LoginState extends State<Service_Login> {

  TextEditingController service_email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  // Future checkLogin() async {
  //   if (service_email.text ==  password.text ) {
  //
  //     final _sharedPrefs = await SharedPreferences.getInstance();
  //     await _sharedPrefs.setBool(Merchant_Key, true);
  //
  //
  //
  //
  //
  //
  //     // SharedPreferences service_preferences = await SharedPreferences.getInstance();
  //     // em1 =service_preferences.setString('email_service', service_email.text);
  //
  //
  //
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Service_Dashboard(data_passing_service: '',)));
  //     email_text1 = service_email.text;
  //      print("availability of email.text service login" + email_text1);
  //     Fluttertoast.showToast(
  //         msg: 'Login successfull',
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.green);
  //   }else{
  //     Fluttertoast.showToast(
  //         msg: 'invalid email & password ',
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.green);
  //
  //   }
  // }
  //


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("servicelogin",style: TextStyle(color: Colors.blueGrey),),
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
                    child: Image.asset('assets/images/mech_login.png')),
              ),
            ),
            Form(
              key: formkey,
              child: Column(
                children:[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    child: TextFormField(
                      controller: service_email,
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
                         // labelText: 'Email',
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
                ], ),
            ),

            SizedBox(height: 30,),

            SizedBox(
              height: MediaQuery.of(context).size.height/15,
              width: MediaQuery.of(context).size.width/1.3,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.cyan.shade400,
                ),
                onPressed: () async{
                  final SharedPreferences sharedpreferences = await SharedPreferences.getInstance();

                  sharedpreferences.setString('service_email', service_email.text);
                  email_text1 = service_email.text;
                  //Get.to(Service_Dashboard());
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Service_Dashboard(data_passing_service:email_text1 ,)));

                  // Get.back();
                  // setState(() {
                  //  // checkLogin();
                  //
                  //
                  // });

                  if (formkey.currentState!.validate()) {
                    print("Successfully  logged Service");
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
              children:[

                Text('New User?',style: TextStyle(color: Colors.black87,fontSize: 15),),
                TextButton(onPressed: (){
                  Get.to(Service_SignupPage());
                }, child: Text("Create Account"))
              ],)
          ],
        ),
      ),
    );
  }
}