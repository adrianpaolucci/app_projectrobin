import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'all_sizings.dart';
import 'interventionMainScreen.dart';

var interventionColour = intColors[3];


//induction initialisation
final inductionAgents = ["Ketamine","Propofol","Thiopentone","Fentanyl (Bolus)","Midazolam", "Fentanyl (Infusion)"];



//dosages and dilution info
final ketamineData = [[2, 2, 4, 0.2, 0.4], [2.5, 2.5, 5.0, 0.25, 0.5], [3, 3, 6, 0.3, 0.6], [3.5, 3.5, 7.0, 0.35, 0.7], [4, 4, 8, 0.4, 0.8], [4.5, 4.5, 9.0, 0.45, 0.9], [5, 5, 10, 0.5, 1.0], [5.5, 5.5, 11, 0.55, 1.1],[6, 6, 12, 0.6, 1.2], [7, 7, 14, 0.7, 1.4], [8, 8, 16, 0.8, 1.6], [9, 9, 18, 0.9, 1.8], [10, 10, 20, 1.0, 2.0], [11, 11, 22, 1.1, 2.2], [12, 12, 24, 1.2, 2.4], [13, 13, 26, 1.3, 2.6], [14, 14, 28, 1.4, 2.8], [15, 15, 30, 1.5, 3.0], [16, 16, 32, 1.6, 3.2], [17, 17, 34, 1.7, 3.4], [18, 18, 36, 1.8, 3.6], [19, 19, 38, 1.9, 3.8], [20, 20, 40, 2.0, 4.0], [22, 22, 44, 2.2, 4.4], [24, 24, 48, 2.40000, 4.8], [26, 26, 52, 2.6, 5.2], [28, 28, 56, 2.8, 5.6], [30, 30, 60, 3.0, 6.0], [35, 35, 70, 3.5, 7.0], [40, 40, 80, 4.0, 8.0], [45, 45, 90, 4.5, 9.0], [50, 50, 100, 5.0, 10.0], [55, 55, 110, 5.5, 11.0], [60, 60, 120, 6.0, 12.0], [65, 65, 130, 6.5, 13.0], [70, 70, 140, 7.0, 14.0], [75, 75, 150, 7.5, 15.0], [80, 80, 160, 8.0, 16.0]];
final propofolData = [[2, 'NA', 'NA'], [2.5, 'NA', 'NA'], [3, 'NA', 'NA'], [3.5, 'NA', 'NA'], [4, 'NA', 'NA'], [4.5, 'NA', 'NA'], [5, 'NA', 'NA'], [5.5, 'NA', 'NA'], [6, 'NA', 'NA'], [7, 'NA', 'NA'], [8, 'NA', 'NA'], [9, 'NA', 'NA'], [10, 20, 2.0], [11, 22, 2.2], [12, 24, 2.4], [13, 26, 2.6], [14, 28, 2.8], [15, 30, 3.0], [16, 32, 3.2], [17, 34, 3.4], [18, 36, 3.6], [19, 38, 3.8], [20, 40, 4.0], [22, 44, 4.4], [24, 48, 4.8], [26, 52, 5.2], [28, 56, 5.6], [30, 60, 6.0], [35, 70, 7.0], [40, 80, 8.0], [45, 90, 9.0], [50, 100, 10.0], [55, 110, 11.0], [60, 120, 12.0], [65, 130, 13.0], [70, 140, 14.0], [75, 150, 15.0], [80, 160, 16.0]];
final thiopentoneData = [[2, 4, 8, 0.16, 0.32], [2.5, 5.0, 10.0, 0.2, 0.4], [3, 6, 12, 0.24, 0.48], [3.5, 7.0, 14.0, 0.28, 0.56], [4, 8, 16, 0.32, 0.64], [4.5, 9.0, 18.0, 0.36, 0.72], [5, 10, 20, 0.4, 0.8], [5.5, 11.0, 22.0, 0.44, 0.88], [6, 12, 24, 0.48, 0.96], [7, 14, 28, 0.56, 1.12], [8, 16, 32, 0.64, 1.28], [9, 18, 36, 0.72, 1.44], [10, 20, 40, 0.8, 1.6], [11, 22, 44, 0.88, 1.76], [12, 24, 48, 0.96, 1.92], [13, 26, 52, 1.04, 2.08], [14, 28, 56, 1.12, 2.24], [15, 30, 60, 1.2, 2.4], [16, 32, 64, 1.28, 2.56], [17, 34, 68, 1.36, 2.72], [18, 36, 72, 1.44, 2.88], [19, 38, 76, 1.52, 3.04], [20, 40, 80, 1.6, 3.2], [22, 44, 88, 1.76, 3.52], [24, 48, 96, 1.92, 3.84], [26, 52, 104, 2.08, 4.16], [28, 56, 112, 2.24, 4.48], [30, 60, 120, 2.4, 4.8], [35, 70, 140, 2.8, 5.6], [40, 80, 160, 3.2, 6.4], [45, 90, 180, 3.6, 7.2], [50, 100, 200, 4.0, 8.0], [55, 110, 220, 4.4, 8.8], [60, 120, 240, 4.8, 9.6], [65, 130, 260, 5.2, 10.4], [70, 140, 280, 5.6, 11.2], [75, 150, 300, 6.0, 12.0], [80, 160, 320, 6.4, 12.8]];
final fentanylBolusData = [[2, 4, 8, 0.4, 0.8], [2.5, 5.0, 10.0, 0.5, 1.0], [3, 6, 12, 0.6, 1.2], [3.5, 7.0, 14.0, 0.7, 1.4], [4, 8, 16, 0.8, 1.6], [4.5, 9.0, 18.0, 0.9, 1.8], [5, 10, 20, 1.0, 2.0], [5.5, 11.0, 22.0, 1.1, 2.2], [6, 12, 24, 1.2, 2.4], [7, 14, 28, 1.4, 2.8], [8, 16, 32, 1.6, 3.2], [9, 18, 36, 1.8, 3.6], [10, 20, 40, 2.0, 4.0], [11, 22, 44, 2.2, 4.4], [12, 24, 48, 2.4, 4.8], [13, 26, 52, 2.6, 5.2], [14, 28, 56, 2.8, 5.6], [15, 30, 60, 3.0, 6.0], [16, 32, 64, 3.2, 6.4], [17, 34, 68, 3.4, 6.8], [18, 36, 72, 3.6, 7.2], [19, 38, 76, 3.8, 7.6], [20, 40, 80, 4.0, 8.0], [22, 44, 88, 4.4, 8.8], [24, 48, 96, 4.8, 9.6], [26, 52, 104, 5.2, 10.4], [28, 56, 112, 5.6, 11.2], [30, 60, 120, 6.0, 12.0], [35, 70, 140, 7.0, 14.0], [40, 80, 160, 8.0, 16.0], [45, 90, 180, 9.0, 18.0], [50, 100, 200, 10.0, 20.0], [55, 110, 220, 11.0, 22.0], [60, 120, 240, 12.0, 24.0], [65, 130, 260, 13.0, 26.0], [70, 140, 280, 14.0, 28.0], [75, 150, 300, 15.0, 30.0], [80, 160, 320, 16.0, 32.0]];
final midazolamData = [[2, 0.2, 0.4, 'Dilute 5 mg to 5 mL', 0.2, 0.4], [2.5, 0.25, 0.5, 'Dilute 5 mg to 5 mL', 0.25, 0.5], [3, 0.3, 0.6, 'Dilute 5 mg to 5 mL', 0.3, 0.6], [3.5, 0.35, 0.7, 'Dilute 5 mg to 5 mL', 0.35, 0.7], [4, 0.4, 0.8, 'Dilute 5 mg to 5 mL', 0.4, 0.8], [4.5, 0.45, 0.9, 'Dilute 5 mg to 5 mL', 0.45, 0.9], [5, 0.5, 1.0, 'Dilute 5 mg to 5 mL', 0.5, 1.0], [5.5, 0.55, 1.1, 'Dilute 5 mg to 5 mL', 0.55, 1.1], [6, 0.6, 1.2, 'Dilute 5 mg to 5 mL', 0.6, 1.2], [7, 0.7, 1.4, 'Dilute 5 mg to 5 mL', 0.7, 1.4], [8, 0.8, 1.6, 'Dilute 5 mg to 5 mL', 0.8, 1.6], [9, 0.9, 1.8, 'Dilute 5 mg to 5 mL', 0.9, 1.8], [10, 1.0, 2.0, 'Dilute 5 mg to 5 mL', 1.0, 2.0], [11, 1.1, 2.2, 'Dilute 5 mg to 5 mL', 1.1, 2.2], [12, 1.2, 2.4, 'Dilute 5 mg to 5 mL', 1.2, 2.4], [13, 1.3, 2.6, 'Dilute 5 mg to 5 mL', 1.3, 2.6], [14, 1.4, 2.8, 'Dilute 5 mg to 5 mL', 1.4, 2.8], [15, 1.5, 3.0, 'Dilute 5 mg to 5 mL', 1.5, 3.0], [16, 1.6, 3.2, 'Dilute 5 mg to 5 mL', 1.6, 3.2], [17, 1.7, 3.4, 'Dilute 5 mg to 5 mL', 1.7, 3.4], [18, 1.8, 3.6, 'Dilute 5 mg to 5 mL', 1.8, 3.6], [19, 1.9, 3.8, 'Dilute 5 mg to 5 mL', 1.9, 3.8], [20, 2.0, 4.0, 'Dilute 5 mg to 5 mL', 2.0, 4.0], [22, 2.2, 4.4, 'Dilute 5 mg to 5 mL', 2.2, 4.4], [24, 2.4, 4.8, 'Dilute 5 mg to 5 mL', 2.4, 4.8], [26, 2.6, 5.2, 'Dilute 5 mg to 5 mL', 2.6, 5.2], [28, 2.8, 5.6, 'Dilute 5 mg to 5 mL', 2.8, 5.6], [30, 3.0, 6.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 3.0, 6.0], [35, 3.5, 7.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 3.5, 7.0], [40, 4.0, 8.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 4.0, 8.0], [45, 4.5, 9.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 4.5, 9.0], [50, 5.0, 10.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 5.0, 10.0], [55, 5.5, 11.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 5.5, 11.0], [60, 6.0, 12.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 6.0, 12.0], [65, 6.5, 13.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 6.5, 13.0], [70, 7.0, 14.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 7.0, 14.0], [75, 7.5, 15.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 7.5, 15.0], [80, 8.0, 16.0, 'Dilute 5 mg to 5 mL (10 mg to 10 mL)', 8.0, 16.0]];
final fentanylInfusionData = [[2, 200, 50, 1, 2, 2, 4], [2.5, 250.0, 50, 1, 2, 2, 4], [3, 300, 50, 1, 2, 2, 4], [3.5, 350.0, 50, 1, 2, 2, 4], [4, 400, 50, 1, 2, 2, 4], [4.5, 450.0, 50, 1, 2, 2, 4], [5, 500, 50, 1, 2, 2, 4], [5.5, 550.0, 50, 1, 2, 2, 4], [6, 600, 50, 1, 2, 2, 4], [7, 700, 50, 1, 2, 2, 4], [8, 800, 50, 1, 2, 2, 4], [9, 900, 50, 1, 2, 2, 4], [10, 500, 10, 1.0, 2.0, 5, 10], [11, 500, 10, 1.1, 2.2, 5, 10], [12, 500, 10, 1.2, 2.4, 5, 10], [13, 500, 10, 1.3, 2.6, 5, 10], [14, 500, 10, 1.4, 2.8, 5, 10], [15, 500, 10, 1.5, 3.0, 5, 10], [16, 500, 10, 1.6, 3.2, 5, 10], [17, 500, 10, 1.7, 3.4, 5, 10], [18, 500, 10, 1.8, 3.6, 5, 10], [19, 500, 10, 1.9, 3.8, 5, 10], [20, 500, 10, 2.0, 4.0, 5, 10], [22, 500, 10, 2.2, 4.4, 5, 10], [24, 500, 10, 2.4, 4.8, 5, 10], [26, 500, 10, 2.6, 5.2, 5, 10], [28, 500, 10, 2.8, 5.6, 5, 10], [30, 500, 10, 3.0, 6.0, 5, 10], [35, 500, 10, 3.5, 7.0, 5, 10], [40, 500, 10, 4.0, 8.0, 5, 10], [45, 500, 10, 4.5, 9.0, 5, 10], [50, 500, 10, 5.0, 10.0, 5, 10], [55, 500, 10, 5.5, 11.0, 5, 10], [60, 500, 10, 6.0, 12.0, 5, 10], [65, 500, 10, 6.5, 13.0, 5, 10], [70, 500, 10, 7.0, 14.0, 5, 10], [75, 500, 10, 7.5, 15.0, 5, 10], [80, 500, 10, 8.0, 16.0, 5, 10]];

