import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'all_sizings.dart';


final asthmaDrugs = ["Inhaled Salbutamol","Inhaled Ipratropium","IV Magnesium","IV Aminophyline","Adrenaline"];
final asthmaCorticos = ["Methylprednisolone","Dexamethasone","Hydrocortisone","Prednisolone"];

final asthmaDrugBoolean = [false,false,false,false,false];
final asthmaCorticoBoolean = [false,false,false,false];

final inhaledSalbutamolData = [[2, 'Not Available', 'Not Available'], [2.5, 'Not Available', 'Not Available'], [3, 'Not Available', 'Not Available'], [3.5, 'Not Available', 'Not Available'], [4, 'Not Available', 'Not Available'], [4.5, 'Not Available', 'Not Available'], [5, 'Not Available', 'Not Available'], [5.5, 'Not Available', 'Not Available'], [6, 'Not Available', 'Not Available'], [7, 'Not Available', 'Not Available'], [8, 'Not Available', 'Not Available'], [9, 'Not Available', 'Not Available'], [10, 6, 2.5], [11, 6, 2.5], [12, 6, 2.5], [13, 6, 2.5], [14, 6, 2.5], [15, 6, 2.5], [16, 6, 2.5], [17, 6, 2.5], [18, 6, 2.5], [19, 6, 2.5], [20, 12, 5], [22, 12, 5], [24, 12, 5], [26, 12, 5], [28, 12, 5], [30, 12, 5], [35, 12, 5], [40, 12, 5], [45, 12, 5], [50, 12, 5], [55, 12, 5], [60, 12, 5], [65, 12, 5], [70, 12, 5], [75, 12, 5], [80, 12, 5]];
final inhaledIpratropiumData = [[2, 'Not Available', 'Not Available'], [2.5, 'Not Available', 'Not Available'], [3, 'Not Available', 'Not Available'], [3.5, 'Not Available', 'Not Available'], [4, 'Not Available', 'Not Available'], [4.5, 'Not Available', 'Not Available'], [5, 'Not Available', 'Not Available'], [5.5, 'Not Available', 'Not Available'], [6, 'Not Available', 'Not Available'], [7, 'Not Available', 'Not Available'], [8, 'Not Available', 'Not Available'], [9, 'Not Available', 'Not Available'], [10, 4, 250], [11, 4, 250], [12, 4, 250], [13, 4, 250], [14, 4, 250], [15, 4, 250], [16, 4, 250], [17, 4, 250], [18, 4, 250], [19, 4, 250], [20, 8, 500], [22, 8, 500], [24, 8, 500], [26, 8, 500], [28, 8, 500], [30, 8, 500], [35, 8, 500], [40, 8, 500], [45, 8, 500], [50, 8, 500], [55, 8, 500], [60, 8, 500], [65, 8, 500], [70, 8, 500], [75, 8, 500], [80, 8, 500]];
final ivMagnesiumData = [[2, 'Not Available', 'Not Available', 'Not Available'], [2.5, 'Not Available', 'Not Available', 'Not Available'], [3, 'Not Available', 'Not Available', 'Not Available'], [3.5, 'Not Available', 'Not Available', 'Not Available'], [4, 'Not Available', 'Not Available', 'Not Available'], [4.5, 'Not Available', 'Not Available', 'Not Available'], [5, 'Not Available', 'Not Available', 'Not Available'], [5.5, 'Not Available', 'Not Available', 'Not Available'], [6, 'Not Available', 'Not Available', 'Not Available'], [7, 'Not Available', 'Not Available', 'Not Available'], [8, 'Not Available', 'Not Available', 'Not Available'], [9, 'Not Available', 'Not Available', 'Not Available'], [10, 500, 1.0, 12.5], [11, 550, 1.1, 13.75], [12, 600, 1.2, 15.0], [13, 650, 1.3, 16.25], [14, 700, 1.4, 17.5], [15, 750, 1.5, 18.75], [16, 800, 1.6, 20.0], [17, 850, 1.7, 21.25], [18, 900, 1.8, 22.5], [19, 950, 1.9, 23.75], [20, 1000, 2.0, 25.0], [22, 1100, 2.2, 27.5], [24, 1200, 2.4, 30.0], [26, 1300, 2.6, 32.5], [28, 1400, 2.8, 35.0], [30, 1500, 3.0, 37.5], [35, 1750, 3.5, 43.75], [40, 2000, 4.0, 50.0], [45, 2250, 4.5, 50], [50, 2500, 5.0, 50], [55, 2750, 5.5, 50], [60, 3000, 6.0, 50], [65, 3250, 6.5, 50], [70, 3500, 7.0, 50], [75, 3750, 7.5, 50], [80, 4000, 8.0, 50]];
final ivAminophylineData = [[2, 'Not Available', 'Not Available'], [2.5, 'Not Available', 'Not Available'], [3, 'Not Available', 'Not Available'], [3.5, 'Not Available', 'Not Available'], [4, 'Not Available', 'Not Available'], [4.5, 'Not Available', 'Not Available'], [5, 'Not Available', 'Not Available'], [5.5, 'Not Available', 'Not Available'], [6, 'Not Available', 'Not Available'], [7, 'Not Available', 'Not Available'], [8, 'Not Available', 'Not Available'], [9, 'Not Available', 'Not Available'], [10, 50, 50], [11, 55, 55], [12, 60, 60], [13, 65, 65], [14, 70, 70], [15, 75, 75], [16, 80, 80], [17, 85, 85], [18, 90, 90], [19, 95, 95], [20, 100, 100], [22, 110, 110], [24, 120, 120], [26, 130, 130], [28, 140, 140], [30, 150, 150], [35, 175, 175], [40, 200, 200], [45, 225, 225], [50, 250, 250], [55, 275, 275], [60, 300, 300], [65, 325, 325], [70, 350, 350], [75, 375, 375], [80, 400, 400]];
final asthmaAdrenalineData = [[2, 'Not Available'], [2.5, 'Not Available'], [3, 'Not Available'], [3.5, 'Not Available'], [4, 'Not Available'], [4.5, 'Not Available'], [5, 'Not Available'], [5.5, 'Not Available'], [6, 'Not Available'], [7, 'Not Available'], [8, 'Not Available'], [9, 'Not Available'], [10, 0.1], [11, 0.11], [12, 0.12], [13, 0.13], [14, 0.14], [15, 0.15], [16, 0.16], [17, 0.17], [18, 0.18], [19, 0.19], [20, 0.2], [22, 0.22], [24, 0.24], [26, 0.26], [28, 0.28], [30, 0.3], [35, 0.35], [40, 0.4], [45, 0.45], [50, 0.5], [55, 0.5], [60, 0.5], [65, 0.5], [70, 0.5], [75, 0.5], [80, 0.5]];

