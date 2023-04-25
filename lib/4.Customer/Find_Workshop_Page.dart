import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/4.Customer/workshop_detailPage.dart';

import '../main.dart';
import 'package:http/http.dart' as http;

class Customer_Workshop_searchbar extends StatefulWidget {
  const Customer_Workshop_searchbar({Key? key}) : super(key: key);

  @override
  _Customer_Workshop_searchbarState createState() => _Customer_Workshop_searchbarState();
}

class _Customer_Workshop_searchbarState extends State<Customer_Workshop_searchbar> {


  List<Note> _notes = [];
  List<Note> _notesForDisplay =[];
  Future <List<Note>> fetchNotes() async{
    var url ="http://$ip/MySampleApp/ORBVA/Customer/Display_workshops.php";
    var response = await http.get(Uri.parse(url));


    List <Note> notes = [];


    if (response.statusCode ==200) {
      var notesjson =json.decode(response.body);
      for(var notejson in notesjson){
        notes.add(Note.fromJson(notejson));
      }
    }return notes;
  }


  @override
  void initState(){
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
        _notesForDisplay = _notes;
      });

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Search Workshop",style: GoogleFonts.prompt(color: Colors.blueGrey.shade900),),
         automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return index == 0 ? _searchBar() :_listitem(index-1);

          },
          itemCount: _notesForDisplay.length+1,
        )
    );
  }

  _searchBar(){
    return Padding(padding: EdgeInsets.only(top: 5,left: 20,right: 20,bottom: 10),
      child: TextField(
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: new InputDecoration(
          border: new OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.teal),
            borderRadius: BorderRadius.circular(40),

          ),
          hintText: 'Search location',
        ),
        // decoration: InputDecoration(
        //     prefixIcon:Icon(Icons.search),
        //     hintText: 'Search Catagory....',
        //   border: InputBorder.none,
        // ),
        onChanged: (text) {
          text= text.toLowerCase();
          setState(() {
            _notesForDisplay = _notes.where((note) {
              var address =note.address.toLowerCase();
              return address.contains(text);
            }).toList();
          });
        },
      ),
    );
  }


  _listitem(index){

    return   InkWell(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>Workshop_Detail_Page(data_pass: _notesForDisplay[index],)));
      },
      child: Card(
          elevation: 5,
          color: Colors.grey.shade200,
          margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
              contentPadding: EdgeInsets.all(4.0),
              leading:CircleAvatar(
                radius: 30,
                backgroundColor: Colors.orange.shade200,
                child: Image.asset('assets/images/workshop.png',height: 40,width: 40,),

              ),
              title: Text(
                _notesForDisplay[index].name,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lora(
                    fontSize: 15, color: Colors.blueGrey.shade900,fontWeight: FontWeight.bold),
              ),
              subtitle: Text(_notesForDisplay[index].address,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lora(
                    fontSize: 10, color: Colors.blueGrey.shade900,fontWeight: FontWeight.bold),
              ),
            trailing: InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Workshop_Detail_Page(data_pass: _notesForDisplay[index],)));
                },
                child: Icon(Icons.arrow_forward_ios_rounded)),

          ),
      ),
    );
  }


}







List<Note> userModelFromJson(String str) => List<Note>.from(json.decode(str).map((x) => Note.fromJson(x)));

String userModelToJson(List<Note> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Note {
  Note({
    required this.name,
    required this.contact_no,
    required this.email_id,
    required this.location,
    required this.address,
    required this.license_no,
    required this.status,

  });


  String name;
  String contact_no;
  String email_id;
  String location;
  String address;
  String license_no;
  String status;


  factory Note.fromJson(Map<String, dynamic> json) => Note(
    name: json["name"],
    contact_no: json["contact_no"],
    email_id: json["email_id"],
    location: json["location"],
    address:  json["address"],
    license_no:  json["license_no"],
    status:  json["status"],

  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "contact_no":contact_no,
    "email_id":email_id,
    "location": location,
    "address":address,
    "license_no":license_no,
    "status": status,


  };}