//paralytic initialisation

final paralyticAgents = ["Suxamethonium","Rocuronium","Vecuronium","Atracurium"];


//dosages and dilution info
final suxamethoniumData = [[2, 2, 4, 0.4], [2.5, 2, 5.0, 0.5], [3, 2, 6, 0.6], [3.5, 2, 7.0, 0.7], [4, 2, 8, 0.8], [4.5, 2, 9.0, 0.9], [5, 2, 10, 1.0], [5.5, 2, 11.0, 1.1], [6, 2, 12, 1.2], [7, 2, 14, 1.4], [8, 2, 16, 1.6], [9, 2, 18, 1.8], [10, 1.5, 15.0, 1.5], [11, 1.5, 16.5, 1.65], [12, 1.5, 18.0, 1.8], [13, 1.5, 19.5, 1.95], [14, 1.5, 21.0, 2.1], [15, 1.5, 22.5, 2.25], [16, 1.5, 24.0, 2.4], [17, 1.5, 25.5, 2.55], [18, 1.5, 27.0, 2.7], [19, 1.5, 28.5, 2.85], [20, 1.5, 30.0, 3.0], [22, 1.5, 33.0, 3.3], [24, 1.5, 36.0, 3.6], [26, 1.5, 39.0, 3.9], [28, 1.5, 42.0, 4.2], [30, 1.5, 45.0, 4.5], [35, 1.5, 52.5, 5.25], [40, 1.5, 60.0, 6.0], [45, 1.5, 67.5, 6.75], [50, 1.5, 75.0, 7.5], [55, 1.5, 82.5, 8.25], [60, 1.5, 90.0, 9.0], [65, 1.5, 97.5, 9.75], [70, 1.5, 105.0, 10.5], [75, 1.5, 112.5, 11.25], [80, 1.5, 120.0, 12.0]];
final rocuroniumData = [[2, 2, 0.2], [2.5, 2.5, 0.25], [3, 3, 0.3], [3.5, 3.5, 0.35], [4, 4, 0.4], [4.5, 4.5, 0.45], [5, 5, 0.5], [5.5, 5.5, 0.55], [6, 6, 0.6], [7, 7, 0.7], [8, 8, 0.8], [9, 9, 0.9], [10, 10, 1.0], [11, 11, 1.1], [12, 12, 1.2], [13, 13, 1.3], [14, 14, 1.4], [15, 15, 1.5], [16, 16, 1.6], [17, 17, 1.7], [18, 18, 1.8], [19, 19, 1.9], [20, 20, 2.0], [22, 22, 2.2], [24, 24, 2.4], [26, 26, 2.6], [28, 28, 2.8], [30, 30, 3.0], [35, 35, 3.5], [40, 40, 4.0], [45, 45, 4.5], [50, 50, 5.0], [55, 55, 5.5], [60, 60, 6.0], [65, 65, 6.5], [70, 70, 7.0], [75, 75, 7.5], [80, 80, 8.0]];
final vecuroniumData = [[2, 0.2, 0.2], [2.5, 0.25, 0.25], [3, 0.3, 0.3], [3.5, 0.35, 0.35], [4, 0.4, 0.4], [4.5, 0.45, 0.45], [5, 0.5, 0.5], [5.5, 0.55, 0.55], [6, 0.6, 0.6], [7, 0.7, 0.7], [8, 0.8, 0.8], [9, 0.9, 0.9], [10, 1.0, 1.0], [11, 1.1, 1.1], [12, 1.2, 1.2], [13, 1.3, 1.3], [14, 1.4, 1.4], [15, 1.5, 1.5], [16, 1.6, 1.6], [17, 1.7, 1.7], [18, 1.8, 1.8], [19, 1.9, 1.9], [20, 2.0, 2.0], [22, 2.2, 2.2], [24, 2.4, 2.4], [26, 2.6, 2.6], [28, 2.8, 2.8], [30, 3.0, 3.0], [35, 3.5, 3.5], [40, 4.0, 4.0], [45, 4.5, 4.5], [50, 5.0, 5.0], [55, 5.5, 5.5], [60, 6.0, 6.0], [65, 6.5, 6.5], [70, 7.0, 7.0], [75, 7.5, 7.5], [80, 8.0, 8.0]];
final atracuriumData = [[2, 1.0, '25 mg to 10 mL', 0.4], [2.5, 1.25, '25 mg to 10 mL', 0.5], [3, 1.5, '25 mg to 10 mL', 0.6], [3.5, 1.75, '25 mg to 10 mL', 0.7], [4, 2.0, '25 mg to 10 mL', 0.8], [4.5, 2.25, '25 mg to 10 mL', 0.9], [5, 2.5, '25 mg to 10 mL', 1.0], [5.5, 2.75, '25 mg to 10 mL', 1.1], [6, 3.0, '25mg to 10mL', 1.2], [7, 3.5, '25mg to 10mL', 1.4], [8, 4.0, '25mg to 10mL', 1.6], [9, 4.5, '25mg to 10mL', 1.8], [10, 5.0, '25mg to 10mL', 2.0], [11, 5.5, '25mg to 10mL', 2.2], [12, 6.0, 'Dilute 25mg to 10mL', 2.4], [13, 6.5, 'Dilute 25mg to 10mL', 2.6], [14, 7.0, '25mg to 10mL', 2.8], [15, 7.5, '25mg to 10mL', 3.0], [16, 8.0, '25mg to 10mL', 3.2], [17, 8.5, 'Dilute 25mg to 10mL', 3.4], [18, 9.0, 'Dilute 25mg to 10mL', 3.6], [19, 9.5, '25mg to 10mL', 3.8], [20, 10.0, '25mg to 10mL', 4.0], [22, 11.0, '25mg to 10mL', 4.4], [24, 12.0, 'Undiluted', 1.2], [26, 13.0, 'Undiluted', 1.3], [28, 14.0, 'Undiluted', 1.4], [30, 15.0, 'Undiluted', 1.5], [35, 17.5, 'Undiluted', 1.75], [40, 20.0, 'Undiluted', 2.0], [45, 22.5, 'Undiluted', 2.25], [50, 25.0, 'Undiluted', 2.5], [55, 27.5, 'Undiluted', 2.75], [60, 30.0, 'Undiluted', 3.0], [65, 32.5, 'Undiluted', 3.25], [70, 35.0, 'Undiluted', 3.5], [75, 37.5, 'Undiluted', 3.75], [80, 40.0, 'Undiluted', 4.0]];

