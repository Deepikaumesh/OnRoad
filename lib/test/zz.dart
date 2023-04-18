// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:untitled/2.Work_Shop/View_workers.dart';
//
// import 'Edit_worker.dart';
//
// class Workers_detail extends StatelessWidget {
//   final passing_data;
//
//   const Workers_detail(this.passing_data);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           elevation: 0,
//        //   centerTitle: true,
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.cyan.shade50,
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 passing_data.mech_name,
//                 style: TextStyle(color: Colors.orange.shade900,fontSize: 17),
//               ),
//               Text(
//                 passing_data.email,
//                 style: TextStyle(color: Colors.indigo, fontSize: 12),
//               ),
//             ],
//           )),
//       body: SingleChildScrollView(
//           child: Column(
//         //  crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               Container(color: Colors.cyan.shade50, height: 250),
//               // Max stack size
//               Positioned(
//                 top: 10,
//                 left: 30,
//                 right: 30,
//                 height: 200,
//                 child: Material(
//                     // elevation: 8.0,
//                     borderRadius: BorderRadius.circular(20),
//                     child: Container(
//                       child: Image.asset(
//                         "assets/images/worker.png",
//                       ),
//                       height: 200,
//                       color: Colors.cyan.shade50,
//                     )),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//             Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Text(
//                 'Place',
//                 style: GoogleFonts.prompt(fontSize: 17),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Text(
//                 'Post',
//                 style: GoogleFonts.prompt(fontSize: 17),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Text(
//                 'Pin',
//                 style: GoogleFonts.prompt(fontSize: 17),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Text(
//                 'District',
//                 style: GoogleFonts.prompt(fontSize: 17),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Text(
//                 'Contact no',
//                 style: GoogleFonts.prompt(fontSize: 17),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Text(
//                 'Specification',
//                 style: GoogleFonts.prompt(fontSize: 17),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Text(
//                 'Available',
//                 style: GoogleFonts.prompt(fontSize: 17),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//             ]),
//             Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Text(passing_data.place, style: GoogleFonts.prompt(fontSize: 17)),
//               SizedBox(
//                 height: 40,
//               ),
//               Text(passing_data.post, style: GoogleFonts.prompt(fontSize: 17)),
//               SizedBox(
//                 height: 40,
//               ),
//               Text(passing_data.pin, style: GoogleFonts.prompt(fontSize: 17)),
//               SizedBox(
//                 height: 40,
//               ),
//               Text(passing_data.district,
//                   style: GoogleFonts.prompt(fontSize: 17)),
//               SizedBox(
//                 height: 40,
//               ),
//               Text(passing_data.contact_no,
//                   style: GoogleFonts.prompt(fontSize: 17)),
//               SizedBox(
//                 height: 40,
//               ),
//               Text(passing_data.specification,
//                   style: GoogleFonts.prompt(fontSize: 17)),
//               SizedBox(
//                 height: 40,
//               ),
//               Text(passing_data.available,
//                   style: GoogleFonts.prompt(fontSize: 17)),
//               SizedBox(
//                 height: 40,
//               ),
//             ])
//           ]),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                 style:  ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(Colors.green),
//                     padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50,vertical: 15)),
//                     textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),
//                   onPressed: (){
//                     Get.to(Edit_Worker(dat_user:passing_data.district ,
//                              passing_data.id,
//                         passing_data.mech_name,
//                             place: passing_data.place,
//                             post: passing_data.post,
//                             pin:passing_data.pin,
//                              passing_data.email,
//                              passing_data.contact_no,
//                             passing_data.specification,
//                         passing_data.available,
//                       passing_data.contact_no,
//                     ));
//
//                     // Get.to(Edit_Worker(data_user:worker_data_model(
//                   //     district:passing_data.district ,
//                   //     id: passing_data.id,
//                   //     mech_name: passing_data.mech_name,
//                   //     place: passing_data.place,
//                   //     post: passing_data.post,
//                   //     pin:passing_data.pin,
//                   //     email: passing_data.email,
//                   //     contact_no: passing_data.contact_no,
//                   //     specification:passing_data.specification,
//                   //     available: passing_data.available)
//                   // ));
//
//                   }, child: Text("Edit")),
//               ElevatedButton(
//                   style:  ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.red.shade700),
//                       padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50,vertical: 15)),
//                       textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),
//                   onPressed: (){}, child: Text("Delete")),
//             ],
//           ),SizedBox(height: 40,),
//
//         ],
//       ), // Column
//
//           ),
//     );
//   }
// }

// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:untitled/2.Work_Shop/View_workers.dart';
// //
// // import 'Edit_worker.dart';
// //
// // class Workers_detail extends StatelessWidget {
// //   final passing_data;
// //
// //   const Workers_detail(this.passing_data);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //           elevation: 0,
// //        //   centerTitle: true,
// //           automaticallyImplyLeading: false,
// //           backgroundColor: Colors.cyan.shade50,
// //           title: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 passing_data.mech_name,
// //                 style: TextStyle(color: Colors.orange.shade900,fontSize: 17),
// //               ),
// //               Text(
// //                 passing_data.email,
// //                 style: TextStyle(color: Colors.indigo, fontSize: 12),
// //               ),
// //             ],
// //           )),
// //       body: SingleChildScrollView(
// //           child: Column(
// //         //  crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Stack(
// //             children: [
// //               Container(color: Colors.cyan.shade50, height: 250),
// //               // Max stack size
// //               Positioned(
// //                 top: 10,
// //                 left: 30,
// //                 right: 30,
// //                 height: 200,
// //                 child: Material(
// //                     // elevation: 8.0,
// //                     borderRadius: BorderRadius.circular(20),
// //                     child: Container(
// //                       child: Image.asset(
// //                         "assets/images/worker.png",
// //                       ),
// //                       height: 200,
// //                       color: Colors.cyan.shade50,
// //                     )),
// //               ),
// //             ],
// //           ),
// //           SizedBox(
// //             height: 40,
// //           ),
// //           Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
// //             Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //               Text(
// //                 'Place',
// //                 style: GoogleFonts.prompt(fontSize: 17),
// //               ),
// //               SizedBox(
// //                 height: 40,
// //               ),
// //               Text(
// //                 'Post',
// //                 style: GoogleFonts.prompt(fontSize: 17),
// //               ),
// //               SizedBox(
// //                 height: 40,
// //               ),
// //               Text(
// //                 'Pin',
// //                 style: GoogleFonts.prompt(fontSize: 17),
// //               ),
// //               SizedBox(
// //                 height: 40,
// //               ),
// //               Text(
// //                 'District',
// //                 style: GoogleFonts.prompt(fontSize: 17),
// //               ),
// //               SizedBox(
// //                 height: 40,
// //               ),
// //               Text(
// //                 'Contact no',
// //                 style: GoogleFonts.prompt(fontSize: 17),
// //               ),
// //               SizedBox(
// //                 height: 40,
// //               ),
// //               Text(
// //                 'Specification',
// //                 style: GoogleFonts.prompt(fontSize: 17),
// //               ),
// //               SizedBox(
// //                 height: 40,
// //               ),
// //               Text(
// //                 'Available',
// //                 style: GoogleFonts.prompt(fontSize: 17),
// //               ),
// //               SizedBox(
// //                 height: 40,
// //               ),
// //             ]),
// //             Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //               Text(passing_data.place, style: GoogleFonts.prompt(fontSize: 17)),
// //               SizedBox(
// //                 height: 40,
// //               ),
// //               Text(passing_data.post, style: GoogleFonts.prompt(fontSize: 17)),
// //               SizedBox(
// //                 height: 40,
// //               ),
// //               Text(passing_data.pin, style: GoogleFonts.prompt(fontSize: 17)),
// //               SizedBox(
// //                 height: 40,
// //               ),
// //               Text(passing_data.district,
// //                   style: GoogleFonts.prompt(fontSize: 17)),
// //               SizedBox(
// //                 height: 40,
// //               ),
// //               Text(passing_data.contact_no,
// //                   style: GoogleFonts.prompt(fontSize: 17)),
// //               SizedBox(
// //                 height: 40,
// //               ),
// //               Text(passing_data.specification,
// //                   style: GoogleFonts.prompt(fontSize: 17)),
// //               SizedBox(
// //                 height: 40,
// //               ),
// //               Text(passing_data.available,
// //                   style: GoogleFonts.prompt(fontSize: 17)),
// //               SizedBox(
// //                 height: 40,
// //               ),
// //             ])
// //           ]),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //             children: [
// //               ElevatedButton(
// //                 style:  ButtonStyle(
// //                     backgroundColor: MaterialStateProperty.all(Colors.green),
// //                     padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50,vertical: 15)),
// //                     textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),
// //                   onPressed: (){
// //
// //
// //                     Get.to(Edit_Worker(data_user:worker_data_model(
// //                       district:passing_data.district ,
// //                       id: passing_data.id,
// //                       mech_name: passing_data.mech_name,
// //                       place: passing_data.place,
// //                       post: passing_data.post,
// //                       pin:passing_data.pin,
// //                       email: passing_data.email,
// //                       contact_no: passing_data.contact_no,
// //                       specification:passing_data.specification,
// //                       available: passing_data.available)
// //                   ));
// //
// //                   }, child: Text("Edit")),
// //               ElevatedButton(
// //                   style:  ButtonStyle(
// //                       backgroundColor: MaterialStateProperty.all(Colors.red.shade700),
// //                       padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50,vertical: 15)),
// //                       textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),
// //                   onPressed: (){}, child: Text("Delete")),
// //             ],
// //           ),SizedBox(height: 40,),
// //
// //         ],
// //       ), // Column
// //
// //           ),
// //     );
// //   }
// // }
