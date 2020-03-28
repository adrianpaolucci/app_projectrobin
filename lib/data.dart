import 'package:flutter/cupertino.dart';
import 'package:app_search_bar/home2.dart';
import 'dart:io';

class IntubationAgent {

  String type;
  String name;
  String value;
  bool boolean;
  IntubationAgent({ this.type, this.name, this.value, this.boolean });

}

List<IntubationAgent> allAgents = [
  IntubationAgent(type: "Induction",name: "Ketamine", value: "3.5 to 7.5 mg", boolean: false),
  IntubationAgent(type: "Induction",name: "Propofol", value: "3.5 - 7.5 mg", boolean: false),
  IntubationAgent(type: "Induction",name: "Thiopentone", value: "8.8 - 17.5 mg", boolean: false),
  IntubationAgent(type: "Induction",name: "Fentanyl", value: "7 μg", boolean: false),
  IntubationAgent(type: "Induction",name: "Midazolam", value: "0.35 mg", boolean: false),
  IntubationAgent(type: "Paralytic",name: "Suxamethonium", value: "3.5 - 7.5 mg", boolean: false),
  IntubationAgent(type: "Paralytic",name: "Roceronium", value: "3.5 - 7.5 mg", boolean: false),
  IntubationAgent(type: "Paralytic",name: "Vecuronium", value: "3.5 - 7.5 mg", boolean: false)
];

List ketamineSublist = [];
List fentanylSublist = [];
List thiopentoneSublist = [];
List propofolSublist = [];
List midazolamSublist = [];
List suxamethoniumSublist = [];
List roceroniumSublist = [];
List vecuroniumSublist = [];

int inductionList() {

  for (var i = 0; i < allWeights.length ; i++) {
    var tempWeight = allWeights[i];

    var dosageAmount = "$tempWeight mg";
    var dilAmount = "$tempWeight mg in ${tempWeight*100} mL";
    var tempList = [dosageAmount,dilAmount, false];
    ketamineSublist.add(tempList);
  }
  return 0;
}

var ketamine = {
'name' : "Ketamine",
'dosages' : ["3.5 to 7.5 mg" ,"3.5 to 7.5 mg", "3.5 to 7.5 mg", "3.5 to 7.5 mg"],
'dilution' : ["25 mg in 250 mL", "30 mg in 300 mL", "35 mg in 350 mL","40 mg in 400 mL"],
};

var intubationMap = {
  'ketamine' : ketamine,
    'propofol' : {
      'name' : "Propofol",
      'value' : ["3.5 to 7.5 mg" ,"3.5 to 7.5 mg", "3.5 to 7.5 mg", "3.5 to 7.5 mg"],
      'dilution' : ["25 mg in 250 mL", "30 mg in 300 mL", "35 mg in 350 mL","40 mg in 400 mL"],
    },
  'thiopentone' : {
    'name' : "Thiopentone",
    'value' : ["3.5 to 7.5 mg" ,"3.5 to 7.5 mg", "3.5 to 7.5 mg", "3.5 to 7.5 mg"],
    'dilution' : ["25 mg in 250 mL", "30 mg in 300 mL", "35 mg in 350 mL","40 mg in 400 mL"],
  },
  'fentanyl' : {
    'name' : "Fentanyl",
    'value' : ["3.5 to 7.5 mg" ,"3.5 to 7.5 mg", "3.5 to 7.5 mg", "3.5 to 7.5 mg"],
    'dilution' : ["25 mg in 250 mL", "30 mg in 300 mL", "35 mg in 350 mL","40 mg in 400 mL"],
  },
  'midazolam' : {
    'name' : "Midazolam",
    'value' : ["3.5 to 7.5 mg" ,"3.5 to 7.5 mg", "3.5 to 7.5 mg", "3.5 to 7.5 mg"],
    'dilution' : ["25 mg in 250 mL", "30 mg in 300 mL", "35 mg in 350 mL","40 mg in 400 mL"],
  },
};

