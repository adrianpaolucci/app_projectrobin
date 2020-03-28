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

final inductionAgents = ["Ketamine","Propofol","Thiopentone","Fentanyl (Bolus)","Midazolam", "Fentanyl (Infusion)"];
final inductionBoolean = [false,false,false,false,false,false];

final paralyticAgents = ["Suxamethonium","Rocuronium","Vecuronium","Pancuronoium","Atracurium","Cisatracurium"];
final paralyticBoolean = [false,false,false,false,false,false];

final ketamineData = [[2, 2, 4, 0.2, 0.4], [2.5, 2.5, 5.0, 0.25, 0.5], [3, 3, 6, 0.3, 0.6], [3.5, 3.5, 7.0, 0.35, 0.7], [4, 4, 8, 0.4, 0.8], [4.5, 4.5, 9.0, 0.45, 0.9], [5, 5, 10, 0.5, 1.0], [5.5, 5.5, 11, 0.55, 1.1],[6, 6, 12, 0.6, 1.2], [7, 7, 14, 0.7, 1.4], [8, 8, 16, 0.8, 1.6], [9, 9, 18, 0.9, 1.8], [10, 10, 20, 1.0, 2.0], [11, 11, 22, 1.1, 2.2], [12, 12, 24, 1.2, 2.4], [13, 13, 26, 1.3, 2.6], [14, 14, 28, 1.4, 2.8], [15, 15, 30, 1.5, 3.0], [16, 16, 32, 1.6, 3.2], [17, 17, 34, 1.7, 3.4], [18, 18, 36, 1.8, 3.6], [19, 19, 38, 1.9, 3.8], [20, 20, 40, 2.0, 4.0], [22, 22, 44, 2.2, 4.4], [24, 24, 48, 2.40000, 4.8], [26, 26, 52, 2.6, 5.2], [28, 28, 56, 2.8, 5.6], [30, 30, 60, 3.0, 6.0], [35, 35, 70, 3.5, 7.0], [40, 40, 80, 4.0, 8.0], [45, 45, 90, 4.5, 9.0], [50, 50, 100, 5.0, 10.0], [55, 55, 110, 5.5, 11.0], [60, 60, 120, 6.0, 12.0], [65, 65, 130, 6.5, 13.0], [70, 70, 140, 7.0, 14.0], [75, 75, 150, 7.5, 15.0], [80, 80, 160, 8.0, 16.0]];
final propofolData = [[2, 'NA', 'NA'], [2.5, 'NA', 'NA'], [3, 'NA', 'NA'], [3.5, 'NA', 'NA'], [4, 'NA', 'NA'], [4.5, 'NA', 'NA'], [5, 'NA', 'NA'], [5.5, 'NA', 'NA'], [6, 'NA', 'NA'], [7, 'NA', 'NA'], [8, 'NA', 'NA'], [9, 'NA', 'NA'], [10, 20, 2.0], [11, 22, 2.2], [12, 24, 2.4], [13, 26, 2.6], [14, 28, 2.8], [15, 30, 3.0], [16, 32, 3.2], [17, 34, 3.4], [18, 36, 3.6], [19, 38, 3.8], [20, 40, 4.0], [22, 44, 4.4], [24, 48, 4.8], [26, 52, 5.2], [28, 56, 5.6], [30, 60, 6.0], [35, 70, 7.0], [40, 80, 8.0], [45, 90, 9.0], [50, 100, 10.0], [55, 110, 11.0], [60, 120, 12.0], [65, 130, 13.0], [70, 140, 14.0], [75, 150, 15.0], [80, 160, 16.0]];
final thiopentoneData = [[2, 4, 8, 0.16, 0.32], [2.5, 5.0, 10.0, 0.2, 0.4], [3, 6, 12, 0.24, 0.48], [3.5, 7.0, 14.0, 0.28, 0.56], [4, 8, 16, 0.32, 0.64], [4.5, 9.0, 18.0, 0.36, 0.72], [5, 10, 20, 0.4, 0.8], [5.5, 11.0, 22.0, 0.44, 0.88], [6, 12, 24, 0.48, 0.96], [7, 14, 28, 0.56, 1.12], [8, 16, 32, 0.64, 1.28], [9, 18, 36, 0.72, 1.44], [10, 20, 40, 0.8, 1.6], [11, 22, 44, 0.88, 1.76], [12, 24, 48, 0.96, 1.92], [13, 26, 52, 1.04, 2.08], [14, 28, 56, 1.12, 2.24], [15, 30, 60, 1.2, 2.4], [16, 32, 64, 1.28, 2.56], [17, 34, 68, 1.36, 2.72], [18, 36, 72, 1.44, 2.88], [19, 38, 76, 1.52, 3.04], [20, 40, 80, 1.6, 3.2], [22, 44, 88, 1.76, 3.52], [24, 48, 96, 1.92, 3.84], [26, 52, 104, 2.08, 4.16], [28, 56, 112, 2.24, 4.48], [30, 60, 120, 2.4, 4.8], [35, 70, 140, 2.8, 5.6], [40, 80, 160, 3.2, 6.4], [45, 90, 180, 3.6, 7.2], [50, 100, 200, 4.0, 8.0], [55, 110, 220, 4.4, 8.8], [60, 120, 240, 4.8, 9.6], [65, 130, 260, 5.2, 10.4], [70, 140, 280, 5.6, 11.2], [75, 150, 300, 6.0, 12.0], [80, 160, 320, 6.4, 12.8]];
final fentanylBolusData = [[2, 4, 8, 0.4, 0.8], [2.5, 5.0, 10.0, 0.5, 1.0], [3, 6, 12, 0.6, 1.2], [3.5, 7.0, 14.0, 0.7, 1.4], [4, 8, 16, 0.8, 1.6], [4.5, 9.0, 18.0, 0.9, 1.8], [5, 10, 20, 1.0, 2.0], [5.5, 11.0, 22.0, 1.1, 2.2], [6, 12, 24, 1.2, 2.4], [7, 14, 28, 1.4, 2.8], [8, 16, 32, 1.6, 3.2], [9, 18, 36, 1.8, 3.6], [10, 20, 40, 2.0, 4.0], [11, 22, 44, 2.2, 4.4], [12, 24, 48, 2.4, 4.8], [13, 26, 52, 2.6, 5.2], [14, 28, 56, 2.8, 5.6], [15, 30, 60, 3.0, 6.0], [16, 32, 64, 3.2, 6.4], [17, 34, 68, 3.4, 6.8], [18, 36, 72, 3.6, 7.2], [19, 38, 76, 3.8, 7.6], [20, 40, 80, 4.0, 8.0], [22, 44, 88, 4.4, 8.8], [24, 48, 96, 4.8, 9.6], [26, 52, 104, 5.2, 10.4], [28, 56, 112, 5.6, 11.2], [30, 60, 120, 6.0, 12.0], [35, 70, 140, 7.0, 14.0], [40, 80, 160, 8.0, 16.0], [45, 90, 180, 9.0, 18.0], [50, 100, 200, 10.0, 20.0], [55, 110, 220, 11.0, 22.0], [60, 120, 240, 12.0, 24.0], [65, 130, 260, 13.0, 26.0], [70, 140, 280, 14.0, 28.0], [75, 150, 300, 15.0, 30.0], [80, 160, 320, 16.0, 32.0]];
final midazolamData = [[2, 0.2, 0.4, 'Dilute 5 mg to 5 mL', 0.2, 0.4], [2.5, 0.25, 0.5, 'Dilute 5 mg to 5 mL', 0.25, 0.5], [3, 0.3, 0.6, 'Dilute 5 mg to 5 mL', 0.3, 0.6], [3.5, 0.35, 0.7, 'Dilute 5 mg to 5 mL', 0.35, 0.7], [4, 0.4, 0.8, 'Dilute 5 mg to 5 mL', 0.4, 0.8], [4.5, 0.45, 0.9, 'Dilute 5 mg to 5 mL', 0.45, 0.9], [5, 0.5, 1.0, 'Dilute 5 mg to 5 mL', 0.5, 1.0], [5.5, 0.55, 1.1, 'Dilute 5 mg to 5 mL', 0.55, 1.1], [6, 0.6, 1.2, 'Dilute 5 mg to 5 mL', 0.6, 1.2], [7, 0.7, 1.4, 'Dilute 5 mg to 5 mL', 0.7, 1.4], [8, 0.8, 1.6, 'Dilute 5 mg to 5 mL', 0.8, 1.6], [9, 0.9, 1.8, 'Dilute 5 mg to 5 mL', 0.9, 1.8], [10, 1.0, 2.0, 'Dilute 5 mg to 5 mL', 1.0, 2.0], [11, 1.1, 2.2, 'Dilute 5 mg to 5 mL', 1.1, 2.2], [12, 1.2, 2.4, 'Dilute 5 mg to 5 mL', 1.2, 2.4], [13, 1.3, 2.6, 'Dilute 5 mg to 5 mL', 1.3, 2.6], [14, 1.4, 2.8, 'Dilute 5 mg to 5 mL', 1.4, 2.8], [15, 1.5, 3.0, 'Dilute 5 mg to 5 mL', 1.5, 3.0], [16, 1.6, 3.2, 'Dilute 5 mg to 5 mL', 1.6, 3.2], [17, 1.7, 3.4, 'Dilute 5 mg to 5 mL', 1.7, 3.4], [18, 1.8, 3.6, 'Dilute 5 mg to 5 mL', 1.8, 3.6], [19, 1.9, 3.8, 'Dilute 5 mg to 5 mL', 1.9, 3.8], [20, 2.0, 4.0, 'Dilute 5 mg to 5 mL', 2.0, 4.0], [22, 2.2, 4.4, 'Dilute 5 mg to 5 mL', 2.2, 4.4], [24, 2.4, 4.8, 'Dilute 5 mg to 5 mL', 2.4, 4.8], [26, 2.6, 5.2, 'Dilute 5 mg to 5 mL', 2.6, 5.2], [28, 2.8, 5.6, 'Dilute 5 mg to 5 mL', 2.8, 5.6], [30, 3.0, 6.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 3.0, 6.0], [35, 3.5, 7.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 3.5, 7.0], [40, 4.0, 8.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 4.0, 8.0], [45, 4.5, 9.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 4.5, 9.0], [50, 5.0, 10.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 5.0, 10.0], [55, 5.5, 11.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 5.5, 11.0], [60, 6.0, 12.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 6.0, 12.0], [65, 6.5, 13.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 6.5, 13.0], [70, 7.0, 14.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 7.0, 14.0], [75, 7.5, 15.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 7.5, 15.0], [80, 8.0, 16.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 8.0, 16.0]];
final fentanylInfusionData = [[2, 200, 50, 1, 2, 2, 4], [2.5, 250.0, 50, 1, 2, 2, 4], [3, 300, 50, 1, 2, 2, 4], [3.5, 350.0, 50, 1, 2, 2, 4], [4, 400, 50, 1, 2, 2, 4], [4.5, 450.0, 50, 1, 2, 2, 4], [5, 500, 50, 1, 2, 2, 4], [5.5, 550.0, 50, 1, 2, 2, 4], [6, 600, 50, 1, 2, 2, 4], [7, 700, 50, 1, 2, 2, 4], [8, 800, 50, 1, 2, 2, 4], [9, 900, 50, 1, 2, 2, 4], [10, 500, 10, 1.0, 2.0, 5, 10], [11, 500, 10, 1.1, 2.2, 5, 10], [12, 500, 10, 1.2, 2.4, 5, 10], [13, 500, 10, 1.3, 2.6, 5, 10], [14, 500, 10, 1.4, 2.8, 5, 10], [15, 500, 10, 1.5, 3.0, 5, 10], [16, 500, 10, 1.6, 3.2, 5, 10], [17, 500, 10, 1.7, 3.4, 5, 10], [18, 500, 10, 1.8, 3.6, 5, 10], [19, 500, 10, 1.9, 3.8, 5, 10], [20, 500, 10, 2.0, 4.0, 5, 10], [22, 500, 10, 2.2, 4.4, 5, 10], [24, 500, 10, 2.4, 4.8, 5, 10], [26, 500, 10, 2.6, 5.2, 5, 10], [28, 500, 10, 2.8, 5.6, 5, 10], [30, 500, 10, 3.0, 6.0, 5, 10], [35, 500, 10, 3.5, 7.0, 5, 10], [40, 500, 10, 4.0, 8.0, 5, 10], [45, 500, 10, 4.5, 9.0, 5, 10], [50, 500, 10, 5.0, 10.0, 5, 10], [55, 500, 10, 5.5, 11.0, 5, 10], [60, 500, 10, 6.0, 12.0, 5, 10], [65, 500, 10, 6.5, 13.0, 5, 10], [70, 500, 10, 7.0, 14.0, 5, 10], [75, 500, 10, 7.5, 15.0, 5, 10], [80, 500, 10, 8.0, 16.0, 5, 10]];




