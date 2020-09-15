import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'all_sizings.dart';

final hyperkalData = [[2, 0.2, 0.4, 1.0, 2.5, 8, 10, 4, 0.2, 2], [2.5, 0.25, 0.5, 1.25, 2.5, 10.0, 12.5, 5.0, 0.25, 2.5], [3, 0.3, 0.6, 1.5, 2.5, 12, 15, 6, 0.3, 3], [3.5, 0.35, 0.7, 1.75, 2.5, 14.0, 17.5, 7.0, 0.35, 3.5], [4, 0.4, 0.8, 2.0, 2.5, 16, 20, 8, 0.4, 4], [4.5, 0.45, 0.9, 2.25, 2.5, 18.0, 22.5, 9.0, 0.45, 4.5], [5, 0.5, 1.0, 2.5, 2.5, 20, 25, 10, 0.5, 5], [5.5, 0.55, 1.1, 2.75, 2.5, 22.0, 27.5, 11.0, 0.55, 5.5], [6, 0.6, 1.2, 3.0, 2.5, 24, 30, 12, 0.6, 6], [7, 0.7, 1.4, 3.5, 2.5, 28, 35, 14, 0.7, 7], [8, 0.8, 1.6, 4.0, 2.5, 32, 40, 16, 0.8, 8], [9, 0.9, 1.8, 4.5, 2.5, 36, 45, 18, 0.9, 9], [10, 1.0, 2.0, 5.0, 2.5, 40, 50, 20, 1.0, 10], [11, 1.1, 2.2, 5.5, 2.5, 44, 55, 22, 1.1, 11], [12, 1.2, 2.4, 6.0, 2.5, 48, 60, 24, 1.2, 12], [13, 1.3, 2.6, 6.5, 2.5, 52, 65, 26, 1.3, 13], [14, 1.4, 2.8, 7.0, 2.5, 56, 70, 28, 1.4, 14], [15, 1.5, 3.0, 7.5, 2.5, 60, 75, 30, 1.5, 15], [16, 1.6, 3.2, 8.0, 2.5, 64, 80, 32, 1.6, 16], [17, 1.7, 3.4, 8.5, 2.5, 68, 85, 34, 1.7, 17], [18, 1.8, 3.6, 9.0, 2.5, 72, 90, 36, 1.8, 18], [19, 1.9, 3.8, 9.5, 2.5, 76, 95, 38, 1.9, 19], [20, 2.0, 4.0, 10.0, 2.5, 80, 100, 40, 2.0, 20], [22, 2.2, 4.4, 11.0, 2.5, 88, 110, 44, 2.2, 22], [24, 2.4, 4.8, 12.0, 2.5, 96, 120, 48, 2.4, 24], [26, 2.6, 5.2, 13.0, 5, 104, 130, 52, 2.6, 26], [28, 2.8, 5.6, 14.0, 5, 112, 140, 56, 2.8, 28], [30, 3.0, 6.0, 15.0, 5, 120, 150, 60, 3.0, 30], [35, 3.5, 7.0, 17.5, 5, 140, 175, 70, 3.5, 35], [40, 4.0, 8.0, 20.0, 5, 160, 200, 80, 4.0, 40], [45, 4.5, 9.0, 22.5, 5, 180, 225, 90, 4.5, 45], [50, 5.0, 10.0, 25.0, 5, 200, 250, 100, 5.0, 50], [55, 5.5, 11.0, 27.5, 5, 220, 275, 110, 5.5, 55], [60, 6.0, 12.0, 30.0, 5, 240, 300, 120, 6.0, 60], [65, 6.5, 13.0, 30, 5, 250, 325, 130, 6.5, 65], [70, 7.0, 14.0, 30, 5, 250, 350, 140, 7.0, 70], [75, 7.5, 15.0, 30, 5, 250, 375, 150, 7.5, 75], [80, 8.0, 16.0, 30, 5, 250, 400, 160, 8.0, 80]];
final hyponatraemiaData = [[2, 8], [2.5, 10.0], [3, 12], [3.5, 14.0], [4, 16], [4.5, 18.0], [5, 20], [5.5, 22.0], [6, 24], [7, 28], [8, 32], [9, 36], [10, 40], [11, 44], [12, 48], [13, 52], [14, 56], [15, 60], [16, 64], [17, 68], [18, 72], [19, 76], [20, 80], [22, 88], [24, 96], [26, 104], [28, 112], [30, 120], [35, 140], [40, 160], [45, 180], [50, 200], [55, 220], [60, 240], [65, 260], [70, 280], [75, 300], [80, 320]];
final symptomHypocalData = [[2, 1.0], [2.5, 1.25], [3, 1.5], [3.5, 1.75], [4, 2.0], [4.5, 2.25], [5, 2.5], [5.5, 2.75], [6, 3.0], [7, 3.5], [8, 4.0], [9, 4.5], [10, 5.0], [11, 5.5], [12, 6.0], [13, 6.5], [14, 7.0], [15, 7.5], [16, 8.0], [17, 8.5], [18, 9.0], [19, 9.5], [20, 10.0], [22, 11.0], [24, 12.0], [26, 13.0], [28, 14.0], [30, 15.0], [35, 17.5], [40, 20.0], [45, 20], [50, 20], [55, 20], [60, 20], [65, 20], [70, 20], [75, 20], [80, 20]];
final hypomagData = [[2, 100, 0.2, 0.6], [2.5, 125.0, 0.25, 0.75], [3, 150, 0.3, 0.9], [3.5, 175.0, 0.35, 1.05], [4, 200, 0.4, 1.2], [4.5, 225.0, 0.45, 1.35], [5, 250, 0.5, 1.5], [5.5, 275.0, 0.55, 1.65], [6, 300, 0.6, 1.8], [7, 350, 0.7, 2.1], [8, 400, 0.8, 2.4], [9, 450, 0.9, 2.7], [10, 500, 1.0, 3.0], [11, 550, 1.1, 3.3], [12, 600, 1.2, 3.6], [13, 650, 1.3, 3.9], [14, 700, 1.4, 4.2], [15, 750, 1.5, 4.5], [16, 800, 1.6, 4.8], [17, 850, 1.7, 5.1], [18, 900, 1.8, 5.4], [19, 950, 1.9, 5.7], [20, 1000, 2.0, 6.0], [22, 1100, 2.2, 6.6], [24, 1200, 2.4, 7.2], [26, 1300, 2.6, 7.8], [28, 1400, 2.8, 8.4], [30, 1500, 3.0, 9.0], [35, 1750, 3.5, 10.5], [40, 2000, 4.0, 12.0], [45, 2250, 4.5, 13.5], [50, 2500, 5.0, 15.0], [55, 2750, 5.5, 16.5], [60, 3000, 6.0, 18.0], [65, 3250, 6.5, 19.5], [70, 3500, 7.0, 21.0], [75, 3750, 7.5, 22.5], [80, 4000, 8.0, 24.0]];
final hypoglyData = [[2, 10, 4, 0.5, 0.5], [2.5, 12.5, 5.0, 0.5, 0.5], [3, 15, 6, 0.5, 0.5], [3.5, 17.5, 7.0, 0.5, 0.5], [4, 20, 8, 0.5, 0.5], [4.5, 22.5, 9.0, 0.5, 0.5], [5, 25, 10, 0.5, 0.5], [5.5, 27.5, 11.0, 0.5, 0.5], [6, 30, 12, 0.5, 0.5], [7, 35, 14, 0.5, 0.5], [8, 40, 16, 0.5, 0.5], [9, 45, 18, 0.5, 0.5], [10, 50, 20, 0.5, 0.5], [11, 55, 22, 0.5, 0.5], [12, 60, 24, 0.5, 0.5], [13, 65, 26, 0.5, 0.5], [14, 70, 28, 0.5, 0.5], [15, 75, 30, 0.5, 0.5], [16, 80, 32, 0.5, 0.5], [17, 85, 34, 0.5, 0.5], [18, 90, 36, 0.5, 0.5], [19, 95, 38, 0.5, 0.5], [20, 100, 40, 0.5, 0.5], [22, 110, 44, 0.5, 0.5], [24, 120, 48, 0.5, 0.5], [26, 130, 52, 1, 1], [28, 140, 56, 1, 1], [30, 150, 60, 1, 1], [35, 175, 70, 1, 1], [40, 200, 80, 1, 1], [45, 225, 90, 1, 1], [50, 250, 100, 1, 1], [55, 275, 110, 1, 1], [60, 300, 120, 1, 1], [65, 325, 130, 1, 1], [70, 350, 140, 1, 1], [75, 375, 150, 1, 1], [80, 400, 160, 1, 1]];
final hypokalArrithData = [[2, 8], [2.5, 10.0], [3, 12], [3.5, 14.0], [4, 16], [4.5, 18.0], [5, 20], [5.5, 22.0], [6, 24], [7, 28], [8, 32], [9, 36], [10, 40], [11, 42], [12, 44], [13, 46], [14, 48], [15, 50], [16, 52], [17, 54], [18, 56], [19, 58], [20, 60], [22, 62], [24, 64], [26, 66], [28, 68], [30, 70], [35, 75], [40, 80], [45, 85], [50, 90], [55, 95], [60, 100], [65, 105], [70, 110], [75, 115], [80, 120]];

