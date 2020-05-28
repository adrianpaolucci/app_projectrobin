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

class Analgesia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnalgesiaState();
  }
}


class AnalgesiaState extends State<Analgesia> {
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

    var analgesiaCells = ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: allDrugs[12].length,
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
                      child: Text(allDrugs[12][i]),
                    ),
                    Checkbox(
                        value: allDrugBooleans[12][i],
                        onChanged: (bool newValue){

                            if (newValue == true) {
                              boolCount += 1;
                            }
                            else {
                              boolCount -= 1;
                            }
                            setState(() {
                              allDrugBooleans[12][i] = newValue;
                              items = badger.setBadge(items, "$boolCount", 1);
                            }
                            );
                          }
                    ),
                  ],
                  )
              ),
              onTap: () {

                  if (allDrugBooleans[12][i] == false) {
                    boolCount += 1;
                  }
                  else {
                    boolCount -= 1;
                  }
                  setState(() {
                    allDrugBooleans[12][i] = !allDrugBooleans[12][i];
                    items = badger.setBadge(items, "$boolCount", 1);
                    if (boolCount == 0) {
                      for (var i = 0; i < allDrugs[1].length; i++) {
                        items = badger.removeBadge(items, 1);
                      }
                    }
                  }
                  );
              }
          );
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
                    ExpansionTile(
                      title: Text("General Drugs"),
                      children: <Widget>[GestureDetector(child: Text("Select Drug from below",
                          style: TextStyle(color: Colors.indigoAccent))),
                        SizedBox(width: 9*data.size.width/10, child: analgesiaCells)
                      ],
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


//not sure why this is here
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

