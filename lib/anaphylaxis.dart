import 'package:app_search_bar/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:app_search_bar/interventionMainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'allDrugData.dart';
import 'all_sizings.dart';
import 'finalDisplay.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final intIndex1 = 6;
final intIndex2 = 7;

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

    List<Widget> anaphylaxisCells = [];

    for (var i = 0; i < allDrugs[intIndex1].length; i++) {
      Widget iOSswitch(var intIndex1) {
        return Padding(
          padding: EdgeInsets.only(
              right: data.size.width * 0.03),
          child: Switch(
              activeColor: Color(0xff39e600),
              value: allDrugBooleans[intIndex1][i],
              onChanged: (bool newValue) {
                setState(() {
                  if (newValue == true) {
                    boolCount += 1;
                  }
                  else {
                    boolCount -= 1;
                  }
                  items = badger.setBadge(items, "$boolCount", 1);
                  allDrugBooleans[intIndex1][i] = newValue;
                  if (boolCount == 0) {
                    clearAll();
                  }
                });
              }
          ),
        );
      }


      var column = returnCell(context, intIndex1, i, iOSswitch(intIndex1));

      anaphylaxisCells.add(column);
    }

      List<Widget> resuscCells = [];

      for (var i = 0; i < allDrugs[intIndex2].length; i++) {
        Widget iOSswitch(var intIndex2) {
          return Padding(
            padding: EdgeInsets.only(
                right: data.size.width * 0.03),
            child: Switch(
                activeColor: Color(0xff39e600),
                value: allDrugBooleans[intIndex2][i],
                onChanged: (bool newValue) {
                  if (newValue == true) {
                    boolCount += 1;
                  }
                  else {
                    boolCount -= 1;
                  }
                  setState(() {
                    items = badger.setBadge(items, "$boolCount", 1);
                    allDrugBooleans[intIndex2][i] = newValue;
                  });
                  if (boolCount == 0) {
                    clearAll();
                  }
                }),
          );
        }

        var column = returnCell(context, intIndex2, i, iOSswitch(intIndex2));
        resuscCells.add(column);
      }

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
                            Navigator.push(
                                context, SlideRightRoute(page: Home2()));
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
                        data: ThemeData(accentColor: specificColor),
                        child: Material(
                          color: Color(0xffffffff),
                          child: ExpansionTile(initiallyExpanded: true,
                            title: Text("Anaphylaxis", textAlign: TextAlign.center),
                            children: anaphylaxisCells,
                          ),
                        ),
                      ),
                      SizedBox(height: data.size.height / 11),
                      Theme(
                        data: ThemeData(accentColor: specificColor),
                        child: Material(
                          color: Color(0xffffffff),
                          child: ExpansionTile(
                              initiallyExpanded: true,
                              title:  Text("Resuscitation", textAlign: TextAlign.center),
                              children: resuscCells
                          ),
                        ),
                      ),
                      SizedBox(height: data.size.height / 6,)
                    ],
                    ),
                  ]
              ),
            ),
            )
        );
      }
    }