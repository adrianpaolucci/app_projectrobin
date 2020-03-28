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





