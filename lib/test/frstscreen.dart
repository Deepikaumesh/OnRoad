// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled/test/secndscreen.dart';
//
// class frst extends StatefulWidget {
//   const frst({Key? key}) : super(key: key);
//
//   @override
//   _frstState createState() => _frstState();
// }
//
// class _frstState extends State<frst> {
//
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(top: 60.0),
//               child: Center(
//                 child: Container(
//                     width: 200,
//                     height: 150,
//                     child: Image.asset('assets/images/user_login.png')),
//               ),
//             ),
//             Form(
//               child: Column(
//                 children:[
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 15.0, right: 15.0, top: 15, bottom: 0),
//                     child: TextFormField(
//                       controller: email,
//                       keyboardType: TextInputType.text,
//                       // validator: (value) {
//                       //   if (value!.isEmpty) {
//                       //     return "Please enter username";
//                       //   }
//                       //   return null;
//                       // },
//                       // onSaved: (username) {},
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'Email',
//                           hintText: 'Enter valid email id as abc@gmail.com'),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 15.0, right: 15.0, top: 15, bottom: 0),
//                     //padding: EdgeInsets.symmetric(horizontal: 15),
//                     child: TextFormField(
//                       controller: password,
//
//                       keyboardType: TextInputType.text,
//                       // validator: (value) {
//                       //   if (value!.isEmpty) {
//                       //     return "Please enter password";
//                       //   }
//                       //   return null;
//                       // },
//                       // onSaved: (name) {},
//                       style: TextStyle(),
//                       obscureText: true,
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'Password',
//                           hintText: 'Enter secure password'),
//                     ),
//                   ),
//                 ], ),
//             ),
//
//             SizedBox(height: 30,),
//
//             SizedBox(
//               height: MediaQuery.of(context).size.height/15,
//               width: MediaQuery.of(context).size.width/1.3,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.cyan.shade400,
//                 ),
//                 onPressed: () {
//                   // Get.back();
//                   setState(() {
//
//                   });
//                   Navigator.push(context,MaterialPageRoute(builder: (context)=>secnd(name: email.text,)));
//
//                   //checkLogin();
//
//                   // if (formkey.currentState!.validate()) {
//                     print("Successfully  logged");
//                     // email.clear();
//                     // password.clear();
//                 //  }
//
//                 },
//                 child: Text(
//                   'Login',
//                   style: TextStyle(color: Colors.white, fontSize: 35),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children:[
//
//                 Text('New User?',style: TextStyle(color: Colors.black87,fontSize: 15),),
//                 TextButton(onPressed: (){
//                   //Get.to(User_SignupPage());
//                 }, child: Text("Create Account"))
//               ],)
//           ],
//         ),
//       ),
//       // body: Column(
//       //   mainAxisAlignment: MainAxisAlignment.center,
//       //   children: [
//       //     Center(
//       //         child: TextFormField(
//       //           controller: email,
//       //           keyboardType: TextInputType.text,
//       //         )
//       //     ),
//       //     ElevatedButton(onPressed: (){
//       //       Navigator.push(context,MaterialPageRoute(builder: (context)=>secnd(email: email.text,)));
//       //     }, child: Text("hello"))
//       //   ],
//       // ),
//     );
//   }
// }
