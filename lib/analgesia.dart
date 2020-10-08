import 'package:app_search_bar/interventionMainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'finalDisplay.dart';
import 'homeScreen.dart';
import 'dart:ui';
import 'all_sizings.dart';
import 'allDrugData.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var intIndex = 12;

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


    List<Widget> analgesiaCells = [];

    for (var i = 0; i < allDrugs[intIndex].length; i++) {

      Widget iOSswitch(var intIndex) {
        return Padding(
          padding: EdgeInsets.only(
              right: data.size.width * 0.03),
          child: CupertinoSwitch(
              activeColor: Color(0xff39e600),
              value: allDrugBooleans[intIndex][i],
              onChanged: (bool newValue) {


                if (newValue == true) {
                  boolCount += 1;
                }
                else {
                  boolCount -= 1;
                }

                setState(() {
                  items = badger.setBadge(items, "$boolCount", 1);
                  allDrugBooleans[intIndex][i] = newValue;
                });
                if (boolCount == 0) {
                  clearAll();
                }
              }),
        );
      }

      var column = returnCell(context, intIndex, i, iOSswitch(intIndex));

      analgesiaCells.add(column);
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
                        children: analgesiaCells
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

