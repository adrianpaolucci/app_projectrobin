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

final intIndex1 = 1;
final intIndex2 = 2;

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

    List<Widget> asthmaDrugCells = [];

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

      asthmaDrugCells.add(column);
    }



    List<Widget> asthmaCortiCells = [];

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

      asthmaCortiCells.add(column);
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
                        Navigator.push(context, SlideRightRoute(page: Home2()));
                      }
                  )
                ]
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(child: Material(
            color: Color(0xfff2f2f2),
            child: Theme(
                data: ThemeData(
                    backgroundColor: Color(0xfff2f2f2)),
                child: Column(
                    children: <Widget>[
                      topInterventionTitle(context, weight, specificColor, int),
                      Material(
                        color: Color(0xfff2f2f2),
                        child: Column(children: <Widget>[

                          Theme(
                            data: ThemeData(accentColor: specificColor),
                            child: ExpansionTile(
                                backgroundColor: Color(0xffffffff),
                                initiallyExpanded: true,
                                title: Text("General Drugs",textAlign: TextAlign.center),
                                children: asthmaDrugCells
                            ),
                          ),

                          Container(
                            height: data.size.height*0.05,
                            color: Color(0xfff2f2f2),
                          ),

                          Theme(
                            data: ThemeData(accentColor: specificColor),
                            child: ExpansionTile(backgroundColor: Color(0xffffffff),
                                initiallyExpanded: true,
                                title: Text("Corticosteroids",textAlign: TextAlign.center),
                                children: asthmaCortiCells
                            ),
                          ),
                        ],
                        ),
                      ),
                    ])
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