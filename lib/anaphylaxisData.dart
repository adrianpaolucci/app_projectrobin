import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'finalDisplay.dart';
import 'all_sizings.dart';

final anaphylaxisIMAdrenaline = [[2, 20], [2.5, 25.0], [3, 30], [3.5, 35.0], [4, 40], [4.5, 45.0], [5, 50], [5.5, 55.0], [6, 60], [7, 70], [8, 80], [9, 90], [10, 100], [11, 110], [12, 120], [13, 130], [14, 140], [15, 150], [16, 160], [17, 170], [18, 180], [19, 190], [20, 200], [22, 220], [24, 240], [26, 260], [28, 280], [30, 300], [35, 350], [40, 400], [45, 450], [50, 500], [55, 550], [60, 600], [65, 650], [70, 700], [75, 750], [80, 800]];
final anaphylaxisIVFluidBolus = [[2, 40], [2.5, 50.0], [3, 60], [3.5, 70.0], [4, 80], [4.5, 90.0], [5, 100], [5.5, 110.0], [6, 120], [7, 140], [8, 160], [9, 180], [10, 200], [11, 220], [12, 240], [13, 260], [14, 280], [15, 300], [16, 320], [17, 340], [18, 360], [19, 380], [20, 400], [22, 440], [24, 480], [26, 520], [28, 560], [30, 600], [35, 700], [40, 800], [45, 900], [50, 1000], [55, 1100], [60, 1200], [65, 1300], [70, 1400], [75, 1500], [80, 1600]];
final anaphylaxisAdrenalineInfusion = [[2, 12], [2.5, 15.0], [3, 18], [3.5, 21.0], [4, 24], [4.5, 27.0], [5, 30], [5.5, 33.0], [6, 36], [7, 42], [8, 48], [9, 54], [10, 60], [11, 66], [12, 72], [13, 78], [14, 84], [15, 90], [16, 96], [17, 102], [18, 108], [19, 114], [20, 120], [22, 132], [24, 144], [26, 156], [28, 168], [30, 180], [35, 210], [40, 240], [45, 270], [50, 300], [55, 330], [60, 360], [65, 390], [70, 420], [75, 450], [80, 480]];
final resuscAdrenalineIVcardiac = [[2, 20, 2.0, 'Large', 'Not Available', 0.2], [2.5, 25.0, 2.5, 'Large', 'Not Available', 0.25], [3, 30, 3.0, 'Large', 'Not Available', 0.3], [3.5, 35.0, 0.35, 'Small', 'Not Available', 0.35], [4, 40, 0.4, 'Small', 'Not Available', 0.4], [4.5, 45.0, 0.45, 'Small', 'Not Available', 0.45], [5, 50, 0.5, 'Small', 'Not Available', 0.5], [5.5, 55.0, 0.55, 'Small', 'Not Available', 0.55], [6, 60, 0.6, 'Small', 'Not Available', 0.6], [7, 70, 0.7, 'Small', 'Not Available', 0.7], [8, 80, 0.8, 'Small', 'Not Available', 0.8], [9, 90, 0.9, 'Small', 'Not Available', 0.9], [10, 100, 1.0, 'Small', 'Not Available', 1.0], [11, 110, 1.1, 'Small', 'Not Available', 1.1], [12, 120, 1.2, 'Small', 'Not Available', 1.2], [13, 130, 1.3, 'Small', 'Not Available', 1.3], [14, 140, 1.4, 'Small', 'Not Available', 1.4], [15, 150, 1.5, 'Small', 'Not Available', 1.5], [16, 160, 1.6, 'Small', 'Not Available', 1.6], [17, 170, 1.7, 'Small', 'Not Available', 1.7], [18, 180, 1.8, 'Small', 'Not Available', 1.8], [19, 190, 1.9, 'Small', 'Not Available', 1.9], [20, 200, 2.0, 'Small', 'Not Available', 2.0], [22, 220, 2.2, 'Small', 'Not Available', 2.2], [24, 240, 2.4, 'Small', 'Not Available', 2.4], [26, 260, 2.5, 'Small', 'Diluted to 10 mL', 2.6], [28, 280, 2.5, 'Small', 'Diluted to 10 mL', 2.8], [30, 300, 2.5, 'Small', 'Diluted to 10 mL', 3.0], [35, 350, 2.5, 'Small', 'Diluted to 10 mL', 3.5], [40, 400, 2.5, 'Small', 'Diluted to 10 mL', 4.0], [45, 450, 2.5, 'Small', 'Diluted to 10 mL', 4.5], [50, 1000, 2.5, 'Small', 'Diluted to 10 mL', 10.0], [55, 1000, 2.5, 'Small', 'Diluted to 10 mL', 10.0], [60, 1000, 2.5, 'Small', 'Diluted to 10 mL', 10.0], [65, 1000, 2.5, 'Small', 'Diluted to 10 mL', 10.0], [70, 1000, 2.5, 'Small', 'Diluted to 10 mL', 10.0], [75, 1000, 2.5, 'Small', 'Diluted to 10 mL', 10.0], [80, 1000, 2.5, 'Small', 'Diluted to 10 mL', 10.0]];
final resuscDC = [[2, 10, 'Paediatric'], [2.5, 10, 'Paediatric'], [3, 10, 'Paediatric'], [3.5, 10, 'Paediatric'], [4, 20, 'Paediatric'], [4.5, 20, 'Paediatric'], [5, 20, 'Paediatric'], [5.5, 20, 'Paediatric'], [6, 20, 'Paediatric'], [7, 30, 'Paediatric'], [8, 30, 'Paediatric'], [9, 30, 'Paediatric'], [10, 50, 'Paediatric'], [11, 50, 'Adult/Child'], [12, 50, 'Adult/Child'], [13, 50, 'Adult/Child'], [14, 50, 'Adult/Child'], [15, 70, 'Adult/Child'], [16, 70, 'Adult/Child'], [17, 70, 'Adult/Child'], [18, 70, 'Adult/Child'], [19, 70, 'Adult/Child'], [20, 100, 'Adult/Child'], [22, 100, 'Adult/Child'], [24, 100, 'Adult/Child'], [26, 100, 'Adult/Child'], [28, 100, 'Adult/Child'], [30, 150, 'Adult/Child'], [35, 150, 'Adult/Child'], [40, 150, 'Adult/Child'], [45, 150, 'Adult/Child'], [50, 150, 'Adult/Child'], [55, 150, 'Adult/Child'], [60, 150, 'Adult/Child'], [65, 150, 'Adult/Child'], [70, 150, 'Adult/Child'], [75, 150, 'Adult/Child'], [80, 150, 'Adult/Child']];
final resuscAtropine = [[2, 40, '600 \u03bcg to 6 mL', 0.067], [2.5, 50.0, '600 \u03bcg to 6 mL', 0.083], [3, 60, '600 \u03bcg to 6 mL', 0.1], [3.5, 70.0, '600 \u03bcg to 6 mL', 0.1167], [4, 80, '600 \u03bcg to 6 mL', 0.133], [4.5, 90.0, '600 \u03bcg to 6 mL', 0.15], [5, 100, '600 \u03bcg to 6 mL', 0.167], [5.5, 110.0, '600 \u03bcg to 6 mL', 0.1833], [6, 120, '600 \u03bcg to 6 mL', 0.2], [7, 140, '600 \u03bcg to 6 mL', 0.233], [8, 160, '600 \u03bcg to 6 mL', 0.267], [9, 180, '600 \u03bcg to 6 mL', 0.3], [10, 200, '600 \u03bcg to 6 mL', 0.33], [11, 220, '600 \u03bcg to 6 mL', 0.367], [12, 240, '600 \u03bcg to 6 mL', 0.4], [13, 260, '600 \u03bcg to 6 mL', 0.433], [14, 280, '600 \u03bcg to 6 mL', 0.467], [15, 300, '600 \u03bcg to 6 mL', 0.5], [16, 320, '600 \u03bcg to 6 mL', 0.533], [17, 340, '600 \u03bcg to 6 mL', 0.567], [18, 360, '600 \u03bcg to 6 mL', 0.6], [19, 380, '600 \u03bcg to 6 mL', 0.633], [20, 400, '600 \u03bcg to 6 mL', 0.67], [22, 440, '600 \u03bcg to 6 mL', 0.733], [24, 480, '600 \u03bcg to 6 mL', 0.8], [26, 520, '600 \u03bcg to 6 mL', 0.867], [28, 560, '600 \u03bcg to 6 mL', 0.933], [30, 600, 'Undiluted (600 \u03bcg in 1 mL) - ADULT dose', 1], [35, 600, 'Undiluted (600 \u03bcg in 1 mL) - ADULT dose', 1], [40, 600, 'Undiluted (600 \u03bcg in 1 mL) - ADULT dose', 1], [45, 600, 'Undiluted (600 \u03bcg in 1 mL) - ADULT dose', 1], [50, 600, 'Undiluted (600 \u03bcg in 1 mL) - ADULT dose', 1], [55, 600, 'Undiluted (600 \u03bcg in 1 mL) - ADULT dose', 1], [60, 600, 'Undiluted (600 \u03bcg in 1 mL) - ADULT dose', 1], [65, 600, 'Undiluted (600 \u03bcg in 1 mL) - ADULT dose', 1], [70, 600, 'Undiluted (600 \u03bcg in 1 mL) - ADULT dose', 1], [75, 600, 'Undiluted (600 \u03bcg in 1 mL) - ADULT dose', 1], [80, 600, 'Undiluted (600 \u03bcg in 1 mL) - ADULT dose', 1]];
final resuscAmlodarone = [[2, 10, 1, 1.67], [2.5, 12.5, 1, 2.083], [3, 15, 1, 2.5], [3.5, 17.5, 1, 2.9167], [4, 20, 1, 3.33], [4.5, 22.5, 1, 3.75], [5, 25, 1, 4.167], [5.5, 27.5, 1, 4.583], [6, 30, 1, 5.0], [7, 35, 1, 5.833], [8, 40, 1, 6.67], [9, 45, 1, 7.5], [10, 50, 1, 8.33], [11, 55, 1, 9.167], [12, 60, 1, 10.0], [13, 65, 1, 10.833], [14, 70, 1, 11.67], [15, 75, 1, 12.5], [16, 80, 1, 13.33], [17, 85, 1, 14.167], [18, 90, 1, 15.0], [19, 95, 1, 15.833], [20, 100, 1, 16.67], [22, 110, 1, 18.33], [24, 120, 1, 20.0], [26, 130, 1, 21.67], [28, 140, 1, 23.33], [30, 150, 1, 25.0], [35, 175, 2, 29.167], [40, 200, 2, 33.33], [45, 225, 2, 37.5], [50, 250, 2, 41.67], [55, 275, 2, 45.833], [60, 300, 2, 50.0], [65, 300, 2, 50.0], [70, 300, 2, 50.0], [75, 300, 2, 50.0], [80, 300, 2, 50.0]];
final resuscLignocaine = [[2, 2], [2.5, 2.5], [3, 3], [3.5, 3.5], [4, 4], [4.5, 4.5], [5, 5], [5.5, 5.5], [6, 6], [7, 7], [8, 8], [9, 9], [10, 10], [11, 11], [12, 12], [13, 13], [14, 14], [15, 15], [16, 16], [17, 17], [18, 18], [19, 19], [20, 20], [22, 22], [24, 24], [26, 26], [28, 28], [30, 30], [35, 35], [40, 40], [45, 45], [50, 50], [55, 55], [60, 60], [65, 65], [70, 70], [75, 75], [80, 80]];
final resuscAdenosine1 = [[2, 0.2, 'Diluted 6mg ampoule to 6mL', 0.2], [2.5, 0.25, 'Diluted 6mg ampoule to 6mL', 0.25], [3, 0.3, 'Diluted 6mg ampoule to 6mL', 0.3], [3.5, 0.35, 'Diluted 6mg ampoule to 6mL', 0.35], [4, 0.4, 'Diluted 6mg ampoule to 6mL', 0.4], [4.5, 0.45, 'Undiluted (6mg in 2 mL), use 1 mL syringe', 0.15], [5, 0.5, 'Undiluted (6mg in 2 mL), use 1 mL syringe', 0.167], [5.5, 0.55, 'Undiluted (6mg in 2 mL), use 1 mL syringe', 0.1833], [6, 0.6, 'Undiluted (6mg in 2 mL), use 1 mL syringe', 0.2], [7, 0.7, 'Undiluted (6mg in 2 mL), use 1 mL syringe', 0.233], [8, 0.8, 'Undiluted (6mg in 2 mL), use 1 mL syringe', 0.267], [9, 0.9, 'Undiluted (6mg in 2 mL); use 1 or 2 mL syringe', 0.3], [10, 1.0, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 0.33], [11, 1.1, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 0.367], [12, 1.2, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 0.4], [13, 1.3, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 0.433], [14, 1.4, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 0.467], [15, 1.5, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 0.5], [16, 1.6, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 0.533], [17, 1.7, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 0.5667], [18, 1.8, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 0.6], [19, 1.9, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 0.633], [20, 2.0, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 0.67], [22, 2.2, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 0.73], [24, 2.4, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 0.8], [26, 2.6, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 0.867], [28, 2.8, 'Undiluted (6mg in 2 mL); use 3 mL syringe', 0.933], [30, 3.0, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 1.0], [35, 3.5, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 1.167], [40, 4.0, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 1.33], [45, 4.5, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 1.5], [50, 5.0, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 1.67], [55, 5, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 1.67], [60, 5, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 1.67], [65, 5, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 1.67], [70, 5, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 1.67], [75, 5, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 1.67], [80, 5, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 1.67]];
final resuscAdenosine2 = [[2, 0.4, 'Diluted 6mg ampoule to 6mL', 0.4], [2.5, 0.5, 'Diluted 6mg ampoule to 6mL', 0.5], [3, 0.6, 'Diluted 6mg ampoule to 6mL', 0.6], [3.5, 0.7, 'Diluted 6mg ampoule to 6mL', 0.7], [4, 0.8, 'Diluted 6mg ampoule to 6mL', 0.8], [4.5, 0.9, 'Undiluted (6mg in 2 mL), use 1 mL syringe', 0.3], [5, 1.0, 'Undiluted (6mg in 2 mL), use 1 mL syringe', 0.33], [5.5, 1.1, 'Undiluted (6mg in 2 mL), use 1 mL syringe', 0.367], [6, 1.2, 'Undiluted (6mg in 2 mL), use 1 mL syringe', 0.4], [7, 1.4, 'Undiluted (6mg in 2 mL), use 1 mL syringe', 0.467], [8, 1.6, 'Undiluted (6mg in 2 mL), use 1 mL syringe', 0.533], [9, 1.8, 'Undiluted (6mg in 2 mL); use 1 or 2 mL syringe', 0.6], [10, 2.0, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 0.67], [11, 2.2, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 0.73], [12, 2.4, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 0.8], [13, 2.6, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 0.867], [14, 2.8, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 0.933], [15, 3.0, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 1.0], [16, 3.2, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 1.067], [17, 3.4, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 1.133], [18, 3.6, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 1.2], [19, 3.8, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 1.267], [20, 4.0, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 1.33], [22, 4.4, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 1.467], [24, 4.8, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 1.6], [26, 5.2, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 1.733], [28, 5.6, 'Undiluted (6mg in 2 mL); use 3 mL syringe', 1.867], [30, 6.0, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 2.0], [35, 7.0, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 2.33], [40, 8.0, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 2.67], [45, 9.0, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 3.0], [50, 10.0, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 3.33], [55, 11.0, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 3.67], [60, 12.0, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 4.0], [65, 12, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 4.0], [70, 12, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 4.0], [75, 12, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 4.0], [80, 12, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 4.0]];
final resuscAdenosine3 = [[2, 0.6, 'Diluted 6mg ampoule to 6mL', 0.6], [2.5, 0.75, 'Diluted 6mg ampoule to 6mL', 0.75], [3, 0.9, 'Diluted 6mg ampoule to 6mL', 0.9], [3.5, 1.05, 'Diluted 6mg ampoule to 6mL', 1.05], [4, 1.2, 'Diluted 6mg ampoule to 6mL', 1.2], [4.5, 1.35, 'Undiluted (6mg in 2 mL), use 1 mL syringe', 0.45], [5, 1.5, 'Undiluted (6mg in 2 mL), use 1 mL syringe', 0.5], [5.5, 1.65, 'Undiluted (6mg in 2 mL), use 1 mL syringe', 0.55], [6, 1.8, 'Undiluted (6mg in 2 mL), use 1 mL syringe', 0.6], [7, 2.1, 'Undiluted (6mg in 2 mL), use 1 mL syringe', 0.7], [8, 2.4, 'Undiluted (6mg in 2 mL), use 1 mL syringe', 0.8], [9, 2.7, 'Undiluted (6mg in 2 mL); use 1 or 2 mL syringe', 0.9], [10, 3.0, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 1.0], [11, 3.3, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 1.1], [12, 3.6, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 1.2], [13, 3.9, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 1.3], [14, 4.2, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 1.4], [15, 4.5, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 1.5], [16, 4.8, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 1.6], [17, 5.1, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 1.7], [18, 5.4, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 1.8], [19, 5.7, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 1.9], [20, 6.0, 'Undiluted (6mg in 2 mL); use 1 or 3 mL syringe', 2.0], [22, 6.6, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 2.2], [24, 7.2, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 2.4], [26, 7.8, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 2.6], [28, 8.4, 'Undiluted (6mg in 2 mL); use 3 mL syringe', 2.8], [30, 9.0, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 3.0], [35, 10.5, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 3.5], [40, 12.0, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 4.0], [45, 12, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 4.0], [50, 12, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 4.0], [55, 12, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 4.0], [60, 12, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 4.0], [65, 12, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 4.0], [70, 12, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 4.0], [75, 12, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 4.0], [80, 12, 'Undiluted (6mg in 2 mL); use 3 mL or 5 mL syringe', 4.0]];


