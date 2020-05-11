import 'package:flutter/material.dart';
import 'package:app_search_bar/homeScreen.dart';
import 'package:app_search_bar/intubationData.dart';
import 'package:app_search_bar/interventionMainScreen.dart';
import 'asthmaData.dart';
import 'seizuresNeurologyData.dart';
import 'package:flutter/cupertino.dart';
import 'allDrugData.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FinalDisplay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FinalDisplayState();
  }
}

final decoration = BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Color(0xffcccccc));

var displayBools = [false,false,false,false,false,false,false,false,false,false];

List<Widget> list = [];

class FinalDisplayState extends State<FinalDisplay> {
  @override
  Widget build(BuildContext context) {

    final data = MediaQuery.of(context);
    showFinalDropdowns(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          children: [
            SizedBox(width: data.size.width*0.3),
            FaIcon(FontAwesomeIcons.bookMedical, size: 35,),
          ],
        ),
        backgroundColor: Colors.white
      ),
      body: SingleChildScrollView(
          child: Center(child:
            Column(children: list),
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
      padding: EdgeInsets.only(right: 20, top: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.end,children: <Widget>[
        FaIcon(FontAwesomeIcons.balanceScaleLeft, size: 25),
        Text("   $weight kg",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 16,
          fontWeight: FontWeight.bold),
        ),
      ]
      )
  ));
  list.add(SizedBox(height:10));

  for (var i = 0; i < interventions.length; i++) {
    if (displayBools[i] == true) {
     // list.add(Divider(thickness: 1.0, color: Colors.black));
      list.add(ExpansionTile(
        title: Text("${interventions[i]}",
            style: TextStyle(
                color: intColors[i],
                fontSize: 18)),
        children: allFinalDisplays[i],
      ));
      //list.add(Divider(thickness: 1.0, color: Colors.black));
      list.add(Divider());
    }
  }
  list.toList();
}

intubationFinal(BuildContext context) {
  var inductionBoolean = allDrugBooleans[3];
  var paralyticBoolean = allDrugBooleans[4];
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
      displayBools[4] = true;
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
  for (var i = 0; i < allDrugs[1].length; i++) {
    if (allDrugBooleans[1][i] == true) {
      displayBools[6] = true;
      asthmaList.add(asthmaDrugWidgets[i]);
      asthmaList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
    }
  }
  for (var i = 0; i < allDrugs[2].length; i++) {
    if (allDrugBooleans[2][i] == true){
      displayBools[6] = true;
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
  var seizuresNeurologyBoolean = allDrugBooleans[0];
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


