// import 'package:flutter/material.dart';
//
// import 'package:untitled/Admin/Admin_Login.dart';
//
// import 'package:form_field_validator/form_field_validator.dart';
//
// class User_SignupPage extends StatefulWidget {
//   @override
//   State<User_SignupPage> createState() => _User_SignupPageState();
// }
//
// class _User_SignupPageState extends State<User_SignupPage> {
//   TextEditingController _username = TextEditingController();
//
//   TextEditingController _email = TextEditingController();
//
//   TextEditingController _phone = TextEditingController();
//
//   TextEditingController _password = TextEditingController();
//
//   TextEditingController _confirmpassword = TextEditingController();
//
//   late bool status;
//
//   late String message;
//
//   @override
//   void initState() {
//     _username = TextEditingController();
//     _email = TextEditingController();
//     _phone = TextEditingController();
//     _password = TextEditingController();
//     _confirmpassword = TextEditingController();
//
//     status = false;
//     message = "";
//
//     super.initState();
//   }
//
//   final GlobalKey<FormState> formkey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: double.infinity,
//           child: Form(
//             key: formkey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text(
//                   "Sign up",
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 40,
//                     ),
//                     child: TextFormField(
//                       controller: _username,
//                       keyboardType: TextInputType.text,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Please enter a Username";
//                         }
//                         return null;
//                       },
//                       onSaved: (name) {},
//                       obscureText: false,
//                       decoration: InputDecoration(
//                         label: Text("username"),
//                         contentPadding:
//                         EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             // color: Colors.grey[400],
//                             color: Colors.grey.shade500,
//                           ),
//                         ),
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey.shade500,
//                             )),
//                       ),
//                     )),
//
//                 Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 40,
//                     ),
//                     child: TextFormField(
//                       controller: _email,
//                       keyboardType: TextInputType.text,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Please enter  email";
//                         }
//                         if (!RegExp(
//                             "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//                             .hasMatch(value)) {
//                           return "Please enter a valid email";
//                         }
//                         return null;
//                       },
//                       onSaved: (email) {},
//                       obscureText: false,
//                       decoration: InputDecoration(
//                         label: Text("email"),
//                         contentPadding:
//                         EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             // color: Colors.grey[400],
//                             color: Colors.grey.shade500,
//                           ),
//                         ),
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey.shade500,
//                             )),
//                       ),
//                     )),
//                 Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 40,
//                     ),
//                     child: TextFormField(
//                       controller: _phone,
//                       keyboardType: TextInputType.phone,
//                       validator: (value) {
//                         if (value!.isEmpty && value!.length == 10) {
//                           return "Please enter phone number";
//                         }
//                         return null;
//                       },
//                       onSaved: (name) {},
//                       obscureText: false,
//                       decoration: InputDecoration(
//                         label: Text("phone"),
//                         contentPadding:
//                         EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             // color: Colors.grey[400],
//                             color: Colors.grey.shade500,
//                           ),
//                         ),
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey.shade500,
//                             )),
//                       ),
//                     )),
//                 Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 40,
//                     ),
//                     child: TextFormField(
//                       controller: _password,
//                       keyboardType: TextInputType.text,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Please enter a Password";
//                         }
//                         return null;
//                       },
//                       onSaved: (name) {},
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         label: Text("password"),
//                         contentPadding:
//                         EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             // color: Colors.grey[400],
//                             color: Colors.grey.shade500,
//                           ),
//                         ),
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey.shade500,
//                             )),
//                       ),
//                     )),
//                 Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 40,
//                     ),
//                     child: TextFormField(
//                       controller: _confirmpassword,
//                       keyboardType: TextInputType.text,
//                       obscureText: true,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Please enter re-password";
//                         }
//                         if (_password.text != _confirmpassword.text) {
//                           return "Password Do not match";
//                         }
//                         return null;
//                       },
//                       onSaved: (name) {},
//                       decoration: InputDecoration(
//                         label: Text("confirm password"),
//                         contentPadding:
//                         EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             // color: Colors.grey[400],
//                             color: Colors.grey.shade500,
//                           ),
//                         ),
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Colors.grey.shade500,
//                             )),
//                       ),
//                     )),
//
//
//
//
//
//
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height / 15,
//                   width: MediaQuery.of(context).size.width / 1.3,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.red.shade900,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30)),
//                     ),
//                     onPressed: () {
//                       if (formkey.currentState!.validate()) {
//                         setState(() {
//
//                         });
//                         _username.clear();
//                         _email.clear();
//                         _phone.clear();
//                         _password.clear();
//                         _confirmpassword.clear();
//                       }},
//                     child: Text(
//                       'Sign Up',
//                       style: TextStyle(color: Colors.white, fontSize: 35),
//                     ),
//                   ),
//                 ),
//
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Already have an account? "),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Admin_Login()));
//                       },
//                       child: Text(
//                         "Login",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600, fontSize: 18),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//
//             //],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// Widget makeInput({
//   label,
//   obsureText = false,
// }) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         label,
//         style: TextStyle(
//             fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
//       ),
//       SizedBox(
//         height: 5,
//       ),
//       TextFormField(
//         obscureText: obsureText,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               // color: Colors.grey[400],
//               color: Colors.grey.shade500,
//             ),
//           ),
//           border: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Colors.grey.shade500,
//               )),
//         ),
//       ),
//       SizedBox(
//         height: 30,
//       )
//     ],
//   );
// }
