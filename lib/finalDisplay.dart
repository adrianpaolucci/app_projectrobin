import 'package:app_search_bar/intubation.dart';
import 'package:flutter/material.dart';
import 'package:app_search_bar/home2.dart';
import 'package:app_search_bar/dosing_main.dart';
import 'package:app_search_bar/data.dart';

class FinalDisplay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FinalDisplayState();
  }
}

class FinalDisplayState extends State<FinalDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Selections: ",
          style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white
      ),
      body: SingleChildScrollView(child: Center(child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: IntubationFinal(context)
      ),
      )
      )
    );
  }
}

IntubationFinal(BuildContext context) {
  var inductionWidgets = [ketamineDisplay(context),propofolDisplay(context),propofolDisplay(context),propofolDisplay(context),propofolDisplay(context)];
  var paralyticWidgets = [propofolDisplay(context),propofolDisplay(context),propofolDisplay(context),propofolDisplay(context),propofolDisplay(context),propofolDisplay(context)];
  List<Widget>intubationList = [];
  for (var i=0; i < inductionAgents.length; i++) {
    if (inductionBoolean[i] == true) {
      intubationList.add(inductionWidgets[i]);
      intubationList.add(Divider(thickness: 1.0, color: Colors.black));
    }
  }
  for (var i = 0; i < paralyticAgents.length; i++) {
    if (paralyticBoolean[i] == true) {
      intubationList.add(paralyticWidgets[i]);
      intubationList.add(Divider(thickness: 1.0, color: Colors.black));
    }
  }
  return intubationList;
}


ketamineDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = ketamineData[weightIndex];

  var popup = Column(children: <Widget>[
    Text("Ketamine", style: TextStyle(fontSize: 18.0, color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(5),
      color: Color(0xffa6a6a6),
      width: 0.9 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Dilution", style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold)),
            Text("${currentData[1]} mg in ${currentData[3]} mL"),
            Text("OR"),
            Text("${currentData[2]} mg in ${currentData[4]} mL"),
          ]
      ),
    ),
    Text.rich(TextSpan(text: "", children:
    <TextSpan>[
      TextSpan(text: "Administer ${currentData[3]} - ${currentData[4]} mL of diluted solution",
          style: TextStyle(decoration: TextDecoration.underline)),
      TextSpan(text: "")
    ])),
    SizedBox(height: 30)]);
  return popup;
}

propofolDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = propofolData[weightIndex];

  var popup = Column(children: <Widget>[
    Text("Propofol", style: TextStyle(fontSize: 18.0, color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(5),
      color: Color(0xffa6a6a6),
      width: 0.7 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${currentData[1]} mg in ${currentData[2]} mL"),
            Text("Undiluted", style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold)),
          ]
      ),
    ),
    Text.rich(TextSpan(text: "", children:
    <TextSpan>[
      TextSpan(text: "Administer ${currentData[2]} mL of undiluted\n solution",
          style: TextStyle(decoration: TextDecoration.underline)),
      TextSpan(text: "")
    ])),
    SizedBox(height: 15)]);
  return popup;
}