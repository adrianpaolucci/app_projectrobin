import 'package:app_search_bar/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    Wakelock.enable();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pediatric Dosing",
      home: Home2(),
    );
  }
}

