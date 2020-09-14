import 'package:flutter/material.dart';
import 'all_sizings.dart';
import 'homeScreen.dart';

final aciclovirData = [[2, 40], [2.5, 50.0], [3, 60], [3.5, 70.0], [4, 80], [4.5, 90.0], [5, 100], [5.5, 110.0], [6, 120], [7, 140], [8, 160], [9, 180], [10, 200], [11, 220], [12, 240], [13, 260], [14, 280], [15, 300], [16, 320], [17, 340], [18, 360], [19, 380], [20, 300], [22, 330], [24, 360], [26, 390], [28, 420], [30, 450], [35, 525], [40, 400], [45, 450], [50, 500], [55, 550], [60, 600], [65, 650], [70, 700], [75, 750], [80, 800]];
final artesunateData = [[2, 4.8], [2.5, 6.0], [3, 7.2], [3.5, 8.4], [4, 9.6], [4.5, 10.8], [5, 12.0], [5.5, 13.2], [6, 14.4], [7, 16.8], [8, 19.2], [9, 21.6], [10, 24.0], [11, 26.4], [12, 28.8], [13, 31.2], [14, 33.6], [15, 36.0], [16, 38.4], [17, 40.8], [18, 43.2], [19, 45.6], [20, 48.0], [22, 52.8], [24, 57.6], [26, 62.4], [28, 67.2], [30, 72.0], [35, 84.0], [40, 96.0], [45, 108.0], [50, 120.0], [55, 132.0], [60, 144.0], [65, 156.0], [70, 168.0], [75, 180.0], [80, 192.0]];
final oseltamivirData = [[2, 6], [2.5, 7.5], [3, 9], [3.5, 10.5], [4, 12], [4.5, 13.5], [5, 15], [5.5, 16.5], [6, 18], [7, 21], [8, 24], [9, 27], [10, 30], [11, 30], [12, 30], [13, 30], [14, 30], [15, 45], [16, 45], [17, 45], [18, 45], [19, 45], [20, 45], [22, 45], [24, 60], [26, 60], [28, 60], [30, 60], [35, 60], [40, 75], [45, 75], [50, 75], [55, 75], [60, 75], [65, 75], [70, 75], [75, 75], [80, 75]];
final cefotaximeData = [[2, 100], [2.5, 125.0], [3, 150], [3.5, 175.0], [4, 200], [4.5, 225.0], [5, 250], [5.5, 275.0], [6, 300], [7, 350], [8, 400], [9, 450], [10, 500], [11, 550], [12, 600], [13, 650], [14, 700], [15, 750], [16, 800], [17, 850], [18, 900], [19, 950], [20, 1000], [22, 1100], [24, 1200], [26, 1300], [28, 1400], [30, 1500], [35, 1750], [40, 2000], [45, 2000], [50, 2000], [55, 2000], [60, 2000], [65, 2000], [70, 2000], [75, 2000], [80, 2000]];
final ceftriaxoneData = [[2, 100], [2.5, 125.0], [3, 150], [3.5, 175.0], [4, 200], [4.5, 225.0], [5, 250], [5.5, 275.0], [6, 300], [7, 350], [8, 400], [9, 450], [10, 500], [11, 550], [12, 600], [13, 650], [14, 700], [15, 750], [16, 800], [17, 850], [18, 900], [19, 950], [20, 1000], [22, 1100], [24, 1200], [26, 1300], [28, 1400], [30, 1500], [35, 1750], [40, 2000], [45, 2250], [50, 2500], [55, 2750], [60, 3000], [65, 3250], [70, 3500], [75, 3750], [80, 4000]];
final azithromycinData = [[2, 'NA'], [2.5, 'NA'], [3, 'NA'], [3.5, 'NA'], [4, 'NA'], [4.5, 'NA'], [5, 'NA'], [5.5, 'NA'], [6, 'NA'], [7, 'NA'], [8, 'NA'], [9, 'NA'], [10, 'NA'], [11, 'NA'], [12, 'NA'], [13, 'NA'], [14, 'NA'], [15, 'NA'], [16, 'NA'], [17, 'NA'], [18, 'NA'], [19, 'NA'], [20, 'NA'], [22, 'NA'], [24, 'NA'], [26, 'NA'], [28, 'NA'], [30, 'NA'], [35, 'NA'], [40, 'NA'], [45, 'NA'], [50, 'NA'], [55, 'NA'], [60, 'NA'], [65, 'NA'], [70, 'NA'], [75, 'NA'], [80, 'NA']];
final pipAndTazobData = [[2, 200, 25.0], [2.5, 250.0, 31.25], [3, 300, 37.5], [3.5, 350.0, 43.75], [4, 400, 50.0], [4.5, 450.0, 56.25], [5, 500, 62.5], [5.5, 550.0, 68.75], [6, 600, 75.0], [7, 700, 87.5], [8, 800, 100.0], [9, 900, 112.5], [10, 1000, 125.0], [11, 1100, 137.5], [12, 1200, 150.0], [13, 1300, 162.5], [14, 1400, 175.0], [15, 1500, 187.5], [16, 1600, 200.0], [17, 1700, 212.5], [18, 1800, 225.0], [19, 1900, 237.5], [20, 2000, 250.0], [22, 2200, 275.0], [24, 2400, 300.0], [26, 2600, 325.0], [28, 2800, 350.0], [30, 3000, 375.0], [35, 3500, 437.5], [40, 4000, 500.0], [45, 4000, 500], [50, 4000, 500], [55, 4000, 500], [60, 4000, 500], [65, 4000, 500], [70, 4000, 500], [75, 4000, 500], [80, 4000, 500]];

aciclovirDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = aciclovirData[weightIndex];


  var popup = finalDisplayFull(
      context,
      "Aciclovir ",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "8 - hourly", "", ""),
      finalDisplayFormula(context, "<5 years: 20 mg/kg\n5 - 12 years: 15 mg/kg\n>12 years: 10 mg/kg"));

  return popup;
}

artesunateDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = artesunateData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Artesunate ",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "Start, 12, 24, then daily", "", ""),
      finalDisplayFormula(context, "2.4 mg/kg"));

  return popup;
}

oseltamivirDisplay(BuildContext context) {
  var currentData = oseltamivirData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Oseltamivir ",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "12 - hourly", "", ""),
      finalDisplayEmpty());
      //finalDisplayFormula(context, "Neonate - 11 months: 3 mg/kg\n1 - 12 years(10 - 15 kg): 30 mg/kg\n1 - 12 years(15 - 23 kg): 45 mg/kg\n 1 - 12 years(23 - 40 kg): 60 mg/kg\n1 - 12 years(40+ kg): 75 mg/kg\n13 - 17 years: 75 mg"));


  return popup;
}

cefotaximeDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = cefotaximeData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Cefotaxime ",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "Every 6 - 8 hours", "", ""),
      finalDisplayFormula(context, "50 mg/kg (max 2g)"));

  return popup;
}

ceftriaxoneDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = ceftriaxoneData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Ceftriaxone ",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "12 - hourly or daily", "", ""),
      finalDisplayFormula(context, "50 mg/kg "));

  return popup;
}

azithromycinDisplay(BuildContext context) {
  var currentData = azithromycinData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Azithromycin",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "Daily (oral or IV)", "", ""),
      finalDisplayFormula(context, "10 mg/kg "));

  return popup;
}

pipAndTazobDisplay(BuildContext context) {
  var currentData = pipAndTazobData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Piperacillin/Tazobactam",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "plus ", "${currentData[2]}  mg", " 6 - hourly"),
      finalDisplayFormula(context, "100 + 12.5 mg/kg\nup to 4 + 0.5 g"));

  return popup;
}
