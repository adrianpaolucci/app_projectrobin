import 'package:app_search_bar/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:app_search_bar/interventionMainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'allDrugData.dart';
import 'all_sizings.dart';
import 'finalDisplay.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Anaphylaxis extends StatefulWidget {

  @override
  AnaphylaxisState createState() => AnaphylaxisState();
  }

class AnaphylaxisState extends State<Anaphylaxis> {
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

    var anaphylaxisCells = ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: allDrugs[6].length,
        itemBuilder: (BuildContext context, var i) {
          return GestureDetector(
              child: Container(
                  width: 0.9*data.size.width,
                  height: 40,
                  margin: EdgeInsets.symmetric(vertical: 2.5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(mediumButtonRadius(context)),
                      color: getColor(i)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(allDrugs[6][i]),
                      ),
                      Switch(
                          activeColor: Color(0xff39e600),
                          value: allDrugBooleans[6][i],
                          onChanged: (bool newValue){
                            if (newValue == true) {
                              boolCount += 1;
                            }
                            else {
                              boolCount -= 1;
                            }
                            setState(() {
                              items = badger.setBadge(items, "$boolCount", 1);
                              allDrugBooleans[6][i] = newValue;
                            });
                            if (boolCount == 0) {
                              clearAll();
                            }
                          }),
                    ],
                  )
              ),
              onTap: () {
                  if (allDrugBooleans[6][i] == false) {
                    boolCount += 1;
                  }
                  else {
                    boolCount -= 1;
                  }
                  setState(() {
                    allDrugBooleans[6][i] = !allDrugBooleans[6][i];
                    items = badger.setBadge(items, "$boolCount", 1);
                  }
                  );
                  if (boolCount == 0) {
                    clearAll();
                  }
              });
        });

    var resuscCells = ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: allDrugs[7].length,
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
                      child: Text(allDrugs[7][i]),
                    ),
                    Switch(
                        activeColor: Color(0xff39e600),
                        value: allDrugBooleans[7][i],
                        onChanged: (bool newValue){
                          if (newValue == true) {
                            boolCount += 1;
                          }
                          else {
                            boolCount -= 1;
                          }
                          setState(() {
                            items = badger.setBadge(items, "$boolCount", 1);
                            allDrugBooleans[7][i] = newValue;
                          });
                          if (boolCount == 0) {
                            clearAll();
                          }
                        }),
                  ],
                  )
              ),
              onTap: () {
                if (allDrugBooleans[7][i] == false) {
                  boolCount += 1;
                }
                else {
                  boolCount -= 1;
                }
                setState(() {
                  allDrugBooleans[7][i] = !allDrugBooleans[7][i];
                  items = badger.setBadge(items, "$boolCount", 1);
                }
                );
                if (boolCount == 0) {
                  clearAll();
                }
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
                SizedBox(height: 10),
                Divider(thickness: 1.0),
                Theme(
                  data: ThemeData(accentColor: specificColor),
                  child: ExpansionTile(initiallyExpanded: true,
                    title: Text("Anaphylaxis"),
                    children: <Widget>[GestureDetector(child: Text("Select Drug from below",
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic))),
                      SizedBox(width: 9*data.size.width/10, child: anaphylaxisCells)
                    ],
                  ),
                ),
                Divider(thickness: 1.0),
                PlusMinus(),
                Divider(thickness: 1.0),
                Theme(
                  data: ThemeData(accentColor: specificColor),
                  child: ExpansionTile(
                      initiallyExpanded: true,
                      title: Text("Resuscitation"),
                      children: <Widget> [
                        GestureDetector(child: Text("Select Drug from below",
                            style: TextStyle(
                                color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                        )
                        ),
                        SizedBox(width: 9*data.size.width/10, child: resuscCells)
                      ]
                  ),
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