final ettUncuffedSize = [[2, 3], [2.5, 3], [3, 3.5], [3.5, 3.5], [4, 3.5], [4.5, 3.5], [5, 3.5], [5.5, 3.5], [6, 3.5], [7, 3.5], [8, 3.5], [9, 3.5], [10, 4], [11, 4], [12, 4.5], [13, 4.5], [14, 4.5], [15, 5], [16, 5], [17, 5], [18, 5], [19, 5.5], [20, 5.5], [22, 5.5], [24, 6], [26, 6], [28, 6], [30, 6.5], [35, 6.5], [40, 6.5], [45, 6.5], [50, 6.5], [55, 7], [60, 7], [65, 7.5], [70, 8], [75, 8.5], [80, 8.5]];
final ettMicroCuffSize = [[2, 3], [2.5, 3], [3, 3], [3.5, 3], [4, 3], [4.5, 3], [5, 3], [5.5, 3], [6, 3], [7, 3], [8, 3.5], [9, 3.5], [10, 3.5], [11, 3.5], [12, 3.5], [13, 4], [14, 4], [15, 4], [16, 4.5], [17, 4.5], [18, 4.5], [19, 4.5], [20, 4.5], [22, 5], [24, 5], [26, 5.5], [28, 5.5], [30, 5.5], [35, 6], [40, 6], [45, 6.5], [50, 7], [55, 7], [60, 7], [65, 7], [70, 7], [75, 7], [80, 7]];
final ettCuffedSize = [[2, 'N/A'], [2.5, 'N/A'], [3, 'N/A'], [3.5, 'N/A'], [4, 'N/A'], [4.5, 'N/A'], [5, 'N/A'], [5.5, 'N/A'], [6, 'N/A'], [7, 'N/A'], [8, 3], [9, 3], [10, 3.5], [11, 3.5], [12, 4], [13, 4], [14, 4], [15, 4.5], [16, 4.5], [17, 4.5], [18, 4.5], [19, 5], [20, 5], [22, 5], [24, 5.5], [26, 5.5], [28, 5.5], [30, 6], [35, 6], [40, 6], [45, 6], [50, 6], [55, 6.5], [60, 6.5], [65, 7], [70, 7.5], [75, 8], [80, 8]];

