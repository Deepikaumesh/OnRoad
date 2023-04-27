import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/4.Customer/service_detailPage.dart';

import '../main.dart';
import 'package:http/http.dart' as http;

class Customer_Service_searchbar extends StatefulWidget {
  const Customer_Service_searchbar({Key? key}) : super(key: key);

  @override
  _Customer_Service_searchbarState createState() => _Customer_Service_searchbarState();
}

class _Customer_Service_searchbarState extends State<Customer_Service_searchbar> {


  List<Note> _notes = [];
  List<Note> _notesForDisplay =[];
  Future <List<Note>> fetchNotes() async{
    var url ="http://$ip/MySampleApp/ORBVA/Customer/Display_Service_Center.php";
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
        appBar: AppBar(title: Text("Search Services",style: GoogleFonts.prompt(color: Colors.blueGrey.shade900),),
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
              var city =note.city.toLowerCase();
              return city.contains(text);
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
            MaterialPageRoute(builder: (context)=>service_Detail_Page(data_pass: _notesForDisplay[index],)));
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
              leading: Container(
                height: 50,
                width: 50,
               // child: Text( _notesForDisplay[index].contact_no),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  //border: Border.all(color: Colors.blueGrey.shade900),
                  image: DecorationImage(
                    image: AssetImage('assets/images/customer-service.png',),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                _notesForDisplay[index].services,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lora(
                    fontSize: 15, color: Colors.blueGrey.shade900,fontWeight: FontWeight.bold),
              ),
              subtitle: Text(_notesForDisplay[index].city,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lora(
                    fontSize: 10, color: Colors.blueGrey.shade900,fontWeight: FontWeight.bold),
              ),
            trailing: InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>service_Detail_Page(data_pass: _notesForDisplay[index],)));
                },
                child: Icon(Icons.arrow_forward_ios_rounded)),

          )
      ),
    );
  }


}







List<Note> userModelFromJson(String str) => List<Note>.from(json.decode(str).map((x) => Note.fromJson(x)));

String userModelToJson(List<Note> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Note {
  Note({
    required this.service_name,
    required this.mech_name,
    required this.services,
    required this.available,
    required this.address,
    required this.city,
    required this.location,
    required this.mobile,
    required this.status,

  });


  String service_name;
  String mech_name;
  String services;
  String available;
  String address;
  String status;
  String city;
  String location;
  String mobile;



  factory Note.fromJson(Map<String, dynamic> json) => Note(
    service_name: json["service_name"],
    mech_name: json["mech_name"],
    services: json["services"],
    available: json["available"],
    address:  json["address"],
    city:  json["city"],
    status:  json["status"],
    location:  json["location"],
    mobile:  json["mobile"],

  );

  Map<String, dynamic> toJson() => {
    "service_name": service_name,
    "mech_name":mech_name,
    "services":services,
    "available": available,
    "address":address,
    "city":city,
    "status": status,
    "location":location,
    "mobile": mobile,


  };}
