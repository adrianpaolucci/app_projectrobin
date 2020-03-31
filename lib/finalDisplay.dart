import 'package:flutter/material.dart';
import 'package:app_search_bar/homeScreen.dart';
import 'package:app_search_bar/intubationData.dart';
import 'package:app_search_bar/interventionMainScreen.dart';

class FinalDisplay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FinalDisplayState();
  }
}

class FinalDisplayState extends State<FinalDisplay> {
  @override
  Widget build(BuildContext context) {
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
      Column(children: <Widget>[
        adrianDivider(),
        ExpansionTile(title: Text("Anaphylaxis")),
        adrianDivider(),
        SizedBox(height: 10),
        adrianDivider(),
        ExpansionTile(
            title: Text("Intubation"),
            children: intubationFinal(context),
          ),
        adrianDivider(),
          ]
      ),
      )
      )
    );
  }
}

intubationFinal(BuildContext context) {
  final data = MediaQuery.of(context);
  var inductionWidgets = [ketamineDisplay(context),propofolDisplay(context),thiopentoneDisplay(context),fentanylBolusDisplay(context),midazolamDisplay(context)];
  var paralyticWidgets = [suxamethoniumDisplay(context),rocuroniumDisplay(context),vecuroniumDisplay(context),atracuriumDisplay(context)];
  List<Widget>intubationList = intubationEquipmentInfo(context);
  for (var i=0; i < inductionAgents.length; i++) {
    if (inductionBoolean[i] == true) {
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