final methylprednisoloneData = [[2, 4, 2], [2.5, 5.0, 2.5], [3, 6, 3], [3.5, 7.0, 3.5], [4, 8, 4], [4.5, 9.0, 4.5], [5, 10, 5], [5.5, 11.0, 5.5], [6, 12, 6], [7, 14, 7], [8, 16, 8], [9, 18, 9], [10, 20, 10], [11, 22, 11], [12, 24, 12], [13, 26, 13], [14, 28, 14], [15, 30, 15], [16, 32, 16], [17, 34, 17], [18, 36, 18], [19, 38, 19], [20, 40, 20], [22, 44, 22], [24, 48, 24], [26, 52, 26], [28, 56, 28], [30, 60, 30], [35, 70, 35], [40, 80, 40], [45, 90, 45], [50, 100, 50], [55, 110, 55], [60, 120, 60], [65, 130, 60], [70, 140, 60], [75, 150, 60], [80, 160, 60]];
final dexamethasoneData = [[2, 0.6, 1.2], [2.5, 0.75, 1.5], [3, 0.9, 1.8], [3.5, 1.05, 2.1], [4, 1.2, 2.4], [4.5, 1.35, 2.7], [5, 1.5, 3.0], [5.5, 1.65, 3.3], [6, 1.8, 3.6], [7, 2.1, 4.2], [8, 2.4, 4.8], [9, 2.7, 5.4], [10, 3.0, 6.0], [11, 3.3, 6.6], [12, 3.6, 7.2], [13, 3.9, 7.8], [14, 4.2, 8.4], [15, 4.5, 9.0], [16, 4.8, 9.6], [17, 5.1, 10.2], [18, 5.4, 10.8], [19, 5.7, 11.4], [20, 6.0, 12.0], [22, 6.6, 13.2], [24, 7.2, 14.4], [26, 7.8, 15.6], [28, 8.4, 16.8], [30, 9.0, 18.0], [35, 10.5, 21.0], [40, 12.0, 24.0], [45, 13.5, 27.0], [50, 15.0, 30.0], [55, 16.5, 33.0], [60, 18.0, 36.0], [65, 19.5, 39.0], [70, 21.0, 42.0], [75, 22.5, 45.0], [80, 24.0, 48.0]];
final hydrocortisoneData = [[2, 16, 8], [2.5, 20.0, 10.0], [3, 24, 12], [3.5, 28.0, 14.0], [4, 32, 16], [4.5, 36.0, 18.0], [5, 40, 20], [5.5, 44.0, 22.0], [6, 48, 24], [7, 56, 28], [8, 64, 32], [9, 72, 36], [10, 80, 40], [11, 88, 44], [12, 96, 48], [13, 104, 52], [14, 112, 56], [15, 120, 60], [16, 128, 64], [17, 136, 68], [18, 144, 72], [19, 152, 76], [20, 160, 80], [22, 176, 88], [24, 192, 96], [26, 208, 104], [28, 224, 112], [30, 240, 120], [35, 280, 140], [40, 320, 160], [45, 360, 180], [50, 400, 200], [55, 440, 220], [60, 480, 240], [65, 520, 260], [70, 560, 280], [75, 600, 300], [80, 640, 300]];
final prednisoloneData = [[2, 4, 2], [2.5, 5.0, 2.5], [3, 6, 3], [3.5, 7.0, 3.5], [4, 8, 4], [4.5, 9.0, 4.5], [5, 10, 5], [5.5, 11.0, 5.5], [6, 12, 6], [7, 14, 7], [8, 16, 8], [9, 18, 9], [10, 20, 10], [11, 22, 11], [12, 24, 12], [13, 26, 13], [14, 28, 14], [15, 30, 15], [16, 32, 16], [17, 34, 17], [18, 36, 18], [19, 38, 19], [20, 40, 20], [22, 44, 22], [24, 48, 24], [26, 50, 26], [28, 50, 28], [30, 50, 30], [35, 50, 35], [40, 50, 40], [45, 50, 45], [50, 50, 50], [55, 50, 50], [60, 50, 50], [65, 50, 50], [70, 50, 50], [75, 50, 50], [80, 50, 50]];

inhaledSalbutamolDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = inhaledSalbutamolData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Inhaled Salbutamol", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(),color: Color(0xffa6a6a6),),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${currentData[1]} puffs of MDI with spacer repeated every 20 - 30 min",
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("OR"),
            SizedBox(height: 5),
            Text("${currentData[2]} mg nebulised Salbutamol",
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold))
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

inhaledIpratropiumDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = inhaledIpratropiumData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Inhaled Ipratropium", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(),color: Color(0xffa6a6a6),),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${currentData[1]} puffs of MDI with spacer\n3 times in the first hour,\nthen 4-6 puffs hourly",
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("OR"),
            SizedBox(height: 5),
            Text("${currentData[2]} μg nebulised Ipratropium",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: size16Text(context), fontWeight: FontWeight.bold))
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

ivMagnesiumDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = ivMagnesiumData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("IV Magnesium", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(),color: Color(0xffa6a6a6),),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("50 mg/kg (0.1 mL/kg of 50% MgSO4)"),
            SizedBox(height: 5),
            Text("${currentData[1]} mg (or ${currentData[2]} mL)",style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("of 50% MgSO4 diluted to at least ${currentData[3]} mL"),
            Text("given over 20 minutes")
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

ivAminophyllineDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = ivAminophylineData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("IV Aminophylline", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(),color: Color(0xffa6a6a6),),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("5 mg/kg"),
            SizedBox(height: 5),
            Text("${currentData[1]} mg",style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("diluted to at least 60 mL"),
            Text("given over 1 hour")
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

asthmaAdrenalineDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = asthmaAdrenalineData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("IV Aminophylline", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(),color: Color(0xffa6a6a6),),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${currentData[1]} mL of 1:1000 IM or subcutaneously",style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("repeat every 20 minutes"),
            Text("maximum 3 doses")
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

methylprednisoloneDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = methylprednisoloneData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Methylprednisolone", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(),color: Color(0xffa6a6a6),),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${currentData[1]} mg IV",
                style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("then ${currentData[2]} mg 6 - hourly"),
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

dexamethasoneDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = dexamethasoneData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Dexamethasone", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(),color: Color(0xffa6a6a6),),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${currentData[1]} mg - ${currentData[2]} mg",
                style: TextStyle(
                    fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("Oral / IV / IM"),
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

hydrocortisoneDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = hydrocortisoneData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Hydrocortisone", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(),color: Color(0xffa6a6a6),),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${currentData[1]} mg IV",
                style: TextStyle(
                    fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("then ${currentData[2]} mg 6 - hourly"),
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

prednisoloneDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = prednisoloneData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Prednisolone", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(),color: Color(0xffa6a6a6),),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${currentData[1]} mg orally",
                style: TextStyle(
                    fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("then ${currentData[2]} mg daily"),
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}