final ettDepthOral = [[2, 8], [2.5, 8], [3, '9 - 9.5'], [3.5, '9 - 9 .5'], [4, '9 - 9.5'], [4.5, 10], [5, 10], [5.5, 10], [6, '10.5 - 11'], [7, '10.5 - 11'], [8, '10.5 - 11'], [9, 11], [10, 11], [11, 11], [12, 11], [13, 13], [14, 13], [15, 14], [16, 14], [17, 14], [18, 14], [19, 14], [20, 15], [22, 15], [24, 15], [26, 16], [28, 16], [30, 17], [35, 17], [40, 18], [45, 19], [50, 20], [55, 21], [60, 21], [65, 21], [70, 21], [75, 21], [80, 21]];
final ettDepthNasal = [[2, 10], [2.5, 10], [3, 11], [3.5, 11], [4, 11], [4.5, 12], [5, 12], [5.5, 12], [6, '12.5 - 13'], [7, '12.5 - 13'], [8, '12.5 - 13'], [9, 13], [10, 13], [11, 13], [12, 13], [13, 16], [14, 16], [15, 17], [16, 17], [17, 17], [18, 17], [19, 17], [20, 18], [22, 18], [24, 18], [26, 19], [28, 19], [30, 20], [35, 20], [40, 21], [45, 22], [50, 23], [55, 23], [60, 23], [65, 23], [70, 23], [75, 23], [80, 23]];
final suction = [[2, '4 - 5'], [2.5, '4 - 5'], [3, 6], [3.5, 6], [4, 6], [4.5, 6], [5, 6], [5.5, 6], [6, 8], [7, 8], [8, 8], [9, 8], [10, 10], [11, 10], [12, 10], [13, 10], [14, 10], [15, 10], [16, 10], [17, 10], [18, 10], [19, 10], [20, 10], [22, 10], [24, 10], [26, 10], [28, 10], [30, '10 - 12'], [35, '10 - 12'], [40, '10 -1 2'], [45, '10-12'], [50, '10-12'], [55, 12], [60, 12], [65, 12], [70, 12], [75, 12], [80, 12]];
final layngoscope = [[2, 0], [2.5, 0], [3, 0], [3.5, 0], [4, 0], [4.5, 0], [5, 0], [5.5, 0], [6, 1], [7, 1], [8, 1], [9, 1], [10, 1], [11, '1 - 2'], [12, 2], [13, 2], [14, 2], [15, 2], [16, 2], [17, 2], [18, 2], [19, 2], [20, 2], [22, 2], [24, 2], [26, 2], [28, 2], [30, 3], [35, 3], [40, 3], [45, 3], [50, 3], [55, 3], [60, 3], [65, '3-4'], [70, '3-4'], [75, '3-4'], [80, '3-4']];
final lmaSize = [[2, 1], [2.5, 1], [3, 1], [3.5, 1], [4, 1], [4.5, 1], [5, 1], [5.5, 1], [6, 1.5], [7, 1.5], [8, 1.5], [9, 1.5], [10, '1.5 - 2'], [11, 2], [12, 2], [13, 2], [14, 2], [15, 2], [16, 2], [17, 2], [18, 2], [19, '2 - 2.5'], [20, '2 - 2.5'], [22, 2.5], [24, 2.5], [26, 2.5], [28, 2.5], [30, '2.5 - 3'], [35, 3], [40, 3], [45, 3], [50, '3-4'], [55, 4], [60, 4], [65, 4], [70, 4], [75, '4-5'], [80, 5]];






