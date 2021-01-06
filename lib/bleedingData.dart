import 'package:flutter/material.dart';
import 'all_sizings.dart';
import 'homeScreen.dart';
import 'interventionMainScreen.dart';

var interventionColour = intColors[2];


final tranexamicAcidData = [[2, 30, 4, 0.4, 20], [2.5, 37.5, 5.0, 0.5, 25.0], [3, 45, 6, 0.6, 30], [3.5, 52.5, 7.0, 0.7, 35.0], [4, 60, 8, 0.8, 40], [4.5, 67.5, 9.0, 0.9, 45.0], [5, 75, 10, 1.0, 50], [5.5, 82.5, 11.0, 1.1, 55.0], [6, 90, 12, 1.2, 60], [7, 105, 14, 1.4, 70], [8, 120, 16, 1.6, 80], [9, 135, 18, 1.8, 90], [10, 150, 20, 2.0, 100], [11, 165, 22, 2.2, 110], [12, 180, 24, 2.4, 120], [13, 195, 26, 2.6, 130], [14, 210, 28, 2.8, 140], [15, 225, 30, 3.0, 150], [16, 240, 32, 3.2, 160], [17, 255, 34, 3.4, 170], [18, 270, 36, 3.6, 180], [19, 285, 38, 3.8, 190], [20, 300, 40, 4.0, 200], [22, 330, 44, 4.4, 220], [24, 360, 48, 4.8, 240], [26, 390, 52, 5.2, 260], [28, 420, 56, 5.6, 280], [30, 450, 60, 6.0, 300], [35, 525, 70, 7.0, 350], [40, 600, 80, 8.0, 400], [45, 675, 90, 9.0, 450], [50, 750, 100, 10.0, 500], [55, 825, 110, 11.0, 550], [60, 900, 120, 12.0, 600], [65, 975, 130, 13.0, 650], [70, 1050, 140, 14.0, 700], [75, 1125, 150, 15.0, 750], [80, 1200, 160, 16.0, 800]];
final packedRedCellsData = [[2, 20], [2.5, 25.0], [3, 30], [3.5, 35.0], [4, 40], [4.5, 45.0], [5, 50], [5.5, 55.0], [6, 60], [7, 70], [8, 80], [9, 90], [10, 100], [11, 110], [12, 120], [13, 130], [14, 140], [15, 150], [16, 160], [17, 170], [18, 180], [19, 190], [20, 200], [22, 220], [24, 240], [26, 260], [28, 280], [30, 300], [35, 350], [40, 400], [45, 450], [50, 500], [55, 550], [60, 600], [65, 650], [70, 700], [75, 750], [80, 800]];
final frozenPlasmaData = [[2, 30], [2.5, 37.5], [3, 45], [3.5, 52.5], [4, 60], [4.5, 67.5], [5, 75], [5.5, 82.5], [6, 90], [7, 105], [8, 120], [9, 135], [10, 150], [11, 165], [12, 180], [13, 195], [14, 210], [15, 225], [16, 240], [17, 255], [18, 270], [19, 285], [20, 300], [22, 330], [24, 360], [26, 390], [28, 420], [30, 450], [35, 525], [40, 600], [45, 675], [50, 750], [55, 825], [60, 900], [65, 975], [70, 1050], [75, 1125], [80, 1200]];
final cryoprecipitateData = [[2, 10], [2.5, 12.5], [3, 15], [3.5, 17.5], [4, 20], [4.5, 22.5], [5, 25], [5.5, 27.5], [6, 30], [7, 35], [8, 40], [9, 45], [10, 50], [11, 55], [12, 60], [13, 65], [14, 70], [15, 75], [16, 80], [17, 85], [18, 90], [19, 95], [20, 100], [22, 110], [24, 120], [26, 130], [28, 140], [30, 150], [35, 175], [40, 200], [45, 225], [50, 250], [55, 275], [60, 300], [65, 325], [70, 350], [75, 375], [80, 400]];
final plateletsData = [[2, 20, 30], [2.5, 25.0, 37.5], [3, 30, 45], [3.5, 35.0, 52.5], [4, 40, 60], [4.5, 45.0, 67.5], [5, 50, 75], [5.5, 55.0, 82.5], [6, 60, 90], [7, 70, 105], [8, 80, 120], [9, 90, 135], [10, 100, 150], [11, 110, 165], [12, 120, 180], [13, 130, 195], [14, 140, 210], [15, 150, 225], [16, 160, 240], [17, 170, 255], [18, 180, 270], [19, 190, 285], [20, 200, 300], [22, 220, 330], [24, 240, 360], [26, 260, 390], [28, 280, 420], [30, 300, 450], [35, 350, 525], [40, 400, 600], [45, 450, 675], [50, 500, 750], [55, 550, 825], [60, 600, 900], [65, 650, 975], [70, 700, 1050], [75, 750, 1125], [80, 800, 1200]];

tranexamicDisplay(BuildContext context) {
  var currentData = tranexamicAcidData[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Tranexamic acid ",
      finalDisplayDilute(context, "Loading dose: ", "${currentData[1]} mg", "(over 10 minutes)\n"),
      finalDisplayDilute(context, "Dilute: ", "10 mg/mL", ""),
      finalDisplayDilute(context, "Give: ", "${currentData[3]} mL/hr","(until bleeding ceases)"),
      finalDisplayFormula(context, "15 mg/kg loading dose\n2 mg/kg/hr"));

  return popup;
}

redCellsDisplay(BuildContext context) {
  var currentData = packedRedCellsData[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Packed Red Blood Cells",
      finalDisplayEmpty(),
      finalDisplayDilute(context, "Give: ", "${currentData[1]} mL","of packed red blood cells"),
      finalDisplayEmpty(),
      finalDisplayFormula(context, "10 mL/kg"));

  return popup;
}

frozenPlasmaDisplay(BuildContext context) {
var currentData = frozenPlasmaData[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Fresh Frozen Plasma",
      finalDisplayCentre(context, "If PT/APTT > 1.5x normal,", "",""),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mL"),
      finalDisplayEmpty(),
      finalDisplayFormula(context, "15 mL/kg"));

return popup;
}

cryoprecipitateDisplay(BuildContext context) {
  var currentData = cryoprecipitateData[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Cryoprecipitate",
      finalDisplayCentre(context, "If fibrinogen < 2 g/L", "", ""),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mL"),
      finalDisplayEmpty(),
      finalDisplayFormula(context, "5-10 mL/kg"));

  return popup;
}

plateletsDisplay(BuildContext context) {
  var currentData = plateletsData[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Platelets",
      finalDisplayCentre(context, "If platelets < 50 x 10\u2079/L", "", ""),
      finalDisplayGive(context, "Give: ", "${currentData[1]} - ${currentData[2]} mL"),
      finalDisplayEmpty(),
      finalDisplayFormula(context, "10 - 15 mL/kg"));

  return popup;
}