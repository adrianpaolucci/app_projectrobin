import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'finalDisplay.dart';
import 'all_sizings.dart';

final seizuresNeurologyDrugs = ["Midazolam (IV)","Midazolam (IN/B)","Diazepam (IV)","Lorazepam (IV)","Fosphenytoin","Phenytoin","Phenobarbitone","Levetiracetam","Valproate","Pyridoxine","Midazolam Infusion","Hypertonic Saline","Mannitol"];

final sAndNMidazolamIVData = [[2, 0.3, 0.3], [2.5, 0.375, 0.375], [3, 0.45, 0.45], [3.5, 0.525, 0.525], [4, 0.6, 0.6], [4.5, 0.675, 0.675], [5, 0.75, 0.75], [5.5, 0.825, 0.825], [6, 0.9, 0.9], [7, 1.05, 1.05], [8, 1.2, 1.2], [9, 1.35, 1.35], [10, 1.5, 1.5], [11, 1.65, 1.65], [12, 1.8, 1.8], [13, 1.95, 1.95], [14, 2.1, 2.1], [15, 2.25, 2.25], [16, 2.4, 2.4], [17, 2.55, 2.55], [18, 2.6999999999999997, 2.6999999999999997], [19, 2.85, 2.85], [20, 3.0, 3.0], [22, 3.3, 3.3], [24, 3.5999999999999996, 3.5999999999999996], [26, 3.9, 3.9], [28, 4.2, 4.2], [30, 4.5, 4.5], [35, 5.25, 5.25], [40, 6.0, 6.0], [45, 6.75, 6.75], [50, 7.5, 7.5], [55, 8.25, 8.25], [60, 9.0, 9.0], [65, 9.75, 9.75], [70, 10, 10], [75, 10, 10], [80, 10, 10]];
final sAndNMidazolamIntraData = [[2, 0.6, 0.12], [2.5, 0.75, 0.15], [3, 0.9, 0.18], [3.5, 1.05, 0.21], [4, 1.2, 0.24], [4.5, 1.35, 0.27], [5, 1.5, 0.3], [5.5, 1.65, 0.33], [6, 1.8, 0.36], [7, 2.1, 0.42], [8, 2.4, 0.48], [9, 2.7, 0.5399999999999999], [10, 3.0, 0.6], [11, 3.3, 0.6599999999999999], [12, 3.5999999999999996, 0.72], [13, 3.9, 0.78], [14, 4.2, 0.8400000000000001], [15, 4.5, 0.9], [16, 4.8, 0.96], [17, 5.1, 1.02], [18, 5.3999999999999995, 1.0799999999999998], [19, 5.7, 1.1400000000000001], [20, 6.0, 1.2], [22, 6.6, 1.3199999999999998], [24, 7.199999999999999, 1.44], [26, 7.8, 1.56], [28, 8.4, 1.6800000000000002], [30, 9.0, 1.8], [35, 10, 2.0], [40, 10, 2.0], [45, 10, 2.0], [50, 10, 2.0], [55, 10, 2.0], [60, 10, 2.0], [65, 10, 2.0], [70, 10, 2.0], [75, 10, 2.0], [80, 10, 2.0]];
final sAndNDiazepamData = [[2, 0.4], [2.5, 0.5], [3, 0.6], [3.5, 0.70], [4, 0.8], [4.5, 0.9], [5, 1.0], [5.5, 1.1], [6, 1.2], [7, 1.4], [8, 1.6], [9, 1.8], [10, 2.0], [11, 2.2], [12, 2.4000000000000004], [13, 2.6], [14, 2.8000000000000003], [15, 3.0], [16, 3.2], [17, 3.4000000000000004], [18, 3.6], [19, 3.8000000000000003], [20, 4.0], [22, 4.4], [24, 4.800000000000001], [26, 5.2], [28, 5.6000000000000005], [30, 6.0], [35, 7.0], [40, 8.0], [45, 9.0], [50, 10.0], [55, 10], [60, 10], [65, 10], [70, 10], [75, 10], [80, 10]];
final sAndNLorazepamData = [[2, 0.2], [2.5, 0.25], [3, 0.30], [3.5, 0.35], [4, 0.4], [4.5, 0.45], [5, 0.5], [5.5, 0.55], [6, 0.6], [7, 0.7], [8, 0.8], [9, 0.9], [10, 1.0], [11, 1.1], [12, 1.2000000000000002], [13, 1.3], [14, 1.4000000000000001], [15, 1.5], [16, 1.6], [17, 1.7000000000000002], [18, 1.8], [19, 1.9000000000000001], [20, 2.0], [22, 2.2], [24, 2.4000000000000004], [26, 2.6], [28, 2.8000000000000003], [30, 3.0], [35, 3.5], [40, 4.0], [45, 4], [50, 4], [55, 4], [60, 4], [65, 4], [70, 4], [75, 4], [80, 4]];
final sAndNFosphenytoinData = [[2, 40], [2.5, 50.0], [3, 60], [3.5, 70.0], [4, 80], [4.5, 90.0], [5, 100], [5.5, 110.0], [6, 120], [7, 140], [8, 160], [9, 180], [10, 200], [11, 220], [12, 240], [13, 260], [14, 280], [15, 300], [16, 320], [17, 340], [18, 360], [19, 380], [20, 400], [22, 440], [24, 480], [26, 520], [28, 560], [30, 600], [35, 700], [40, 800], [45, 900], [50, 1000], [55, 1100], [60, 1200], [65, 1300], [70, 1400], [75, 1500], [80, 1600]];
final sAndNPhenytoinData = [[2, 40, 6.67], [2.5, 50.0, 8.33], [3, 60, 10.0], [3.5, 70.0, 11.67], [4, 80, 13.33], [4.5, 90.0, 15.0], [5, 100, 16.666666666666668], [5.5, 110.0, 18.333333333333332], [6, 120, 20.0], [7, 140, 23.333333333333332], [8, 160, 26.666666666666668], [9, 180, 30.0], [10, 200, 33.333333333333336], [11, 220, 36.666666666666664], [12, 240, 40.0], [13, 260, 43.333333333333336], [14, 280, 46.666666666666664], [15, 300, 50.0], [16, 320, 53.333333333333336], [17, 340, 56.666666666666664], [18, 360, 60.0], [19, 380, 63.333333333333336], [20, 400, 66.66666666666667], [22, 440, 73.33333333333333], [24, 480, 80.0], [26, 520, 86.66666666666667], [28, 560, 93.33333333333333], [30, 600, 100.0], [35, 700, 116.66666666666667], [40, 800, 133.33333333333334], [45, 900, 150.0], [50, 1000, 166.66666666666666], [55, 1100, 183.33333333333334], [60, 1200, 200.0], [65, 1300, 216.66666666666666], [70, 1400, 233.33333333333334], [75, 1500, 250.0], [80, 1600, 266.6666666666667]];
final sAndNPhenobarbitoneData = [[2, 60], [2.5, 75.0], [3, 90], [3.5, 105.0], [4, 120], [4.5, 135.0], [5, 150], [5.5, 165.0], [6, 180], [7, 210], [8, 240], [9, 270], [10, 300], [11, 330], [12, 360], [13, 390], [14, 420], [15, 450], [16, 480], [17, 510], [18, 540], [19, 570], [20, 600], [22, 660], [24, 720], [26, 780], [28, 840], [30, 900], [35, 1050], [40, 1200], [45, 1350], [50, 1500], [55, 1650], [60, 1800], [65, 1950], [70, 2100], [75, 2250], [80, 2400]];
final sAndNLevetiracetamData = [[2, 80, 120, 1.6, 2.4], [2.5, 100.0, 150.0, 2.0, 3.0], [3, 120, 180, 2.4, 3.6], [3.5, 140.0, 210.0, 2.8, 4.2], [4, 160, 240, 3.2, 4.8], [4.5, 180.0, 270.0, 3.6, 5.4], [5, 200, 300, 4.0, 6.0], [5.5, 220.0, 330.0, 4.4, 6.6], [6, 240, 360, 4.8, 7.2], [7, 280, 420, 5.6, 8.4], [8, 320, 480, 6.4, 9.6], [9, 360, 540, 7.2, 10.8], [10, 400, 600, 8.0, 12.0], [11, 440, 660, 8.8, 13.2], [12, 480, 720, 9.6, 14.4], [13, 520, 780, 10.4, 15.6], [14, 560, 840, 11.2, 16.8], [15, 600, 900, 12.0, 18.0], [16, 640, 960, 12.8, 19.2], [17, 680, 1020, 13.6, 20.4], [18, 720, 1080, 14.4, 21.6], [19, 760, 1140, 15.2, 22.8], [20, 800, 1200, 16.0, 24.0], [22, 880, 1320, 17.6, 26.4], [24, 960, 1440, 19.2, 28.8], [26, 1040, 1560, 20.8, 31.2], [28, 1120, 1680, 22.4, 33.6], [30, 1200, 1800, 24.0, 36.0], [35, 1400, 2100, 28.0, 42.0], [40, 1600, 2400, 32.0, 48.0], [45, 1800, 2700, 36.0, 54.0], [50, 2000, 3000, 40.0, 60.0], [55, 2200, 3300, 44.0, 66.0], [60, 2400, 3600, 48.0, 72.0], [65, 2600, 3900, 52.0, 78.0], [70, 2800, 4200, 56.0, 84.0], [75, 3000, 4500, 60.0, 90.0], [80, 3200, 4800, 64.0, 96.0]];
final sAndNValproateData = [[2, 40, 80], [2.5, 50.0, 100.0], [3, 60, 120], [3.5, 70.0, 140.0], [4, 80, 160], [4.5, 90.0, 180.0], [5, 100, 200], [5.5, 110.0, 220.0], [6, 120, 240], [7, 140, 280], [8, 160, 320], [9, 180, 360], [10, 200, 400], [11, 220, 440], [12, 240, 480], [13, 260, 520], [14, 280, 560], [15, 300, 600], [16, 320, 640], [17, 340, 680], [18, 360, 720], [19, 380, 760], [20, 400, 800], [22, 440, 880], [24, 480, 960], [26, 520, 1040], [28, 560, 1120], [30, 600, 1200], [35, 700, 1400], [40, 800, 1600], [45, 900, 1800], [50, 1000, 2000], [55, 1100, 2200], [60, 1200, 2400], [65, 1300, 2600], [70, 1400, 2800], [75, 1500, 3000], [80, 1600, 3200]];
final sAndNPyridoxineData = [[2, 100, 200], [2.5, 125.0, 250.0], [3, 150, 300], [3.5, 175.0, 350.0], [4, 200, 400], [4.5, 225.0, 450.0], [5, 250, 500], [5.5, 275.0, 550.0], [6, 300, 600], [7, 350, 700], [8, 400, 800], [9, 450, 900], [10, 'Not Available', 'Not Available'], [11, 'Not Available', 'Not Available'], [12, 'Not Available', 'Not Available'], [13, 'Not Available', 'Not Available'], [14, 'Not Available', 'Not Available'], [15, 'Not Available', 'Not Available'], [16, 'Not Available', 'Not Available'], [17, 'Not Available', 'Not Available'], [18, 'Not Available', 'Not Available'], [19, 'Not Available', 'Not Available'], [20, 'Not Available', 'Not Available'], [22, 'Not Available', 'Not Available'], [24, 'Not Available', 'Not Available'], [26, 'Not Available', 'Not Available'], [28, 'Not Available', 'Not Available'], [30, 'Not Available', 'Not Available'], [35, 'Not Available', 'Not Available'], [40, 'Not Available', 'Not Available'], [45, 'Not Available', 'Not Available'], [50, 'Not Available', 'Not Available'], [55, 'Not Available', 'Not Available'], [60, 'Not Available', 'Not Available'], [65, 'Not Available', 'Not Available'], [70, 'Not Available', 'Not Available'], [75, 'Not Available', 'Not Available'], [80, 'Not Available', 'Not Available']];
final sAndNMidazolamInfusionData = [[2, 6, 1], [2.5, 7.5, 1], [3, 9, 1], [3.5, 10.5, 1], [4, 12, 1], [4.5, 13.5, 1], [5, 15, 1], [5.5, 16.5, 1], [6, 18, 1], [7, 21, 1], [8, 24, 1], [9, 27, 1], [10, 30, 1], [11, 33, 1], [12, 36, 1], [13, 39, 1], [14, 42, 1], [15, 45, 1], [16, 48, 1], [17, 51, 1], [18, 54, 1], [19, 57, 1], [20, 60, 1], [22, 66, 1], [24, 72, 1], [26, 78, 1], [28, 84, 1], [30, 50, '1-4'], [35, 50, '1-4'], [40, 50, '1-4'], [45, 50, '1-4'], [50, 50, '1-4'], [55, 50, '1-4'], [60, 50, '1-4'], [65, 50, '1-4'], [70, 50, '1-4'], [75, 50, '1-4'], [80, 50, '1-4']];
final sAndNHypertonicSalineData = [[2, 6, 10], [2.5, 7.5, 12.5], [3, 9, 15], [3.5, 10.5, 17.5], [4, 12, 20], [4.5, 13.5, 22.5], [5, 15, 25], [5.5, 16.5, 27.5], [6, 18, 30], [7, 21, 35], [8, 24, 40], [9, 27, 45], [10, 30, 50], [11, 33, 55], [12, 36, 60], [13, 39, 65], [14, 42, 70], [15, 45, 75], [16, 48, 80], [17, 51, 85], [18, 54, 90], [19, 57, 95], [20, 60, 100], [22, 66, 110], [24, 72, 120], [26, 78, 130], [28, 84, 140], [30, 90, 150], [35, 105, 175], [40, 120, 200], [45, 135, 225], [50, 150, 250], [55, 165, 275], [60, 180, 300], [65, 195, 325], [70, 210, 350], [75, 225, 375], [80, 240, 400]];
final sAndNMannitolData = [[2, 5.0, 10], [2.5, 6.25, 12.5], [3, 7.5, 15], [3.5, 8.75, 17.5], [4, 10.0, 20], [4.5, 11.25, 22.5], [5, 12.5, 25], [5.5, 13.75, 27.5], [6, 15.0, 30], [7, 17.5, 35], [8, 20.0, 40], [9, 22.5, 45], [10, 25.0, 50], [11, 27.5, 55], [12, 30.0, 60], [13, 32.5, 65], [14, 35.0, 70], [15, 37.5, 75], [16, 40.0, 80], [17, 42.5, 85], [18, 45.0, 90], [19, 47.5, 95], [20, 50.0, 100], [22, 55.0, 110], [24, 60.0, 120], [26, 65.0, 130], [28, 70.0, 140], [30, 75.0, 150], [35, 87.5, 175], [40, 100.0, 200], [45, 112.5, 225], [50, 125.0, 250], [55, 137.5, 275], [60, 150.0, 300], [65, 162.5, 325], [70, 175.0, 350], [75, 187.5, 375], [80, 200.0, 400]];

sAndNMidazolamIVDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = sAndNMidazolamIVData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Midazolam (IV)", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: lightBoxDec(context),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("5 mg / 5 mL -- Large Ampoule"),
            Text("0.15 mL/kg  =>  ${currentData[1]} mg", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            Text("or ${currentData[2]} mL", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold))
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

sAndNMidazolamIBDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = sAndNMidazolamIntraData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Midazolam (Intranasal/Buccal)", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: lightBoxDec(context),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("5 mg / 1 mL -- Small Ampoule"),
            Text("0.3 mL/kg  =>  ${currentData[1]} mg", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            Text("or ${currentData[2]} mL Buccal/IN", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold))
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

sAndNDiazepamDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = sAndNDiazepamData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Diazepam (IV)", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: lightBoxDec(context),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("0.2 mg/kg"),
            Text("${currentData[1]} mg", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

sAndNLorazepamDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = sAndNLorazepamData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Lorazepam (IV)", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: lightBoxDec(context),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("0.1 mg/kg"),
            Text("${currentData[1]} mg", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

sAndNFosphenytoinDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = sAndNFosphenytoinData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Fosphenytoin", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: lightBoxDec(context),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("20 PE/kg"),
            Text("${currentData[1]} PE", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

sAndNPhenytoinDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = sAndNPhenytoinData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Phenytoin", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: lightBoxDec(context),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("20 mg/kg"),
            Text("${currentData[1]} mg", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            Text("Undiluted (preferred). May Dilute\n up to ${currentData[2]} mL", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            Text("Give over 20 minutes"),
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

sAndNPhenobarbitoneDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = sAndNPhenobarbitoneData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Phenobarbitone", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: lightBoxDec(context),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("20 mg/kg"),
            Text("${currentData[1]} mg", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            Text("Dilute to at least 1:10", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            Text("Give over 20 minutes"),
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

sAndNLevetiracemDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = sAndNLevetiracetamData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Levetiracem", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: lightBoxDec(context),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("40 - 60 mg/kg"),
            Text("${currentData[1]} mg - ${currentData[2]} mg", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Dilute 500 mg vial to 10 mL"),
            Text("Give ${currentData[3]} mL - ${currentData[4]} mL over 20 minutes", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

sAndNValproateDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = sAndNValproateData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Valproate", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: lightBoxDec(context),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("20 - 40 mg/kg"),
            Text("${currentData[1]} mg - ${currentData[2]} mg", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

sAndNPyridoxineDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = sAndNPyridoxineData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Pyridoxine", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: lightBoxDec(context),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${currentData[1]} mg - ${currentData[2]} mg", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

sAndNMidazolamInfusionDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = sAndNMidazolamInfusionData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Midazolam Infusion", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: lightBoxDec(context),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Add ${currentData[1]} mg to 50 mL", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            Text("Start at ${currentData[2]} mL/h. Increase by 1 mL/h\n"
                "every 15 min until seizures\n"
                "are controlled", textAlign: TextAlign.center,)
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

sAndNHypertonicSalineDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = sAndNHypertonicSalineData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Hypertonic Saline", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: lightBoxDec(context),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${currentData[1]} mL - ${currentData[2]} mL", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            Text("Over 20 - 30 minutes for raised ICP")
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

sAndNMannitolDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = sAndNMannitolData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Mannitol", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: lightBoxDec(context),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${currentData[1]} mL - ${currentData[2]} mL", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            Text("Over 20 - 30 minutes for raised ICP")
          ]
      ),
    ),
    SizedBox(height: 15)]);
  return popup;
}