anaphylaxisAdrenalineIMDisplay(BuildContext context) {
  var currentData = anaphylaxisIMAdrenaline[weightIndex];

  var popup = finalDisplayFull(
      context,
      "IM Adrenaline",
      finalDisplayDilute(context, "Dilute:", "1:1000", "(small ampoule)"),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mL"),
      finalDisplaySecondary(context, "repeat every ", "5", " minutes as required"),
      finalDisplayFormula(context, "10 \u03bcg/kg IM\n(0.01 mL/kg of 1:1000)"));

  return popup;
}

anaphylaxisFluidDisplay(BuildContext context) {
  var currentData = anaphylaxisIVFluidBolus[weightIndex];


  var popup = finalDisplayFull(
      context,
      "IV Fluid Bolus",
      finalDisplayDilute(context, "Use:", "sodium chloride 0.9%", ""),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mL"),
      finalDisplaySecondary(context, "", "", ""),
      finalDisplayFormula(context, "20 mL/kg"));
  return popup;
}

anaphylaxisInitialAdrenalineDisplay(BuildContext context) {
  var currentData = anaphylaxisAdrenalineInfusion[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Initial (ward) Adrenaline infusion",
      finalDisplayDilute(context, "Reconstitute: ", "1 mg adrenaline in", "1 L sodium chloride 0.9%"),
      finalDisplayGive(context, "Commence at: ", "${currentData[1]} mL/hr"),
      finalDisplaySecondary(context, "", "", ""),
      finalDisplayFormula(context, "Run at 6 mL/kg/hr"));

  return popup;
}

