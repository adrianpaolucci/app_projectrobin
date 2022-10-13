import 'all_sizings.dart';
import 'homeScreen.dart';
import 'package:flutter/material.dart';
import 'interventionMainScreen.dart';

var interventionColour = intColors[8];


final analgesiaParacetData = [[2, 30], [2.5, 37.5], [3, 45], [3.5, 52.5], [4, 60], [4.5, 67.5], [5, 75], [5.5, 82.5], [6, 90], [7, 105], [8, 120], [9, 135], [10, 150], [11, 165], [12, 180], [13, 195], [14, 210], [15, 225], [16, 240], [17, 255], [18, 270], [19, 285], [20, 300], [22, 330], [24, 360], [26, 390], [28, 420], [30, 450], [35, 525], [40, 600], [45, 675], [50, 750], [55, 825], [60, 900], [65, 975], [70, 1050], [75, 1125], [80, 1200]];
final analgesiaMorphineData = [[2, 0.1], [2.5, 0.125], [3, 0.15], [3.5, 0.175], [4, 0.2], [4.5, 0.225], [5, 0.25], [5.5, 0.275], [6, 0.3], [7, 0.35], [8, 0.4], [9, 0.45], [10, 1.0], [11, 1.1], [12, 1.2], [13, 1.3], [14, 1.4], [15, 1.5], [16, 1.6], [17, 1.7], [18, 1.8], [19, 1.9], [20, 2.0], [22, 2.2], [24, 2.4], [26, 2.6], [28, 2.8], [30, 3.0], [35, 3.5], [40, 4.0], [45, 4.5], [50, 5.0], [55, 5.5], [60, 6.0], [65, 6.5], [70, 7.0], [75, 7.5], [80, 8.0]];
final analgesiaIbuprofenData = [[2, 20], [2.5, 25.0], [3, 30], [3.5, 35.0], [4, 40], [4.5, 45.0], [5, 50], [5.5, 55.0], [6, 60], [7, 70], [8, 80], [9, 90], [10, 100], [11, 110], [12, 120], [13, 130], [14, 140], [15, 150], [16, 160], [17, 170], [18, 180], [19, 190], [20, 200], [22, 220], [24, 240], [26, 260], [28, 280], [30, 300], [35, 350], [40, 400], [45, 450], [50, 500], [55, 550], [60, 600], [65, 650], [70, 700], [75, 750], [80, 800]];

analgesiaParacetDisplay(BuildContext context) {
  var currentData = analgesiaParacetData[weightIndex];
  var popup = finalDisplayFull(interventionColour,
      context,
      "Paracetamol",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "every 6 hours", "", ""),
      finalDisplayFormula(context, "15 mg/kg \nMax 60 mg/kg/day "));

  return popup;
}

analgesiaIbuprofenDisplay(BuildContext context) {
  var currentData = analgesiaIbuprofenData[weightIndex];
  var popup = finalDisplayFull(interventionColour,
      context,
      "Ibuprofen",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "", "", ""),
      finalDisplayFormula(context, "10 mg/kg"));

  return popup;
}

analgesiaMorphineDisplay(BuildContext context) {
  var currentData = analgesiaMorphineData[weightIndex];
  var popup = finalDisplayFull(interventionColour,
      context,
      "Morphine",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "repeat in 5 minutes", "", ""),
      finalDisplayFormula(context, "12 months: 0.05 mg/kg\n1-18 years:0.1 mg/kg"));


  return popup;
}