hyperkalCalcChlorideDisplay(BuildContext context) {
  var currentData = hyperkalData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Hyperkalaemia - Calcium Chloride",
      finalDisplayEmpty(),
      finalDisplayDilute(context, "Use:", "calcium chloride 10%", ""),
      finalDisplayGive(context, "Give: ", "${currentData[1]} - ${currentData[2]} mL"),
      finalDisplayFormula(context, "0.1 - 0.2 mL/kg"));

  return popup;
}

hyperkalCalcGluDisplay(BuildContext context) {
  var currentData = hyperkalData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Hyperkalaemia - Calcium Gluconate",
      finalDisplayEmpty(),
      finalDisplayDilute(context, "Use:", "calcium gluconate 10%", ""),
      finalDisplayGive(context, "Give: ", "${currentData[3]} mL"),
      finalDisplayFormula(context, "0.5 mL/kg"));

  return popup;
}

hyperkalSalbutDisplay(BuildContext context) {
  var currentData = hyperkalData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Hyperkalaemia - Salbutamol",
      finalDisplayGive(context, "Give:", "${currentData[4]} mL nebulised"),
      finalDisplayCentre(context, "", "", "or"),
      finalDisplayGive(context, "Give: ", "${currentData[5]} mL IV"),
      finalDisplayFormula(context, "4 \u03bcg/kg IV"));

  return popup;
}

