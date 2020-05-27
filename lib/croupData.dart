import 'package:flutter/material.dart';
import 'all_sizings.dart';
import 'homeScreen.dart';

final croupNebAdrenalineData = [[2, 'Not Available', 'Not Available'], [2.5, 'Not Available', 'Not Available'], [3, 'Not Available', 'Not Available'], [3.5, 'Not Available', 'Not Available'], [4, 'Not Available', 'Not Available'], [4.5, 'Not Available', 'Not Available'], [5, 'Not Available', 'Not Available'], [5.5, 'Not Available', 'Not Available'], [6, 3.0, 3.0], [7, 3.5, 3.5], [8, 4.0, 4.0], [9, 4.5, 4.5], [10, 5.0, 5.0], [11, 5, 5], [12, 5, 5], [13, 5, 5], [14, 5, 5], [15, 5, 5], [16, 5, 5], [17, 5, 5], [18, 5, 5], [19, 5, 5], [20, 5, 5], [22, 5, 5], [24, 5, 5], [26, 5, 5], [28, 5, 5], [30, 5, 5], [35, 5, 5], [40, 5, 5], [45, 5, 5], [50, 5, 5], [55, 5, 5], [60, 5, 5], [65, 5, 5], [70, 5, 5], [75, 5, 5], [80, 5, 5]];
final croupDexamethData = [[2, 'Not Available', 'Not Available'], [2.5, 'Not Available', 'Not Available'], [3, 'Not Available', 'Not Available'], [3.5, 'Not Available', 'Not Available'], [4, 'Not Available', 'Not Available'], [4.5, 'Not Available', 'Not Available'], [5, 'Not Available', 'Not Available'], [5.5, 'Not Available', 'Not Available'], [6, 0.8999999999999999, 'NA'], [7, 1.05, 'NA'], [8, 1.2, 'NA'], [9, 1.3499999999999999, 'NA'], [10, 1.5, 'NA'], [11, 1.65, 'NA'], [12, 1.7999999999999998, 'NA'], [13, 1.95, 'NA'], [14, 2.1, 'NA'], [15, 2.25, 'NA'], [16, 2.4, 'NA'], [17, 2.55, 'NA'], [18, 2.6999999999999997, 'NA'], [19, 2.85, 'NA'], [20, 3.0, 'NA'], [22, 3.3, 12], [24, 3.5999999999999996, 12], [26, 3.9, 12], [28, 4.2, 12], [30, 4.5, 12], [35, 5.25, 12], [40, 6.0, 12], [45, 6.75, 12], [50, 7.5, 12], [55, 8, 12], [60, 8, 12], [65, 8, 12], [70, 8, 12], [75, 8, 12], [80, 8, 12]];
final croupPrednisoloneData = [[2, 'Not Available'], [2.5, 'Not Available'], [3, 'Not Available'], [3.5, 'Not Available'], [4, 'Not Available'], [4.5, 'Not Available'], [5, 'Not Available'], [5.5, 'Not Available'], [6, 6], [7, 7], [8, 8], [9, 9], [10, 10], [11, 11], [12, 12], [13, 13], [14, 14], [15, 15], [16, 16], [17, 17], [18, 18], [19, 19], [20, 20], [22, 22], [24, 24], [26, 26], [28, 28], [30, 30], [35, 35], [40, 40], [45, 45], [50, 50], [55, 55], [60, 60], [65, 65], [70, 70], [75, 75], [80, 80]];

croupNebAdrenalineDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = croupNebAdrenalineData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Nebulised Adrenaline", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: lightBoxDec(context),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${currentData[1]} mL",
                style: TextStyle(
                    fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("${currentData[2]} mg of 1:1000")
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

croupDexamethDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = croupDexamethData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Dexamethasone", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: lightBoxDec(context),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${currentData[1]} mg - ${currentData[2]} mg",
                style: TextStyle(
                    fontSize: size16Text(context), fontWeight: FontWeight.bold)),
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

croupPrednisoloneDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = croupPrednisoloneData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Prednisolone", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: lightBoxDec(context),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${currentData[1]} mg",
                style: TextStyle(
                    fontSize: size16Text(context), fontWeight: FontWeight.bold)),
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

