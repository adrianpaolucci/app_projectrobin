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
  ["Suxamethonium","Rocuronium","Vecuronium","Atracurium"],

  //5 Electrolyte Abnormalities
  ["Hyperkalaemia - Calcium Chloride","Hyperkalaemia - calcium gluconate","Hyperkalaemia - salbutamol","Hyperkalaemia - insulin & glucose","Hyperkalaemia - sodium bicarbonate","Hyponatraemia with seizures","Symptomatic hypocalcaemia","Hypomagnasaemia","Hypoglycaemia - glucose","Hypoglycaemia - glucagon","Hypokalaemia with arrhythmias"],

  //6 Anaphylaxis and Arrithmyia
  ["IM Adrenaline","IV Fluid Bolus","Initial (ward) Adrenaline Infusion"],

  //7 resuscitation -- on anaphylaxis page
  ["Adrenaline IV (cardiac arrest)","DC Shock","Atropine","Amlodarone","Lignocaine","Adenosine (3 stages)"],

  //8 shock
  ["Fluid Bolus","Adrenaline","Noradrenaline","Dobutamine","Dopamine","Stress-Dose (Hydrocortisone)"],

  //9 bleeding
  ["Tranexamic Acid","Packed Red Blood Cells","Fresh Frozen Plasma","Cryoprecipitate","Platelets"],
];

final allDrugBooleans = [
  [false,false,false,false,false,false,false,false,false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false],
  [false,false,false,false,false,false],
  [false,false,false,false],
  [false,false,false,false,false,false,false,false,false,false,false,false,false],
  [false,false,false],
  [false,false,false,false,false,false],
  [false,false,false,false,false,false],
  [false,false,false,false,false],
];