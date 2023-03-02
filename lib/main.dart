import 'package:flutter/material.dart';

import 'Main_Screen/Main_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Main_screen(),
    );
  }
}


