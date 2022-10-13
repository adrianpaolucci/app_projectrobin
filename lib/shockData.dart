import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'all_sizings.dart';
import 'interventionMainScreen.dart';

var interventionColour = intColors[1];


final shockFluid = [[2, 10, 20], [2.5, 12.5, 25.0], [3, 15, 30], [3.5, 17.5, 35.0], [4, 20, 40], [4.5, 22.5, 45.0], [5, 25, 50], [5.5, 27.5, 55.0], [6, 30, 60], [7, 35, 70], [8, 40, 80], [9, 45, 90], [10, 50, 100], [11, 55, 110], [12, 60, 120], [13, 65, 130], [14, 70, 140], [15, 75, 150], [16, 80, 160], [17, 85, 170], [18, 90, 180], [19, 95, 190], [20, 100, 200], [22, 110, 220], [24, 120, 240], [26, 130, 260], [28, 140, 280], [30, 150, 300], [35, 175, 350], [40, 200, 400], [45, 225, 450], [50, 250, 500], [55, 275, 550], [60, 300, 600], [65, 325, 650], [70, 350, 700], [75, 375, 750], [80, 400, 800]];
final shockAdrenaline = [[2, 0.6, 1.2], [2.5, 0.75, 1.5], [3, 0.9, 1.8], [3.5, 1.05, 2.1], [4, 1.2, 2.4], [4.5, 1.35, 2.7], [5, 1.5, 3.0], [5.5, 1.65, 3.3], [6, 1.8, 3.6], [7, 2.1, 4.2], [8, 2.4, 4.8], [9, 2.7, 5.4], [10, 3.0, 6.0], [11, 3.3, 6.6], [12, 3.6, 7.2], [13, 3.9, 7.8], [14, 4.2, 8.4], [15, 4.5, 9.0], [16, 4.8, 9.6], [17, 5.1, 10.2], [18, 5.4, 10.8], [19, 5.7, 11.4], [20, 6.0, 12.0], [22, 6.6, 13.2], [24, 7.2, 14.4], [26, 7.8, 15.6], [28, 8.4, 16.8], [30, 9.0, 18.0], [35, 10.5, 21.0], [40, 12.0, 24.0], [45, 13.5, 27.0], [50, 15.0, 30.0], [55, 16.5, 33.0], [60, 18.0, 36.0], [65, 19.5, 39.0], [70, 21.0, 42.0], [75, 22.5, 45.0], [80, 24.0, 48.0]];
final shockNoradrenaline = [[2, 0.6, 1.2], [2.5, 0.75, 1.5], [3, 0.9, 1.8], [3.5, 1.05, 2.1], [4, 1.2, 2.4], [4.5, 1.35, 2.7], [5, 1.5, 3.0], [5.5, 1.65, 3.3], [6, 1.8, 3.6], [7, 2.1, 4.2], [8, 2.4, 4.8], [9, 2.7, 5.4], [10, 3.0, 6.0], [11, 3.3, 6.6], [12, 3.6, 7.2], [13, 3.9, 7.8], [14, 4.2, 8.4], [15, 4.5, 9.0], [16, 4.8, 9.6], [17, 5.1, 10.2], [18, 5.4, 10.8], [19, 5.7, 11.4], [20, 6.0, 12.0], [22, 6.6, 13.2], [24, 7.2, 14.4], [26, 7.8, 15.6], [28, 8.4, 16.8], [30, 9.0, 18.0], [35, 10.5, 21.0], [40, 12.0, 24.0], [45, 13.5, 27.0], [50, 15.0, 30.0], [55, 16.5, 33.0], [60, 18.0, 36.0], [65, 19.5, 39.0], [70, 21.0, 42.0], [75, 22.5, 45.0], [80, 24.0, 48.0]];
final shockDobutamine = [[2, 6, 12], [2.5, 7.5, 15.0], [3, 9, 18], [3.5, 10.5, 21.0], [4, 12, 24], [4.5, 13.5, 27.0], [5, 15, 30], [5.5, 16.5, 33.0], [6, 18, 36], [7, 21, 42], [8, 24, 48], [9, 27, 54], [10, 30, 60], [11, 33, 66], [12, 36, 72], [13, 39, 78], [14, 42, 84], [15, 45, 90], [16, 48, 96], [17, 51, 102], [18, 54, 108], [19, 57, 114], [20, 60, 120], [22, 66, 132], [24, 72, 144], [26, 78, 156], [28, 84, 168], [30, 90, 180], [35, 105, 210], [40, 120, 240], [45, 135, 270], [50, 150, 300], [55, 165, 330], [60, 180, 360], [65, 195, 390], [70, 210, 420], [75, 225, 450], [80, 240, 480]];
final shockDopamine = [[2, 6, 12], [2.5, 7.5, 15.0], [3, 9, 18], [3.5, 10.5, 21.0], [4, 12, 24], [4.5, 13.5, 27.0], [5, 15, 30], [5.5, 16.5, 33.0], [6, 18, 36], [7, 21, 42], [8, 24, 48], [9, 27, 54], [10, 30, 60], [11, 33, 66], [12, 36, 72], [13, 39, 78], [14, 42, 84], [15, 45, 90], [16, 48, 96], [17, 51, 102], [18, 54, 108], [19, 57, 114], [20, 60, 120], [22, 66, 132], [24, 72, 144], [26, 78, 156], [28, 84, 168], [30, 90, 180], [35, 105, 210], [40, 120, 240], [45, 135, 270], [50, 150, 300], [55, 165, 330], [60, 180, 360], [65, 195, 390], [70, 210, 420], [75, 225, 450], [80, 240, 480]];
final shockStressDose = [[2, 4], [2.5, 5.0], [3, 6], [3.5, 7.0], [4, 8], [4.5, 9.0], [5, 10], [5.5, 11.0], [6, 12], [7, 14], [8, 16], [9, 18], [10, 20], [11, 22], [12, 24], [13, 26], [14, 28], [15, 30], [16, 32], [17, 34], [18, 36], [19, 38], [20, 40], [22, 44], [24, 48], [26, 52], [28, 56], [30, 60], [35, 70], [40, 80], [45, 90], [50, 100], [55, 110], [60, 120], [65, 130], [70, 140], [75, 150], [80, 160]];