ketamineDisplay(BuildContext context) {
  var currentData = ketamineData[weightIndex];


  var popup = finalDisplayFull(interventionColour,
    context,
    "Ketamine",
    finalDisplayDilute(context, "Dilute:", "200 mg in 20 mL", "(OR 100 mg in 10 mL)"),
    finalDisplayGive(context, "Give: ", "${currentData[1]} - ${currentData[2]} mg"),
      finalDisplaySecondary(context, "(", "${currentData[3]} - ${currentData[4]} ", " mL of diluted solution)"),
      finalDisplayFormula(context, "1 - 2 mg/kg"));

  return popup;
}

propofolDisplay(BuildContext context) {

  var currentData = propofolData[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Propofol",
      finalDisplayDilute(context, "Dilute:", "Undiluted", "(200 mg in 20 mL)"),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "(", "${currentData[2]}", " mL of undiluted solution)"),
      finalDisplayFormula(context, "2 mg/kg"));

  return popup;
}

thiopentoneDisplay(BuildContext context) {
  var currentData = thiopentoneData[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Thiopentone",
      finalDisplayDilute(context, "Reconstitute: ", "500 mg in 20 mL water", "(for injection)"),
      finalDisplayGive(context, "Give: ", "${currentData[1]} - ${currentData[2]} mg"),
      finalDisplaySecondary(context, "(", "${currentData[3]} - ${currentData[4]} ", " mL of undiluted solution)"),
      finalDisplayFormula(context, "2.5 - 5 mg/kg"));

  return popup;
}

