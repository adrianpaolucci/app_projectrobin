import 'package:app_search_bar/blocs/theme.dart';
import 'package:app_search_bar/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';



pixelsToTextSize(pixel) {
    var textSize = 4*pixel/3;
    return textSize.roundToDouble();
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    Wakelock.enable();

    return MaterialAppWithTheme();
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SF-UI'
      ),
    debugShowCheckedModeBanner: false,
    title: "Pediatric Dosing",
    home: Home2(),
    );
  }
}

