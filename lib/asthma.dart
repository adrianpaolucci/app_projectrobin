import 'package:app_search_bar/asthmaData.dart';
import 'package:app_search_bar/interventionMainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'finalDisplay.dart';
import 'homeScreen.dart';
import 'dart:ui';
import 'all_sizings.dart';
import 'allDrugData.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icons/my_flutter_app_icons.dart';

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
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return FinalDisplay();
              })
              );
            }),
        title: Text("Confirm"));

    items[0] = clearAllIcon;
    items[2] = confirmIcon;

    var modifiedGeneralDrugCells = returnCells(context, 1);

    var asthmaDrugCells = ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: allDrugs[1].length,
        itemBuilder: (BuildContext context, var i) {

          return InkWell(
              child:
              Container(
                  margin: EdgeInsets.symmetric(vertical: 2.5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(mediumButtonRadius(context)),
                      color: Color(0xffffffff)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:data.size.width*0.03),
                          child: Material(
                            color: specificColor,
                            borderRadius: BorderRadius.circular(iconRadius(context)),
                            child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                    MyFlutterApp.syringe,
                                    size: genericIconSize(context),
                                    color: Colors.white)
                            ),
                          ),
                        ),
                        Text(allDrugs[1][i],
                              style: TextStyle(
                                    fontSize: size16Text(context)
                              )
                        ),
                      ],
                    ),





                    Padding(
                      padding: EdgeInsets.only(right: data.size.width*0.03),
                      child: CupertinoSwitch(
                          activeColor: Color(0xff39e600),
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
                            });
                            if (boolCount == 0) {
                              clearAll();
                            }
                          }
                          }
                          ),
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
                      clearAll();
                    }
                  }
                  );
                }
              }
              );
        });


    var modifiedAsthmaCorticoCells = returnCells(context, 2);

    var asthmaCorticoCells = ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: allDrugs[2].length,
        itemBuilder: (BuildContext context, var i) {
          return InkWell(
              child:
              Container(width: 9*data.size.width/10,height: 40,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(mediumButtonRadius(context)),
                      color: getColor(i)),
                  margin: EdgeInsets.symmetric(vertical: 2.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 5),child: Text(asthmaCorticos[i])),
                    Switch(
                        activeColor: Color(0xff39e600),
                        value: allDrugBooleans[2][i],
                        onChanged: (bool newValue){
                          if (newValue == true) {
                            boolCount += 1;
                          }
                          else {
                            boolCount -= 1;
                          }
                          setState(() {
                            items = badger.setBadge(items, "$boolCount", 1);
                            allDrugBooleans[2][i] = newValue;
                            if (boolCount == 0) {
                              clearAll();
                            }
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
                    clearAll();
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context, CupertinoPageRoute(builder: (context) {
                return InterventionMain();
              }
              )
              );
            },
          ),
          title: Padding(
            padding: EdgeInsets.only(left: 70),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "PediDosED",
                    style: TextStyle(color: Colors.black),
                  ),
                  IconButton(
                      icon: FaIcon(
                          FontAwesomeIcons.home
                      ),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.push(context, SlideRightRoute(page: Home2()));
                      }
                  )
                ]
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(child: Material(
            child: Column(
                children: <Widget>[
                  topInterventionTitle(context, weight, specificColor, int),
                  Column(children: <Widget>[
                    Theme(
                      data: ThemeData(
                        accentColor: specificColor
                      ),
                      child: ExpansionTile(initiallyExpanded: true,
                        title: Text("General Drugs", textAlign: TextAlign.center),
                        children: <Widget>[
                            modifiedGeneralDrugCells
                        ],
                      ),
                    ),
                    Container(
                      height: data.size.height*0.05,
                      color: Color(0xfff2f2f2),
                    ),
                    Theme(
                      data: ThemeData(
                          accentColor: specificColor
                      ),
                      child: ExpansionTile(initiallyExpanded: true,
                          title: Text("Corticosteroids", textAlign: TextAlign.center),
                        children: <Widget>[
                          modifiedAsthmaCorticoCells
                        ],
                      ),
                    ),
                    Container(
                      height: data.size.height*0.55,
                      color: Color(0xfff2f2f2),
                    ),
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