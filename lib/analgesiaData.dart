import 'all_sizings.dart';
import 'homeScreen.dart';
import 'package:flutter/material.dart';

final analgesiaParacetData = [[2, 30], [2.5, 37.5], [3, 45], [3.5, 52.5], [4, 60], [4.5, 67.5], [5, 75], [5.5, 82.5], [6, 90], [7, 105], [8, 120], [9, 135], [10, 150], [11, 165], [12, 180], [13, 195], [14, 210], [15, 225], [16, 240], [17, 255], [18, 270], [19, 285], [20, 300], [22, 330], [24, 360], [26, 390], [28, 420], [30, 450], [35, 525], [40, 600], [45, 675], [50, 750], [55, 825], [60, 900], [65, 975], [70, 1050], [75, 1125], [80, 1200]];
final analgesiaMorphineData = [[2, 0.1], [2.5, 0.125], [3, 0.15000000000000002], [3.5, 0.17500000000000002], [4, 0.2], [4.5, 0.225], [5, 0.25], [5.5, 0.275], [6, 0.30000000000000004], [7, 0.35000000000000003], [8, 0.4], [9, 0.45], [10, 1.0], [11, 1.1], [12, 1.2000000000000002], [13, 1.3], [14, 1.4000000000000001], [15, 1.5], [16, 1.6], [17, 1.7000000000000002], [18, 1.8], [19, 1.9000000000000001], [20, 2.0], [22, 2.2], [24, 2.4000000000000004], [26, 2.6], [28, 2.8000000000000003], [30, 3.0], [35, 3.5], [40, 4.0], [45, 4.5], [50, 5.0], [55, 5.5], [60, 6.0], [65, 6.5], [70, 7.0], [75, 7.5], [80, 8.0]];

analgesiaParacetDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = analgesiaParacetData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Paracetamol Acetaminophen", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: lightBoxDec(context),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${currentData[1]} mg",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("Every 6 hours"),
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

analgesiaMorphineDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = analgesiaMorphineData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Morphine", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: lightBoxDec(context),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${currentData[1]} mg",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("Repeat in 5 mins"),
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}