final inductionAgents = ["Ketamine","Propofol","Thiopentone","Fentanyl","Midazolam"];
final inductionBoolean = [false,false,false,false,false];

final paralyticAgents = ["Suxamethonium","Rocuronium","Vecuronium","Pancuronoium","Atracurium","Cisatracurium"];
final paralyticBoolean = [false,false,false,false,false,false];

final ketamineData = [[2, 2, 4, 0.2, 0.4], [2.5, 2.5, 5.0, 0.25, 0.5], [3, 3, 6, 0.3, 0.6], [3.5, 3.5, 7.0, 0.35, 0.7], [4, 4, 8, 0.4, 0.8], [4.5, 4.5, 9.0, 0.45, 0.9], [5, 5, 10, 0.5, 1.0], [5.5, 5.5, 11, 0.55, 1.1],[6, 6, 12, 0.6, 1.2], [7, 7, 14, 0.7, 1.4], [8, 8, 16, 0.8, 1.6], [9, 9, 18, 0.9, 1.8], [10, 10, 20, 1.0, 2.0], [11, 11, 22, 1.1, 2.2], [12, 12, 24, 1.2, 2.4], [13, 13, 26, 1.3, 2.6], [14, 14, 28, 1.4, 2.8], [15, 15, 30, 1.5, 3.0], [16, 16, 32, 1.6, 3.2], [17, 17, 34, 1.7, 3.4], [18, 18, 36, 1.8, 3.6], [19, 19, 38, 1.9, 3.8], [20, 20, 40, 2.0, 4.0], [22, 22, 44, 2.2, 4.4], [24, 24, 48, 2.40000, 4.8], [26, 26, 52, 2.6, 5.2], [28, 28, 56, 2.8, 5.6], [30, 30, 60, 3.0, 6.0], [35, 35, 70, 3.5, 7.0], [40, 40, 80, 4.0, 8.0], [45, 45, 90, 4.5, 9.0], [50, 50, 100, 5.0, 10.0], [55, 55, 110, 5.5, 11.0], [60, 60, 120, 6.0, 12.0], [65, 65, 130, 6.5, 13.0], [70, 70, 140, 7.0, 14.0], [75, 75, 150, 7.5, 15.0], [80, 80, 160, 8.0, 16.0]];
final propofolData = [[2, 'NA', 'NA'], [2.5, 'NA', 'NA'], [3, 'NA', 'NA'], [3.5, 'NA', 'NA'], [4, 'NA', 'NA'], [4.5, 'NA', 'NA'], [5, 'NA', 'NA'], [5.5, 'NA', 'NA'], [6, 'NA', 'NA'], [7, 'NA', 'NA'], [8, 'NA', 'NA'], [9, 'NA', 'NA'], [10, 20, 2.0], [11, 22, 2.2], [12, 24, 2.4], [13, 26, 2.6], [14, 28, 2.8], [15, 30, 3.0], [16, 32, 3.2], [17, 34, 3.4], [18, 36, 3.6], [19, 38, 3.8], [20, 40, 4.0], [22, 44, 4.4], [24, 48, 4.8], [26, 52, 5.2], [28, 56, 5.6], [30, 60, 6.0], [35, 70, 7.0], [40, 80, 8.0], [45, 90, 9.0], [50, 100, 10.0], [55, 110, 11.0], [60, 120, 12.0], [65, 130, 13.0], [70, 140, 14.0], [75, 150, 15.0], [80, 160, 16.0]];

ketaminePopup(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = ketamineData[weightIndex];

  var popup = Column(children: <Widget>[
    Text("Ketamine", style: TextStyle(fontSize: 18.0, color: Color(0xff000000), fontWeight: FontWeight.bold)),
  Container(padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(5),
  color: Color(0xffa6a6a6),
  width: 0.7 * data.size.width,
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
  SizedBox(height: 15)]);
  return popup;
}