fentanylBolusDisplay(BuildContext context) {
  var currentData = fentanylBolusData[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Fentanyl (Bolus)",
      finalDisplayDilute(context, "Dilute: ", "100 \u03bcg in 10 mL", " "),
      finalDisplayGive(context, "Give: ", "${currentData[1]} - ${currentData[2]} \u03bcg"),
      finalDisplaySecondary(context, "(", "${currentData[3]} - ${currentData[4]} ", " mL of diluted solution)"),
      finalDisplayFormula(context, "2 \u03bcg/kg IV"));

  return popup;
}

midazolamDisplay(BuildContext context) {
  var currentData = midazolamData[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Midazolam",
      finalDisplayDilute(context, "Dilute: ", "500 mg in 20 mL water", ""),
      finalDisplayGive(context, "Give: ", "${currentData[1]} - ${currentData[2]} mg"),
      finalDisplaySecondary(context, "", "", "${currentData[3]}\n${currentData[4]} - ${currentData[5]} mL of undiluted solution"),
      finalDisplayFormula(context, "0.1 - 0.2 mg/kg"));


  return popup;
}

suxamethoniumDisplay(BuildContext context) {
  var currentData = suxamethoniumData[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Suxamethonium",
      finalDisplayDilute(context, "Dilute: ", "100 mg to 10mL", ""),
      finalDisplayGive(context, "Give: ", "${currentData[2]} mg"),
      finalDisplaySecondary(context, "(", "${currentData[3]}", " mL of diluted solution)"),
      finalDisplayFormula(context, "2 mg/kg up to 9kg \n10kg or more: 1.5 mg/kg"));


  return popup;
}

