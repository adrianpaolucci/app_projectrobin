import 'package:app_search_bar/interventionMainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'finalDisplay.dart';
import 'homeScreen.dart';
import 'dart:ui';
import 'all_sizings.dart';
import 'allDrugData.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
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
                    Switch(
                        activeColor: Color(0xff39e600),
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
                              if (boolCount == 0) {
                                clearAll();
                              }
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
                      clearAll();
                    }
                  }
                  );
              }
          );
        });

      var modifiedAnalgesiaCells = returnCells(context, 6);

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
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        title: Text("General Drugs"),
                        children: <Widget>[
                          modifiedAnalgesiaCells
                        ],
                      ),
                    ),
                    Container(
                      height: data.size.height*0.6,
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

