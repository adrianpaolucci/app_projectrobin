import 'all_sizings.dart';
import 'homeScreen.dart';
import 'package:flutter/material.dart';

final analgesiaParacetData = [[2, 30], [2.5, 37.5], [3, 45], [3.5, 52.5], [4, 60], [4.5, 67.5], [5, 75], [5.5, 82.5], [6, 90], [7, 105], [8, 120], [9, 135], [10, 150], [11, 165], [12, 180], [13, 195], [14, 210], [15, 225], [16, 240], [17, 255], [18, 270], [19, 285], [20, 300], [22, 330], [24, 360], [26, 390], [28, 420], [30, 450], [35, 525], [40, 600], [45, 675], [50, 750], [55, 825], [60, 900], [65, 975], [70, 1050], [75, 1125], [80, 1200]];
final analgesiaMorphineData = [[2, 0.1], [2.5, 0.125], [3, 0.15], [3.5, 0.175], [4, 0.2], [4.5, 0.225], [5, 0.25], [5.5, 0.275], [6, 0.3], [7, 0.35], [8, 0.4], [9, 0.45], [10, 1.0], [11, 1.1], [12, 1.2], [13, 1.3], [14, 1.4], [15, 1.5], [16, 1.6], [17, 1.7], [18, 1.8], [19, 1.9], [20, 2.0], [22, 2.2], [24, 2.4], [26, 2.6], [28, 2.8], [30, 3.0], [35, 3.5], [40, 4.0], [45, 4.5], [50, 5.0], [55, 5.5], [60, 6.0], [65, 6.5], [70, 7.0], [75, 7.5], [80, 8.0]];

analgesiaParacetDisplay(BuildContext context) {
  final data = MediaQuery.of(context);

  var currentData = analgesiaParacetData[weightIndex];
  var popup = finalDisplayFull(
      context,
      "Paracetamol",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "every 6 hours", "", ""),
      finalDisplayFormula(context, "15 mg/kg \nMax 60 mg/kg/day "));

  return popup;
}

analgesiaMorphineDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = analgesiaMorphineData[weightIndex];
  var popup = finalDisplayFull(
      context,
      "Morphine",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "repeat in 5 minutes", "", ""),
      finalDisplayFormula(context, "12 months: 0.05 mg/kg\n1-18 years:0.1 mg/kg"));


  return popup;
}