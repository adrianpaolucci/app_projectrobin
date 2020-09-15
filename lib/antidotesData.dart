import 'package:flutter/material.dart';
import 'all_sizings.dart';
import 'homeScreen.dart';
import 'interventionMainScreen.dart';

var interventionColour = intColors[10];


final antidoteAtropineData = [[2, 40], [2.5, 50.0], [3, 60], [3.5, 70.0], [4, 80], [4.5, 90.0], [5, 100], [5.5, 110.0], [6, 120], [7, 140], [8, 160], [9, 180], [10, 200], [11, 220], [12, 240], [13, 260], [14, 280], [15, 300], [16, 320], [17, 340], [18, 360], [19, 380], [20, 400], [22, 440], [24, 480], [26, 520], [28, 560], [30, 600], [35, 700], [40, 800], [45, 900], [50, 1000], [55, 1100], [60, 1200], [65, 1300], [70, 1400], [75, 1500], [80, 1600]];
final antidotePralidoximeData = [[2, 60, 6.0, 16, 1.6], [2.5, 75.0, 7.5, 20.0, 2.0], [3, 90, 9.0, 24, 2.4], [3.5, 105.0, 10.5, 28.0, 2.8], [4, 120, 12.0, 32, 3.2], [4.5, 135.0, 13.5, 36.0, 3.6], [5, 150, 15.0, 40, 4.0], [5.5, 165.0, 16.5, 44.0, 4.4], [6, 180, 18.0, 48, 4.8], [7, 210, 21.0, 56, 5.6], [8, 240, 24.0, 64, 6.4], [9, 270, 27.0, 72, 7.2], [10, 300, 30.0, 80, 8.0], [11, 330, 33.0, 88, 8.8], [12, 360, 36.0, 96, 9.6], [13, 390, 39.0, 104, 10.4], [14, 420, 42.0, 112, 11.2], [15, 450, 45.0, 120, 12.0], [16, 480, 48.0, 128, 12.8], [17, 510, 51.0, 136, 13.6], [18, 540, 54.0, 144, 14.4], [19, 570, 57.0, 152, 15.2], [20, 600, 60.0, 160, 16.0], [22, 660, 66.0, 176, 17.6], [24, 720, 72.0, 192, 19.2], [26, 780, 78.0, 208, 20.8], [28, 840, 84.0, 224, 22.4], [30, 900, 90.0, 240, 24.0], [35, 1050, 105.0, 280, 28.0], [40, 1200, 120.0, 320, 32.0], [45, 1200, 120.0, 360, 36.0], [50, 1200, 120.0, 400, 40.0], [55, 1200, 120.0, 440, 44.0], [60, 1200, 120.0, 480, 48.0], [65, 1200, 120.0, 520, 52.0], [70, 1200, 120.0, 560, 56.0], [75, 1200, 120.0, 600, 60.0], [80, 1200, 120.0, 640, 64.0]];
final antidotePrazData = [[2, 1, 10, 0.6, 60], [2.5, 1, 10, 0.75, 75.0], [3, 1, 10, 0.9, 90], [3.5, 1, 10, 1.05, 105.0], [4, 1, 10, 1.2, 120], [4.5, 1, 10, 1.35, 135.0], [5, 1, 10, 1.5, 150], [5.5, 1, 10, 1.65, 165.0], [6, 1, 10, 1.8, 180], [7, 1, 10, 2.1, 210], [8, 1, 10, 2.4, 240], [9, 1, 10, 2.7, 270], [10, 1, 10, 3.0, 300], [11, 1, 10, 3.3, 330], [12, 1, 10, 3.6, 360], [13, 1, 10, 3.9, 390], [14, 1, 10, 4.2, 420], [15, 1, 10, 4.5, 450], [16, 1, 10, 4.8, 480], [17, 1, 10, 5.1, 510], [18, 1, 10, 5.4, 540], [19, 1, 10, 5.7, 570], [20, 1, 10, 6.0, 600], [22, 1, 10, 6.6, 660], [24, 1, 10, 7.2, 720], [26, 1, 10, 7.8, 780], [28, 1, 10, 8.4, 840], [30, 1, 10, 9.0, 900], [35, 2, 20, 10.5, 1050], [40, 2, 20, 12.0, 1200], [45, 2, 20, 13.5, 1350], [50, 2, 20, 15.0, 1500], [55, 2, 20, 16.5, 1650], [60, 2, 20, 18.0, 1800], [65, 2, 20, 19.5, 1950], [70, 2, 20, 21.0, 2100], [75, 2, 20, 22.5, 2250], [80, 2, 20, 24.0, 2400]];
final antidoteNAcetylData = [[2, 300, 6, 100, 14, 100, 14, 100, 14], [2.5, 375.0, 7.5, 125.0, 17.5, 125.0, 17.5, 125.0, 17.5], [3, 450, 9, 150, 21, 150, 21, 150, 21], [3.5, 525.0, 10.5, 175.0, 24.5, 175.0, 24.5, 175.0, 24.5], [4, 600, 12, 200, 28, 200, 28, 200, 28], [4.5, 675.0, 13.5, 225.0, 31.5, 225.0, 31.5, 225.0, 31.5], [5, 750, 15, 250, 35, 250, 35, 250, 35], [5.5, 825.0, 16.5, 275.0, 38.5, 275.0, 38.5, 275.0, 38.5], [6, 900, 18, 300, 42, 300, 42, 300, 42], [7, 1050, 21, 350, 49, 350, 49, 350, 49], [8, 1200, 24, 400, 56, 400, 56, 400, 56], [9, 1350, 27, 450, 63, 450, 63, 450, 63], [10, 1500, 30, 500, 70, 500, 70, 500, 70], [11, 1650, 33, 550, 77, 550, 77, 550, 77], [12, 1800, 36, 600, 84, 600, 84, 600, 84], [13, 1950, 39, 650, 91, 650, 91, 650, 91], [14, 2100, 42, 700, 98, 700, 98, 700, 98], [15, 2250, 45, 750, 105, 750, 105, 750, 105], [16, 2400, 48, 800, 112, 800, 112, 800, 112], [17, 2550, 51, 850, 119, 850, 119, 850, 119], [18, 2700, 54, 900, 126, 900, 126, 900, 126], [19, 2850, 57, 950, 133, 950, 133, 950, 133], [20, 3000, 100, 1000, 250, 1000, 250, 1000, 250], [22, 3300, 100, 1100, 250, 1100, 250, 1100, 250], [24, 3600, 100, 1200, 250, 1200, 250, 1200, 250], [26, 3900, 100, 1300, 250, 1300, 250, 1300, 250], [28, 4200, 100, 1400, 250, 1400, 250, 1400, 250], [30, 4500, 100, 1500, 250, 1500, 250, 1500, 250], [35, 5250, 100, 1750, 250, 1750, 250, 1750, 250], [40, 6000, 100, 2000, 250, 2000, 250, 2000, 250], [45, 6750, 100, 2250, 250, 2250, 250, 2250, 250], [50, 7500, 100, 2500, 250, 2500, 250, 2500, 250], [55, 8250, 100, 2750, 250, 2750, 250, 2750, 250], [60, 9000, 100, 3000, 250, 3000, 250, 3000, 250], [65, 9750, 100, 3250, 250, 3250, 250, 3250, 250], [70, 10500, 100, 3500, 250, 3500, 250, 3500, 250], [75, 11250, 100, 3750, 250, 3750, 250, 3750, 250], [80, 12000, 100, 4000, 250, 4000, 250, 4000, 250]];



