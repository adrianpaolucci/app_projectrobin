import 'dart:ui';
import 'package:app_search_bar/asthmaData.dart';
import 'package:app_search_bar/finalDisplay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_search_bar/interventionMainScreen.dart';
import 'package:flutter/widgets.dart';
import 'package:app_search_bar/homeScreen.dart';
import 'intubationData.dart';
import 'allDrugData.dart';
import 'seizuresNeurology.dart';
import 'seizuresNeurologyData.dart';
import 'all_sizings.dart';




class Intubation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IntubationState();
  }
}

//strings used for printing

String inductionAgentName;
String inductionAmount;
String paralyticAgentName;
String paralyticAmount;


class IntubationState extends State<Intubation> {

  //clears all drugs selected and turns their booleans to false
  //should also clear the checkboxes/switches/highlighted boxes that would occur when a drug is selected


  @override
  Widget build(BuildContext context) {

    final data = MediaQuery.of(context);

    clearAll() {
      for (var i = 0; i < allDrugs.length; i++) {
        for (var j = 0; j < allDrugs[i].length; j++) {
          setState(() {
            allDrugBooleans[i][j] = false;
            items = badger.removeBadge(items, 1);
          });
        }
      }
      boolCount = 0;
    }

    var clearAllIcon = BottomNavigationBarItem(
        icon: IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              clearAll();
            }),
        title: Text("Clear All"));

    var confirmIcon = BottomNavigationBarItem(
        icon: IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FinalDisplay();
              })
              );
            }),
        title: Text("Confirm"));

    items[0] = clearAllIcon;
    items[2] = confirmIcon;

    //these are the cells that sit in the Expansion boxes for each type of drug

    var inductionAgentCells = ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: inductionAgents.length,
        itemBuilder: (BuildContext context, var i) {
          return GestureDetector(
              child: Container(width: 9*data.size.width/10,height: 40,
                  margin: EdgeInsets.symmetric(vertical: 2.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(mediumButtonRadius(context)),
                      color: getColor(i)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(inductionAgents[i]),
                    ),
                    Switch(
                        activeColor: Color(0xff39e600),
                        value: allDrugBooleans[3][i],
                        onChanged: (bool newValue){
                          if (inductionAgents[i] == "Propofol" && weight < 10.0) {
                            propofolErrorAlert(context);
                          }
                          else {
                            if (newValue == true) {
                              boolCount += 1;
                            }
                            else {
                              boolCount -= 1;
                            }
                            setState(() {
                              items = badger.setBadge(items, "$boolCount", 1);
                              allDrugBooleans[3][i] = newValue;
                            });
                            if (boolCount == 0) {
                              clearAll();
                            }
                          }
                        }),
                  ],
                  )
              ),
              onTap: () {
                if (inductionAgents[i] == "Propofol" && weight < 10.0) {
                  propofolErrorAlert(context);
                }
                else {
                  if (allDrugBooleans[3][i] == false) {
                    boolCount += 1;
                  }
                  else {
                    boolCount -= 1;
                  }
                  setState(() {
                    allDrugBooleans[3][i] = !allDrugBooleans[3][i];
                    items = badger.setBadge(items, "$boolCount", 1);
                  }
                  );
                  if (boolCount == 0) {
                    clearAll();
                  }
                }
              });
        });

    var paralyticAgentCells = ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: paralyticAgents.length,
        itemBuilder: (BuildContext context, var i) {
          return GestureDetector(
              child: Container(width: 9*data.size.width/10, height: 40,
              margin: EdgeInsets.symmetric(vertical: 2.5),
              decoration: BoxDecoration(
                  color: getColor(i),
                  borderRadius: BorderRadius.circular(mediumButtonRadius(context))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(paralyticAgents[i]),
                ),
                Switch(
                    activeColor: Color(0xff39e600),
                    value: allDrugBooleans[4][i],
                    onChanged: (bool newValue){
                      paralyticAgentName = paralyticAgents[i];
                      if (newValue == true) {
                        boolCount += 1;
                      }
                      else {
                        boolCount -=1;
                      }
                      setState(() {
                        items = badger.setBadge(items, "$boolCount", 1);
                        allDrugBooleans[3][i] = newValue;
                      }
                      );
                      if (boolCount == 0) {
                        clearAll();
                      }
                    }),
              ]
              )),
              onTap: () {
                if (allDrugBooleans[4][i] == false) {
                  boolCount += 1;
                }
                else {
                  boolCount -= 1;
                }
                setState(() {
                  items = badger.setBadge(items, "$boolCount", 1);
                  allDrugBooleans[4][i] = !allDrugBooleans[4][i];
                });
                if (boolCount == 0) {
                  clearAll();
                }
              }
          );
        }
    );


    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          items: items,
        ),
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "PediDosED",
            style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(child: Material(
          child: Column(
              children: <Widget>[
                topInterventionTitle(context, weight, specificColor, int),
                Column(children: <Widget>[
                  SizedBox(height: 30),
                  Divider(thickness: 1.0),
                  ExpansionTile(
                    title: Text("Intubation Equipment Info"),
                    children: intubationEquipmentInfo(context),
                  ),
                  Divider(thickness: 1.0),
                  SizedBox(height: 10),
                  Divider(thickness: 1.0),
                  ExpansionTile(
                    title: Text("Induction Agents"),
                    children: <Widget>[GestureDetector(child: Text("Select Drug from below",
                        style: TextStyle(color: Colors.indigoAccent))),
                      SizedBox(width: 9*data.size.width/10, child: inductionAgentCells)
                    ],
                  ),
                  Divider(thickness: 1.0),
                  PlusMinus(),
                  Divider(thickness: 1.0),
                  ExpansionTile(
                      title: Text("Paralytic Agents"),
                      children: <Widget> [
                        GestureDetector(child: Text("Select Drug from below",
                            style: TextStyle(color: Colors.indigoAccent))),
                        SizedBox(width: 9*data.size.width/10, child: paralyticAgentCells)
                      ]
                  ),
                  Divider(thickness: 1.0),
                  SizedBox(height: data.size.height/3)
                ],
                ),
              ]
          ),
        ),
        )
    );
  }
}



void propofolErrorAlert(BuildContext context) {
  final data = MediaQuery.of(context);
  var popup = new BackdropFilter(filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child:
      AlertDialog(
        title: Text("Alert"),
        content:
        Text("Cannot use Propofol when weight is less than 10 kg",
            style: TextStyle(fontSize: size16Text(context))),
        actions: <Widget>[
          FlatButton(child: Text("Okay", style: TextStyle(fontSize: 18)),
              onPressed: () {
                Navigator.pop(context);
              }
          )
        ],
      )
  );

  showDialog(context: context, builder: (BuildContext context) => popup);
}