hyperkalInsGluDisplay(BuildContext context) {
  var currentData = hyperkalData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Hyperkalaemia - Insulin and Glucose",
      finalDisplayDilute(context, "Give:", "${currentData[6]} mL", "of glucose 10%"),
      finalDisplayDilute(context, "or", "${currentData[7]} mL", "of glucose 25%"),
      finalDisplayCentre(context, "plus short acting Insulin, ","${currentData[8]}", " units IV"),
      finalDisplayFormula(context, "5 mL/kg of glucose 10%\n2 mL/kg of glucose 25%\n0.1 /kg of insulin IV"));

  return popup;
}


hyperkalSodiumBicarbDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = hyperkalData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Hyperkalaemia - Sodium Bicarbonate",
      finalDisplayDilute(context, "Use:", "sodium bicarbonate 8.4% ", "(if acidosis)"),
      finalDisplayGive(context, "Give: ", "${currentData[9]} mL"),
      finalDisplaySecondary(context, "Calcium and bicarbonate\nshould be given using different lines", "", ""),
      finalDisplayFormula(context, "1 mL/kg "));


  return popup;
}

hyponatraemiaDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = hyponatraemiaData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Hyponatraemia with seizures",
      finalDisplayDilute(context, "Use:", "sodium chloride 3%", ""),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mL"),
      finalDisplaySecondary(context, "over 15 - 30 minutes", "", ""),
      finalDisplayFormula(context, "4 mL/kg"));
  return popup;
}

hypocalcDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = symptomHypocalData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Symptomatic Hypocalcaemia",
      finalDisplayDilute(context, "Use:", "Calcium gluconate 10%", ""),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mL"),
      finalDisplaySecondary(context, "over 10 minutes", "", ""),
      finalDisplayFormula(context, "0.5 mL/kg"));

  return popup;
}

hypomagDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = hypomagData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Symptomatic Hypocalcaemia",
      finalDisplayDilute(context, "Dilute:", "to at least ${currentData[3]} mL", ""),
      finalDisplayGive(context, "Give:", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "", "", "${currentData[2]} mL of 50% MgS04\nover 15 - 30 minutes"),
      finalDisplayFormula(context, "50 mg/kg"));

  return popup;
}

hypomglyGlucoseDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = hypoglyData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Hypoglycaemia - glucose",
      finalDisplayBold(context, "Give:", "","${currentData[1]} mL ", "of glucose 10%"),
      finalDisplayEmpty(),
      finalDisplayBold(context, "or","", "${currentData[2]} mL ", "of glucose 25%"),
      finalDisplayFormula(context, "5 mL/kg of glucose 10%\n2 mL/kg of glucose 25%"));
  return popup;
}

hypomglyGlucagonDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = hypoglyData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Hypoglycaemia - glucagon",
      finalDisplayBold(context, "Give:", "","${currentData[3]} mL", ""),
      finalDisplaySecondary(context, "or ", " ${currentData[4]} mg", ""),
      finalDisplayEmpty(),
      finalDisplayFormula(context, "0.5 mg when weight < 25 kg\notherwise use 1 mg"));
  return popup;
}

hypokalArrDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = hypokalArrithData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Hypokalaemia with Arryhythmias",
      finalDisplayDilute(context, "Reconstitute:"," up to 40 mmol KCl/L", ""),
      finalDisplayGive(context, "Give:", "${currentData[1]} mL/hr"),
      finalDisplaySecondary(context, "Infuse at maintenance rates\ngive through a peripheral line", "", ""),
      finalDisplayFormula(context, "solution up to\n40 mmol KCl/L"));

  return popup;
}