import 'package:app_search_bar/asthmaData.dart';
import 'package:app_search_bar/intubationData.dart';
import 'package:app_search_bar/seizuresNeurologyData.dart';

final allDrugs = [
  //0 seizures and neurology
  ["Midazolam (IV)","Midazolam (IN/B)","Diazepam (IV)","Lorazepam (IV)","Fosphenytoin","Phenytoin","Phenobarbitone","Levetiracetam","Valproate","Pyridoxine","Midazolam Infusion","Hypertonic Saline","Mannitol"],
  //1 asthma general drugs
  ["Inhaled Salbutamol","Inhaled Ipratropium","IV Magnesium","IV Aminophyline","Adrenaline"],
  //2 asthma corticos
  ["Methylprednisolone","Dexamethasone","Hydrocortisone","Prednisolone"],
  //3 intubation -- induction agents
  ["Ketamine","Propofol","Thiopentone","Fentanyl (Bolus)","Midazolam", "Fentanyl (Infusion)"],
  //4 induction -- paralytic agents
  ["Suxamethonium","Rocuronium","Vecuronium","Atracurium"]
];

final allDrugBooleans = [
  [false,false,false,false,false,false,false,false,false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false],
  [false,false,false,false,false,false],
  [false,false,false,false]
];