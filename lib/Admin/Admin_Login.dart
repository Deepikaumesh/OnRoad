import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Admin_SignUp.dart';



class Admin_Login extends StatefulWidget {
  @override
  _Admin_LoginState createState() => _Admin_LoginState();
}

class _Admin_LoginState extends State<Admin_Login> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final GlobalKey<FormState> form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: form_key,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/images/Admin_login.png')),
                ),
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: email,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter  email";
                    }
                    if (!RegExp(
                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return "Please enter valid email";
                    }
                    return null;
                  },
                  onSaved: (email) {},
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
                  controller: password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter password";
                    }
                    return null;
                  },
                  onSaved: (name) {},

                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
              SizedBox(height: 30,),

              SizedBox(
                height: MediaQuery.of(context).size.height/15,
                width: MediaQuery.of(context).size.width/1.3,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal.shade300,
                  ),
                  onPressed: () {
                    if (form_key.currentState!.validate()) {
                      email.clear();
                      password.clear();
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
                  Get.to(Admin_SignupPage());
                }, child: Text("Create Account"))
    ],)
            ],
          ),
        ),
      ),
    );
  }
}