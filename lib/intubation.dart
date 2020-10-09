import 'dart:ui';
import 'package:app_search_bar/finalDisplay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_search_bar/interventionMainScreen.dart';
import 'package:flutter/widgets.dart';
import 'package:app_search_bar/homeScreen.dart';
import 'intubationData.dart';
import 'allDrugData.dart';
import 'all_sizings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final intIndex3 = 3;
final intIndex4 = 4;

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
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return FinalDisplay();
              })
              );
            }),
        title: Text("Confirm"));

    items[0] = clearAllIcon;
    items[2] = confirmIcon;

    //these are the cells that sit in the Expansion boxes for each type of drug


    List<Widget> inductionAgentCells = [];

    for (var i = 0; i < allDrugs[intIndex3].length; i++) {

      Widget iOSswitch(var intIndex3) {
        return Padding(
          padding: EdgeInsets.only(
              right: data.size.width * 0.03),
          child: CupertinoSwitch(
              activeColor: Color(0xff39e600),
              value: allDrugBooleans[intIndex3][i],
              onChanged: (bool newValue) {

                setState(() {
                  if (newValue == true) {
                    boolCount += 1;
                  }
                  else {
                    boolCount -= 1;
                  }
                  items = badger.setBadge(items, "$boolCount", 1);
                  allDrugBooleans[intIndex3][i] = newValue;
                  if (boolCount == 0) {
                    clearAll();
                  }
                });

              }
          ),
        );
      }

      var column = returnCell(context, intIndex3, i, iOSswitch(intIndex3));

      inductionAgentCells.add(column);
    }



    List<Widget> paralyticAgentCells = [];

    for (var i = 0; i < allDrugs[intIndex4].length; i++) {

      Widget iOSswitch(var intIndex4) {
        return Padding(
          padding: EdgeInsets.only(
              right: data.size.width * 0.03),
          child: CupertinoSwitch(
              activeColor: Color(0xff39e600),
              value: allDrugBooleans[intIndex4][i],
              onChanged: (bool newValue) {
                if (newValue == true) {
                  boolCount += 1;
                }
                else {
                  boolCount -= 1;
                }
                setState(() {
                  items = badger.setBadge(items, "$boolCount", 1);
                  allDrugBooleans[intIndex4][i] = newValue;
                });
                if (boolCount == 0) {
                  clearAll();
                }
              }),
        );
      }

      var column = returnCell(context, intIndex4, i, iOSswitch(intIndex4));

      paralyticAgentCells.add(column);
    }


    return SafeArea(
        child: Material(
            color: Color(0xfff2f2f2),
            child: CupertinoScrollbar(
                child: CustomScrollView(
                    slivers: [
                      CupertinoSliverNavigationBar(
                        padding: EdgeInsetsDirectional.only(
                            start: 0,
                            end: 0,
                            top: 0,
                            bottom: 0
                        ),
                        leading: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: data.size.height*0.01
                          ),
                          child: Center(
                            child: GestureDetector(
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Icon(
                                            CupertinoIcons.back,
                                            color: Colors.blue),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text("Back",
                                            style: TextStyle(
                                                fontSize: size18Text(context),
                                                color: Colors.blue
                                            )),
                                      )
                                    ]
                                ),
                                onTap: () {
                                  return Navigator.pop(context);
                                }
                            ),
                          ),
                        ),
                        largeTitle: Text("Intubation"),
                        trailing: (boolCount != 0) ? GestureDetector(
                            child: SizedBox(
                              width: data.size.width*0.25,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        width: data.size.width * 0.06,
                                        height: data.size.width * 0.06,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(
                                                data.size.width * 0.03
                                            )
                                        ),
                                        child: Text(
                                            "$boolCount",
                                            style: TextStyle(
                                                color: Colors.white
                                            )
                                        )
                                    ),
                                    Icon(
                                        CupertinoIcons.forward,
                                        color: Colors.blue),
                                  ]
                              ),
                            ),
                            onTap: () {
                              return Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) {
                                        return FinalDisplay();
                                      }));
                            }
                        ) : SizedBox(),
                      ),
                      SliverFixedExtentList(
                          itemExtent: 2*data.size.height,
                          delegate: SliverChildListDelegate([
                            Material(
                              color: Color(0xfff2f2f2),
                              child: Theme(
                                data: ThemeData(
                                    backgroundColor: Color(0xfff2f2f2)),
                                child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: data.size.height*0.025
                                        ),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                width: data.size.width*0.15,
                                                alignment: Alignment.centerRight,
                                                color: Color(0xfff2f2f2),
                                                child: FaIcon(
                                                    FontAwesomeIcons.balanceScaleLeft,
                                                    size: data.size.width/12),
                                              ),
                                              Container(
                                                width: data.size.width*0.25,
                                                alignment: Alignment.center,
                                                color: Color(0xfff2f2f2),
                                                child: Text(
                                                  "$weight kg",
                                                  textDirection: TextDirection.ltr,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: size20Text(context)
                                                  ),
                                                ),
                                              )
                                            ]
                                        ),
                                      ),
                                      Material(
                                        color: Color(0xfff2f2f2),
                                        child: Column(children: <Widget>[

                                          Theme(
                                            data: ThemeData(
                                                accentColor: specificColor
                                            ),
                                            child: ExpansionTile(
                                              backgroundColor: Color(0xffffffff),
                                              initiallyExpanded: true,
                                              title: Text("Intubation Equipment Info",textAlign: TextAlign.center),
                                              children: intubationEquipmentInfo(context),
                                            ),
                                          ),
                                          Container(
                                            height: data.size.height*0.05,
                                            color: Color(0xfff2f2f2),
                                          ),

                                          Theme(
                                            data: ThemeData(accentColor: specificColor),
                                            child: ExpansionTile(
                                                backgroundColor: Color(0xffffffff),
                                                initiallyExpanded: true,
                                                title: Text("Induction Agents",textAlign: TextAlign.center),
                                                children: inductionAgentCells
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
                                                title: Text("Paralytic Agents",textAlign: TextAlign.center),
                                                children: paralyticAgentCells
                                            ),
                                          ),
                                        ],
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ),
                          ]
                          )
                      ),
                    ]
                )
            )
        )
    );
  }
}