resuscAdrenalineIVDisplay(BuildContext context) {
  var currentData = resuscAdrenalineIVcardiac[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Adrenaline IV (cardiac arrest)",
      finalDisplayDilute(context, "Dilute: ", "1:10000", "(large ampoule)"),
      finalDisplayGive(context, "Give: ", "${currentData[1]} \u03bcg"),
      finalDisplaySecondary(context, "", "", ""),
      finalDisplayFormula(context, "10 \u03bcg/kg IV\n(0.1 mL/kg of 1:10000)"));

  return popup;
}

resuscDCshockDisplay(BuildContext context) {
  var currentData = resuscDC[weightIndex];

  var popup = finalDisplayFull(
      context,
      "DC Shock",
      finalDisplayGive(context, "Use:", "${currentData[2]} pads"),
      finalDisplayGive(context, "Energy: ", "${currentData[1]} J"),
      finalDisplaySecondary(context, "", "", ""),
      finalDisplayFormula(context, "4 J/kg"));

  return popup;
}

resuscAtropineDisplay(BuildContext context) {
  var currentData = resuscAtropine[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Atropine",
      finalDisplayDilute(context, "Dilute:", "${currentData[2]}", ""),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "(", "${currentData[3]} ", "mL of diluted solution)"),
      finalDisplayFormula(context, "20 \u03bcg/kg"));

  return popup;
}

resuscAmlodaroneDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = resuscAmlodarone[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Amlodarone",
      finalDisplayDilute(context, "Dilute:", "${currentData[2]} ampoule(s) (150 mg in 3 mL)", "to 25 mL in glucose 5%"),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg\n(${currentData[3]} mL of diluted solution)"),
      finalDisplaySecondary(context, "", "", "Over 3 minutes in emergency, \notherwise over 20-120 minutes"),
      finalDisplayFormula(context, "5 mg/kg"));

  return popup;
}

resuscLignocaineDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = resuscLignocaine[weightIndex];

  var popup = finalDisplayFull(
      context,
      "Atropine",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "", "", "undiluted"),
      finalDisplayFormula(context, "1 mg/kg"));

  return popup;
}

resuscAdenosineDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = resuscAdenosine1[weightIndex];
  var currentData2 = resuscAdenosine2[weightIndex];
  var currentData3 = resuscAdenosine3[weightIndex];

  var popup = Column(children: <Widget>[
    Padding(padding: EdgeInsets.only(top: popupPadding(context)),
  child: Column(
  children: <Widget>[
    Text("Adenosine", style: TextStyle(fontSize: size18Text(context), color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      decoration: lightBoxDec(context),
      margin: EdgeInsets.all(5),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("0.1 mg/kg"),
            Text("${currentData[1]} mg", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            Text("${currentData[2]}",textAlign: TextAlign.center),
          ]
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: FaIcon(FontAwesomeIcons.arrowDown),
    ),
    Container(padding: EdgeInsets.all(10.0),
      decoration: lightBoxDec(context),
      margin: EdgeInsets.all(5),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("0.2 mg/kg"),
            Text("${currentData2[1]} mg", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            Text("${currentData2[2]}",textAlign: TextAlign.center),
          ]
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: FaIcon(FontAwesomeIcons.arrowDown),
    ),
    Container(padding: EdgeInsets.all(10.0),
      decoration: lightBoxDec(context),
      margin: EdgeInsets.all(5),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("0.3 mg/kg"),
            Text("${currentData3[1]} mg", style: TextStyle(
                fontSize: size16Text(context), fontWeight: FontWeight.bold)),
            Text("${currentData3[2]}",textAlign: TextAlign.center, ),
          ]
      ),
    ),
    SizedBox(height: 15),
  ]
  ))]);
  return popup;
}
