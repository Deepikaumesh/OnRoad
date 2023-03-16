import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/User/User_SignUp.dart';

import '../main.dart';
import 'User_Dashboard.dart';



class User_Login extends StatefulWidget {
  @override
  _User_LoginState createState() => _User_LoginState();
}

class _User_LoginState extends State<User_Login> {

  TextEditingController user_email = TextEditingController();
  TextEditingController user_password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();



  Future checkLogin() async {
    if (user_email.text ==  user_password.text ) {
      SharedPreferences user_preferences = await SharedPreferences.getInstance();
      em =user_preferences.setString("email", user_email.text);
      //em =preferences.setString('email', user_email.text);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => User_Dashboard(name: user_email.text,)));

      print('em value ${em}');
      email_text = user_email.text;
      print("availability of email.text" + email_text);

      Fluttertoast.showToast(
          msg: 'Login successfull',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green);
    }else{
      Fluttertoast.showToast(
          msg: 'invalid email & password ',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green);

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                children:[
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
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com'),
                ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: user_password,

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
                onPressed: () {

                 // Get.back();
                  setState(() {

                  });

                  checkLogin();



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
              children:[

              Text('New User?',style: TextStyle(color: Colors.black87,fontSize: 15),),
              TextButton(onPressed: (){
                Get.to(User_SignupPage());
              }, child: Text("Create Account"))
    ],)
          ],
        ),
      ),
    );
  }
}