antidoteAtropineDisplay(BuildContext context){
  var currentData = antidoteAtropineData[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Atropine\nfor organophosphate toxicity",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} \u03bcg"),
      finalDisplayEmpty(),
      finalDisplayFormula(context, "20  \u03bcg/kg "));

  return popup;
}

antidotePralixodimeDisplay(BuildContext context){
  var currentData = antidotePralidoximeData[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Pralixodime\n for organophospate toxicity",
      finalDisplayDilute(context, "Dilute:", "10 mg/mL in isotonic saline", ""),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg initially\n${currentData[2]} mL over 20 minutes"),
      finalDisplayCentre(context, "Infusion: ${currentData[3]} mg/hr\nContinuous infusion: ${currentData[4]} mL/hr", "", ""),
      finalDisplayFormula(context, "30 mg/kg "));

  return popup;
}

antidotePrazosineDisplay(BuildContext context){
  var currentData = antidotePrazData[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Prazosin for scorpion sting",
      finalDisplayDilute(context, "Dilute:", "${currentData[1]} mL with water", ""),
      finalDisplayDilute(context, "Crush: ", "${currentData[2]} x 1 mg tablets",""),
      finalDisplayDilute(context, "Give: ", "${currentData[3]} mL", "${currentData[4]} \u03bcg down NG tube"),
      finalDisplayFormula(context, "30 mg/kg\nusing NG or oral route "));

  return popup;
}

antidoteNAcetylDisplay(BuildContext context) {
  var currentData = antidoteNAcetylData[weightIndex];

  var nAcetylIndividuals = [
    finalDisplayIndividual(
        context,
        finalDisplayCentre(context, "", "Bag 1", ""),
        finalDisplayDilute(context,"Dilute:", "in ${currentData[2]} mL","of glucose 5%"),
        finalDisplayDilute(context, "Give:","${currentData[1]} mg","over 15 minutes"),
        finalDisplayFormula(context,"150 mg/kg in 3 mL/kg")
    ),
    finalDisplayIndividual(
        context,
        finalDisplayCentre(context, "", "Bag 2", ""),
        finalDisplayDilute(context,"Dilute:", "in ${currentData[4]} mL","of glucose 5%"),
        finalDisplayDilute(context, "Give:","${currentData[3]} mg","over 4 hours"),
        finalDisplayFormula(context,"50 mg/kg in 7 mL/kg")
    ),
    finalDisplayIndividual(
        context,
        finalDisplayCentre(context, "", "Bag 3", ""),
        finalDisplayDilute(context,"Dilute:", "in ${currentData[6]} mL","of glucose 5%"),
        finalDisplayDilute(context, "Give:","${currentData[5]} mg","over 8 hours"),
        finalDisplayFormula(context,"50 mg/kg in 7 mL/kg")
    ),
    finalDisplayIndividual(
        context,
        finalDisplayCentre(context, "", "Bag 4", ""),
        finalDisplayDilute(context,"Dilute:", "in ${currentData[8]} mL","of glucose 5%"),
        finalDisplayDilute(context, "Give:","${currentData[7]} mg","over 8 hours"),
        finalDisplayFormula(context,"50 mg/kg in 7 mL/kg")
    ),
  ];

  var popup = finalDisplaySteps(
      context,
      "N-Acetylcysteine - 4 stages",
      4,
      nAcetylIndividuals
  );

  return popup;
}