shockFluidDisplay(BuildContext context) {
  var currentData = shockFluid[weightIndex];
  var popup = finalDisplayFull(interventionColour,
      context,
      "Fluid Bolus",
      finalDisplayDilute(context, "Drug:", "sodium chloride 0.9%", ""),
      finalDisplayGive(context, "Give: ", "${currentData[1]} - ${currentData[2]} mL"),
      finalDisplayEmpty(),
      finalDisplayFormula(context, "10 - 20 mL/kg"));
  return popup;
}

shockAdrenalineDisplay(BuildContext context) {
  var currentData = shockAdrenaline[weightIndex];
  var popup = finalDisplayFull(interventionColour,
      context,
      "Adrenaline",
      finalDisplayDilute(context, "Dilute:", " ${currentData[1]} mg made up to 50 mL", "(or ${currentData[2]} mg made up to 100 mL)\nglucose 5%"),
      finalDisplayGive(context, "Give:", "1-10 mL/hr initially"),
      finalDisplayEmpty(),
      finalDisplayFormula(context, "0.05 \u03bcg/kg/min"));
  return popup;
}

shockNoradrenalineDisplay(BuildContext context) {
  var currentData = shockNoradrenaline[weightIndex];
  var popup = finalDisplayFull(interventionColour,
      context,
      "Noradrenaline",
      finalDisplayDilute(context, "Dilute:", " ${currentData[1]} mg made up to 50 mL", "(or ${currentData[2]} mg made up to 100 mL)\nglucose 5%"),
      finalDisplayGive(context, "Give:", "1-10 mL/hr initially"),
      finalDisplayEmpty(),
      finalDisplayFormula(context, "0.05 \u03bcg/kg/min"));

  return popup;
}

shockDobutamineDisplay(BuildContext context) {
  var currentData = shockDobutamine[weightIndex];
  var popup = finalDisplayFull(interventionColour,
      context,
      "Dobutamine",
      finalDisplayDilute(context, "Dilute:", " ${currentData[1]} mg made up to 50 mL", "(or ${currentData[2]} mg made up to 100 mL)\nglucose 5%"),
      finalDisplayGive(context, "Give:", "10 mL/hr initially"),
      finalDisplaySecondary(context, "Titrate down according to response", "", ""),
      finalDisplayFormula(context, "5 \u03bcg/kg/min"));
  return popup;
}

shockDopamineDisplay(BuildContext context) {
  var currentData = shockDopamine[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Dopamine",
      finalDisplayDilute(context, "Dilute:", " ${currentData[1]} mg made up to 50 mL", "(or ${currentData[2]} mg made up to 100 mL)\nglucose 5%"),
      finalDisplayGive(context, "Give:", "10 mL/hr initially"),
      finalDisplaySecondary(context, "Titrate down according to response", "", ""),
      finalDisplayFormula(context, "5 \u03bcg/kg/min"));

  return popup;
}

shockStressDoseDisplay(BuildContext context) {
  var currentData = shockStressDose[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Stress-dose (Hydrocortisone)",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context,"(undiluted)","",""),
      finalDisplayFormula(context, "2 mg/kg"));

  return popup;
}

