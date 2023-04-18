import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Approve_Reject_Workshop extends StatefulWidget {
  final data_pass;

  const Approve_Reject_Workshop({required this.data_pass});

  @override
  _Approve_Reject_WorkshopState createState() =>
      _Approve_Reject_WorkshopState();
}

class _Approve_Reject_WorkshopState extends State<Approve_Reject_Workshop> {
  TextEditingController Owner_name = TextEditingController();

  @override
  void initState() {
    //controllername= new TextEditingController(text: widget.list[widget.index]['name'] );
    Owner_name = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Approver or Reject Workshop",
          style: GoogleFonts.prompt(color: Colors.red.shade900),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Workshop"),
                    Text('${widget.data_pass.name}'),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: new TextFormField(
                    controller: Owner_name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter Owner_name";
                      }
                      return null;
                    },
                    onSaved: (name) {},
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Enter Owner_name",
                        label: Text('Owner_name'),
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red.shade900),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 20))),
                    onPressed: () {
                      setState(() {
                        // UpdateData();
                        // Navigator.of(context).pushReplacement(
                        //     new MaterialPageRoute(
                        //         builder: (BuildContext context) =>
                        //             Workshop_Dashboard(
                        //                 data_passing_workshop: null)));
                      });
                    },
                    child: Text("Submit")),
                SizedBox(
                  height: 20,
                ),
                Text('${widget.data_pass.name}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Box(
    String data,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 50,
      color: Colors.pink.shade50,
      child: Text(
        data,
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
      ),
    );
  }
}
