import 'package:flutter/material.dart';
import 'package:app_search_bar/homeScreen.dart';
import 'package:app_search_bar/intubationData.dart';
import 'package:app_search_bar/interventionMainScreen.dart';
import 'asthmaData.dart';
import 'seizuresNeurologyData.dart';
import 'package:flutter/cupertino.dart';

class FinalDisplay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FinalDisplayState();
  }
}

var displayBools = [false,false,false,false,false,false,false,false,false,false];
List<Widget> list = [];

class FinalDisplayState extends State<FinalDisplay> {
  @override
  Widget build(BuildContext context) {

    showFinalDropdowns(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Selections for $weight kg",
          style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white
      ),
      body: SingleChildScrollView(child: Center(child:
      Column(children: list
      ),
      )
      )
    );
  }
}

void showFinalDropdowns(BuildContext context) {
  list = [];
  var allFinalDisplays = [intubationFinal(context),intubationFinal(context),
    intubationFinal(context),intubationFinal(context),
    intubationFinal(context),sAndNFinal(context),
    asthmaFinal(context),intubationFinal(context),
    intubationFinal(context),intubationFinal(context)];

  list.add(
    Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20, top: 20),
      child: Row(children: <Widget>[
        Icon(CupertinoIcons.bookmark, size: 30),
        Text("   $weight kg",
          textDirection: TextDirection.ltr, style: TextStyle(fontSize: 16),
        ),
      ]
      )
  ));
  list.add(SizedBox(height:10));

  for (var i = 0; i < interventions.length; i++) {
    if (displayBools[i] == true) {
     // list.add(Divider(thickness: 1.0, color: Colors.black));
      list.add(ExpansionTile(
        title: Text("${interventions[i]}"),
        children: allFinalDisplays[i],
      ));
      //list.add(Divider(thickness: 1.0, color: Colors.black));
      list.add(Divider());
    }
  }
  list.toList();
}

intubationFinal(BuildContext context) {
  final data = MediaQuery.of(context);
  var inductionWidgets = [ketamineDisplay(context),propofolDisplay(context),thiopentoneDisplay(context),fentanylBolusDisplay(context),midazolamDisplay(context)];
  var paralyticWidgets = [suxamethoniumDisplay(context),rocuroniumDisplay(context),vecuroniumDisplay(context),atracuriumDisplay(context)];
  List<Widget>intubationList = intubationEquipmentInfo(context);
  for (var i=0; i < inductionAgents.length; i++) {
    if (inductionBoolean[i] == true) {
      displayBools[4] = true;
      intubationList.add(inductionWidgets[i]);
      intubationList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
    }
  }
  for (var i = 0; i < paralyticAgents.length; i++) {
    if (paralyticBoolean[i] == true) {
      intubationList.add(paralyticWidgets[i]);
      intubationList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
    }
  }
  if (intubationList.isNotEmpty) {
    intubationList.removeLast();
  }
  return intubationList;
}

asthmaFinal(BuildContext context) {
  final data = MediaQuery.of(context);
  var asthmaDrugWidgets = [inhaledSalbutamolDisplay(context),inhaledIpratropiumDisplay(context),ivMagnesiumDisplay(context),ivAminophyllineDisplay(context),asthmaAdrenalineDisplay(context)];
  var asthmaCortisoWidgets = [methylprednisoloneDisplay(context),dexamethasoneDisplay(context),hydrocortisoneDisplay(context),prednisoloneDisplay(context)];
  List<Widget>asthmaList = [];
  for (var i = 0; i < asthmaDrugs.length; i++) {
    if (asthmaDrugBoolean[i]==true) {
      displayBools[6] = true;
      asthmaList.add(asthmaDrugWidgets[i]);
      asthmaList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
    }
  }
  for (var i = 0; i < asthmaCorticos.length; i++) {
    if (asthmaCorticoBoolean[i] == true){
      asthmaList.add(asthmaCortisoWidgets[i]);
      asthmaList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
    }
  }
  if (asthmaList.isNotEmpty) {
    asthmaList.removeLast();
  }
  return asthmaList;
}

sAndNFinal(BuildContext context) {
  final data = MediaQuery.of(context);
  var sAndNWidgets = [sAndNMidazolamIVDisplay(context),sAndNMidazolamIBDisplay(context),sAndNDiazepamDisplay(context),sAndNLorazepamDisplay(context),sAndNFosphenytoinDisplay(context),sAndNPhenytoinDisplay(context),sAndNPhenobarbitoneDisplay(context),sAndNLevetiracemDisplay(context),sAndNValproateDisplay(context),sAndNPyridoxineDisplay(context),sAndNMidazolamInfusionDisplay(context),sAndNHypertonicSalineDisplay(context),sAndNMannitolDisplay(context)];
  List<Widget>sAndNList = [];
  for (var i = 0; i < seizuresNeurologyDrugs.length; i++) {
    if (seizuresNeurologyBoolean[i] == true) {
      displayBools[5] = true;
      sAndNList.add(sAndNWidgets[i]);
      sAndNList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
    }
  }
  if (sAndNList.isNotEmpty){
    sAndNList.removeLast();
  }
  return sAndNList;
}

finalSelectionDisplay() {

}