rocuroniumDisplay(BuildContext context) {
  var currentData = rocuroniumData[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Rocuronium",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "(", "${currentData[2]}", " mL of undiluted solution)"),
      finalDisplayFormula(context, "1.2 mg/kg"));

  return popup;
}

vecuroniumDisplay(BuildContext context) {
  var currentData = vecuroniumData[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Vecuronium",
      finalDisplayDilute(context, "Reconstitute:", "10 mg in 10 mL water", "(for injection)"),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "(", "${currentData[2]}", " mL of diluted solution)"),
      finalDisplayFormula(context, "0.1 mg/kg"));


  return popup;
}

atracuriumDisplay(BuildContext context) {
  var currentData = atracuriumData[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Atracurium",
      finalDisplayEmpty(),
      finalDisplayGive(context, "Give: ", "${currentData[1]} mg"),
      finalDisplaySecondary(context, "(", "${currentData[3]}", " mL of undiluted solution)"),
      finalDisplayFormula(context, "0.5 mg/kg"));


  return popup;
}

fentanylInfusionDisplay(BuildContext context) {
  var currentData = fentanylInfusionData[weightIndex];

  var popup = finalDisplayFull(interventionColour,
      context,
      "Fentanyl Infusion",
      finalDisplayDilute(context, "Dilute: ", "${currentData[1]} mg in ${currentData[2]} mL", "(of 0.9% saline)"),
      finalDisplayGive(context, "Start:", "${currentData[3]} - ${currentData[2]} mg/hr"),
      finalDisplaySecondary(context, "", "", "${currentData[5]} - ${currentData[6]} \u03bcg/kg/hr"),
      finalDisplayFormula(context, "100 or 500 \u03bcg/kg"));

  return popup;
}

