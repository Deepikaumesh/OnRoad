import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../test/test_page_searchnbar.dart';
import 'Admin_Dashboard.dart';

class Admin_Main_dashboard extends StatefulWidget {
  const Admin_Main_dashboard({Key? key}) : super(key: key);

  @override
  _Admin_Main_dashboardState createState() => _Admin_Main_dashboardState();
}

class _Admin_Main_dashboardState extends State<Admin_Main_dashboard> {
  int currentIndex = 0;
  final screens = [
    Admin_Dashboard(  data_passing_admin: null,),
    testpagesearchbar(),
    Admin_Dashboard(  data_passing_admin: null,),
    Admin_Dashboard(  data_passing_admin: null,),
    // Hope_Admin_event_Display(),
    // donation_Display(),
    // Admin_View_Craftitem_(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // disable the animation
        backgroundColor: Colors.white,
        elevation: 4,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        //  iconSize: 40,
        selectedFontSize: 15,
        unselectedFontSize: 13,
        //  showSelectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'events',
            backgroundColor: Colors.blue,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_rounded),
            label: 'donations',
            backgroundColor: Colors.blue,
          ),

        ],
      ),
    );
  }

}
