import 'package:app_search_bar/asthmaData.dart';
import 'package:app_search_bar/interventionMainScreen.dart';
import 'package:flutter/material.dart';
import 'finalDisplay.dart';
import 'homeScreen.dart';
import 'intubation.dart';
import 'intubationData.dart';
import 'dart:ui';
import 'all_sizings.dart';
import 'allDrugData.dart';

class Asthma extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AsthmaState();
  }
}


class AsthmaState extends State<Asthma> {
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

    var asthmaDrugCells = ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: allDrugs[1].length,
        itemBuilder: (BuildContext context, var i) {
          return InkWell(
              child:
              Container(width: 9*data.size.width/10,height: 40,
                  margin: EdgeInsets.symmetric(vertical: 2.5),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(mediumButtonRadius(context)),color: getColor(i)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(allDrugs[1][i]),
                    ),
                    Checkbox(
                        value: allDrugBooleans[1][i],
                        onChanged: (bool newValue){
                          if (weight < 10.0) {
                            asthmuaDrugErrorAlert(context, i);
                          }
                          else {
                          if (newValue == true) {
                            boolCount += 1;
                          }
                          else {
                            boolCount -= 1;
                          }
                          setState(() {
                            allDrugBooleans[1][i] = newValue;
                            items = badger.setBadge(items, "$boolCount", 1);
                          }
                          );
                        }
                        }
                        ),
                  ],
                  )
              ),
              onTap: () {
                if (weight < 10.0) {
                  asthmuaDrugErrorAlert(context, i);
                }
                else {
                  if (allDrugBooleans[1][i] == false) {
                    boolCount += 1;
                  }
                  else {
                    boolCount -= 1;
                  }
                  setState(() {
                    allDrugBooleans[1][i] = !allDrugBooleans[1][i];
                    items = badger.setBadge(items, "$boolCount", 1);
                    if (boolCount == 0) {
                      for (var i = 0; i < allDrugs[1].length; i++) {
                        items = badger.removeBadge(items, 1);
                      }
                    }
                  }
                  );
                }
              }
              );
        });

    var asthmaCorticoCells = ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: allDrugs[2].length,
        itemBuilder: (BuildContext context, var i) {
          return InkWell(
              child:
              Container(width: 9*data.size.width/10,height: 40,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(mediumButtonRadius(context)),color: getColor(i)),
                  margin: EdgeInsets.symmetric(vertical: 2.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 5),child: Text(asthmaCorticos[i])),
                    Checkbox(
                        value: allDrugBooleans[2][i],
                        onChanged: (bool newValue){
                          if (newValue == true) {
                            boolCount += 1;
                          }
                          else {
                            boolCount -= 1;
                          }
                          setState(() {
                            allDrugBooleans[2][i] = newValue;
                          }
                          );
                        }),
                  ],
                  )
              ),
              onTap: () {
                if (allDrugBooleans[2][i] == false) {
                  boolCount += 1;
                }
                else {
                  boolCount -= 1;
                }
                setState(() {
                  allDrugBooleans[2][i] = !allDrugBooleans[2][i];
                  items = badger.setBadge(items, "$boolCount", 1);
                  if (boolCount == 0) {
                    for (var i = 0; i < allDrugs[2].length; i++) {
                      items = badger.removeBadge(items, 1);
                    }
                  }
                }
                );
              });
        });

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
                    SizedBox(height: 10),
                    Divider(thickness: 1.0),
                    ExpansionTile(initiallyExpanded: true,
                      title: Text("General Drugs"),
                      children: <Widget>[GestureDetector(child: Text("Select Drug from below",
                          style: TextStyle(color: Colors.indigoAccent))),
                        SizedBox(width: 9*data.size.width/10, child: asthmaDrugCells)
                      ],
                    ),
                    Divider(thickness: 1.0),
                    PlusMinus(),
                    Divider(thickness: 1.0),
                    ExpansionTile(initiallyExpanded: true,
                        title: Text("Corticosteroids"),
                        children: <Widget> [
                          GestureDetector(child: Text("Select Drug from below",
                              style: TextStyle(color: Colors.indigoAccent))),
                          SizedBox(width: 9*data.size.width/10, child: asthmaCorticoCells)
                        ]
                    ),
                    Divider(thickness: 1.0),
                    SizedBox(height: data.size.height/3)
                  ],
                  ),
                ]
            )
        )
        )
    );
  }
}

buildNavigationBar() {

  var navBar = BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.cancel),title: Text("Clear All"),backgroundColor: Color(0xfff2f2f2)),
        BottomNavigationBarItem(icon: Icon(Icons.stop, color:  Colors.white),title: Text("0 item(s) selected")),
        BottomNavigationBarItem(icon: Icon(Icons.check),title: Text("Confirm"),backgroundColor: Color(0xfff2f2f2))
      ]
  );
  return navBar;
}

void asthmuaDrugErrorAlert(BuildContext context, i) {
  final data = MediaQuery.of(context);
  var popup = new BackdropFilter(filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child:
      AlertDialog(
        title: Text("Alert"),
        content: Text("Cannot use ${asthmaDrugs[i]} when weight is less than 10.0 kg"),
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