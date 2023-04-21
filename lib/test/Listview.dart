import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Listvw extends StatefulWidget {
  const Listvw({Key? key}) : super(key: key);

  @override
  _ListvwState createState() => _ListvwState();
}

class _ListvwState extends State<Listvw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
       child: ListView(
         children: [
           // Padding(
           //   padding: const EdgeInsets.all(30.0),
           //   child: Container(
           //     color: Colors.teal,
           //       child: ListTile(
           //         title: Text("Name"),
           //         subtitle:Text("Age"),
           //         trailing:Icon(Icons.arrow_right_alt_rounded),
           //       )
           //   ),
           // ),
           // Padding(
           //   padding: const EdgeInsets.all(30.0),
           //   child: Container(
           //       color: Colors.teal,
           //       child: ListTile(
           //         title: Text("Name"),
           //         subtitle:Text("Age"),
           //         trailing:Icon(Icons.arrow_right_alt_rounded),
           //       )
           //   ),
           // ),
       Card (
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(20),
         ),
       margin: EdgeInsets.all(20),
        color: Colors.green[100],
        shadowColor: Colors.blueGrey,
        elevation: 10,
        child:
        // Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: <Widget>[
            ListTile(
              leading: Icon (
                  Icons.album,
                  color: Colors.cyan,
                  size: 45
              ),
              title: Text(
                "Let's Talk About Love",
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text('Modern Talking Album'),
            ),

         // ],
       // ),
      ),
           Card (
             margin: EdgeInsets.all(20),
             color: Colors.green[100],
             shadowColor: Colors.blueGrey,
             elevation: 10,
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 ListTile(
                   leading: Icon (
                       Icons.album,
                       color: Colors.cyan,
                       size: 45
                   ),
                   title: Text(
                     "Let's Talk About Love",
                     style: TextStyle(fontSize: 20),
                   ),
                   subtitle: Text('Modern Talking Album'),
                 ),

               ],
             ),
           ),

         ],
       ),
      ),
    );
  }
}