intubationEquipmentInfo(BuildContext context) {
  final data = MediaQuery.of(context);

  /*firstTextSpan(firstString, secondString) {
    var textBox = Text.rich(
        TextSpan(
            text: "",
            children: <TextSpan>[
              TextSpan(text: firstString,style: TextStyle(fontSize: size16Text(context), decoration: TextDecoration.underline)),
              TextSpan(text: secondString, style: TextStyle(fontSize: size16Text(context)))
            ]
        )
    );
    return textBox;
  }

  etTubeDisplayBox(tubeType,tubeSize) {
    var box = Container(alignment: Alignment.centerLeft, decoration: BoxDecoration(borderRadius: BorderRadius.circular(mediumButtonRadius(context)), color: Color(0xffcccccc)),width: 0.95*data.size.width, height: 25,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget> [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(tubeType, style: TextStyle(fontSize: 15)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Text(tubeSize, style: TextStyle(fontWeight: FontWeight.bold)),
          )
        ]));
    return box;
  }


  var box = [
    Text("General Information", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
    SizedBox(height: 10),
    firstTextSpan("Depth",
        ":  " + ettDepthOral[weightIndex][1].toString() + " cm to lip, " +
            ettDepthNasal[weightIndex][1].toString() + " cm to nose"),
    SizedBox(height: 10),
    firstTextSpan("LMA Size", ":  " + lmaSize[weightIndex][1].toString()),
    SizedBox(height: 10),
    firstTextSpan("Laryngoscope", ":  " + layngoscope[weightIndex][1].toString()),
    SizedBox(height: 10),
    firstTextSpan("Suction", ":  " + suction[weightIndex][1].toString() + " Fr"),
    SizedBox(height: 20),
    Text("ET Tubes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
    etTubeDisplayBox("Uncuffed", ettUncuffedSize[weightIndex][1].toString()),
    SizedBox(height: 15),
    etTubeDisplayBox("Microcuff", ettMicroCuffSize[weightIndex][1].toString()),
    SizedBox(height: 15),
    etTubeDisplayBox("Cuffed", ettCuffedSize[weightIndex][1].toString())
  ];
  box.add(SizedBox(width: data.size.width*0.9, child: Divider(thickness: 0.5, color: Colors.black)));

  return box;

   */

  List<Widget> popup = [
    finalDisplayIntubationEquip(
        interventionColour,
        context,
        "Intubation Equipment",
        finalDisplayDilute(context, "Depth:", ettDepthOral[weightIndex][1].toString() + " cm to lip",  ettDepthNasal[weightIndex][1].toString() + " cm to nose"),
        finalDisplayGive(context, "LMA Size:", lmaSize[weightIndex][1].toString()),
        finalDisplayGive(context, "Laryngoscope:", layngoscope[weightIndex][1].toString()),
        finalDisplayGive(context, "Suction:", suction[weightIndex][1].toString() + " Fr"),
        finalDisplayTubeSize(context, "Uncuffed:", ettUncuffedSize[weightIndex][1].toString()),
        finalDisplayTubeSize(context, "Microcuff:", ettMicroCuffSize[weightIndex][1].toString()),
        finalDisplayTubeSize(context, "Cuffed:", ettCuffedSize[weightIndex][1].toString()),
    )
  ];

  return popup;


}
