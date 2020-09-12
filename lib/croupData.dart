import 'package:flutter/material.dart';
import 'all_sizings.dart';
import 'homeScreen.dart';

final croupNebAdrenalineData = [[2, 'Not Available', 'Not Available'], [2.5, 'Not Available', 'Not Available'], [3, 'Not Available', 'Not Available'], [3.5, 'Not Available', 'Not Available'], [4, 'Not Available', 'Not Available'], [4.5, 'Not Available', 'Not Available'], [5, 'Not Available', 'Not Available'], [5.5, 'Not Available', 'Not Available'], [6, 3.0, 3.0], [7, 3.5, 3.5], [8, 4.0, 4.0], [9, 4.5, 4.5], [10, 5.0, 5.0], [11, 5, 5], [12, 5, 5], [13, 5, 5], [14, 5, 5], [15, 5, 5], [16, 5, 5], [17, 5, 5], [18, 5, 5], [19, 5, 5], [20, 5, 5], [22, 5, 5], [24, 5, 5], [26, 5, 5], [28, 5, 5], [30, 5, 5], [35, 5, 5], [40, 5, 5], [45, 5, 5], [50, 5, 5], [55, 5, 5], [60, 5, 5], [65, 5, 5], [70, 5, 5], [75, 5, 5], [80, 5, 5]];
final croupDexamethData = [[2, 'Not Available', 'Not Available'], [2.5, 'Not Available', 'Not Available'], [3, 'Not Available', 'Not Available'], [3.5, 'Not Available', 'Not Available'], [4, 'Not Available', 'Not Available'], [4.5, 'Not Available', 'Not Available'], [5, 'Not Available', 'Not Available'], [5.5, 'Not Available', 'Not Available'], [6, 0.9, 'NA'], [7, 1.05, 'NA'], [8, 1.2, 'NA'], [9, 1.35, 'NA'], [10, 1.5, 'NA'], [11, 1.65, 'NA'], [12, 1.8, 'NA'], [13, 1.95, 'NA'], [14, 2.1, 'NA'], [15, 2.25, 'NA'], [16, 2.4, 'NA'], [17, 2.55, 'NA'], [18, 2.7, 'NA'], [19, 2.85, 'NA'], [20, 3.0, 'NA'], [22, 3.3, 12], [24, 3.6, 12], [26, 3.9, 12], [28, 4.2, 12], [30, 4.5, 12], [35, 5.25, 12], [40, 6.0, 12], [45, 6.75, 12], [50, 7.5, 12], [55, 8, 12], [60, 8, 12], [65, 8, 12], [70, 8, 12], [75, 8, 12], [80, 8, 12]];
final croupPrednisoloneData = [[2, 'Not Available'], [2.5, 'Not Available'], [3, 'Not Available'], [3.5, 'Not Available'], [4, 'Not Available'], [4.5, 'Not Available'], [5, 'Not Available'], [5.5, 'Not Available'], [6, 6], [7, 7], [8, 8], [9, 9], [10, 10], [11, 11], [12, 12], [13, 13], [14, 14], [15, 15], [16, 16], [17, 17], [18, 18], [19, 19], [20, 20], [22, 22], [24, 24], [26, 26], [28, 28], [30, 30], [35, 35], [40, 40], [45, 45], [50, 50], [55, 55], [60, 60], [65, 65], [70, 70], [75, 75], [80, 80]];

croupNebAdrenalineDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = croupNebAdrenalineData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Nebulised Adrenaline",
      finalDisplayDilute(context, "Dilute: ", "1:1000", ""),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mL"),
      finalDisplaySecondary(context, "(", "${currentData[2]} ", " mg of 1:1000)"),
      finalDisplayFormula(context, "0.5 mg/kg"));

  return popup;
}

croupDexamethDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = croupDexamethData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Dexamethasone ",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} - ${currentData[2]} mg"),
      finalDisplayEmpty(),
      finalDisplayFormula(context, "0.15 - 0.6 mg/kg"));

  return popup;
}

croupPrednisoloneDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = croupPrednisoloneData[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Prednisolone",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplayEmpty(),
      finalDisplayFormula(context, "1 mg/kg (repeat in 24 hrs)"));


  return popup;
}

