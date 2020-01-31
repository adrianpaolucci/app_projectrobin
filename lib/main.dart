import 'package:flutter/material.dart';
import 'package:app_search_bar/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pediatric Dosing",
      home: Home(),
    );
  }
}
