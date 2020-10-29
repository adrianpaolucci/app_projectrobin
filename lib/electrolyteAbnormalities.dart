import 'package:app_search_bar/allDrugData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'homeScreen.dart';
import 'icons/my_flutter_app_icons.dart';
import 'interventionMainScreen.dart';
import 'finalDisplay.dart';
import 'dart:ui';
import 'all_sizings.dart';
import 'package:badges/badges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final intIndex = 13;

bool hyperkalaemiaBool = false;

bool hypoglycaemiaBool = false;



class ElectrolyteAbnormalities extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ElectrolyteAbnormalitiesState();
  }
}

final electrolyteAbnormalitiesIcons = [
  Icon(MyFlutterApp.pipette), Icon(MyFlutterApp.syringe),
  Icon(MyFlutterApp.pipette), Icon(MyFlutterApp.pipette),
  Icon(MyFlutterApp.syringe), Icon(MyFlutterApp.pipette),
  Icon(MyFlutterApp.syringe), Icon(MyFlutterApp.syringe),
  Icon(MyFlutterApp.pipette),Icon(MyFlutterApp.pipette),
  Icon(MyFlutterApp.syringe)];


class ElectrolyteAbnormalitiesState extends State<ElectrolyteAbnormalities> {

  @override
  Widget build(BuildContext context) {

    final data = MediaQuery.of(context);

    clearAll() {
      for (var i = 0; i < allDrugs.length; i++) {
        for (var j = 0; j < allDrugs[i].length; j++) {
          setState(() {
            items = badger.removeBadge(items, 1);
            allDrugBooleans[i][j] = false; intCount = [0,0,0,0,0,0,0,0,0,0,0];
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

    List<Widget> electrolyteCells = [];

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
                    intCount[finalIndex] += 1;
                  }
                  else {
                    boolCount -= 1;
                    intCount[finalIndex] -= 1;
                  }
                  setState(() {
                    items = badger.setBadge(items, "$boolCount", 1);
                    allDrugBooleans[intIndex][i] = newValue;
                  });
                  if (boolCount == 0) {
                    clearAll();
                  }
                  if(allDrugBooleans[intIndex][0] && allDrugBooleans[intIndex][1] && allDrugBooleans[intIndex][2] && allDrugBooleans[intIndex][3] && allDrugBooleans[intIndex][4]) {
                    setState(() {
                      hyperkalaemiaBool = true;
                    });
                  }
                  else {
                    hyperkalaemiaBool = false;
                  }
                  if(allDrugBooleans[intIndex][8] && allDrugBooleans[intIndex][9]) {
                    setState(() {
                      hypoglycaemiaBool = true;
                    });
                  }
                  else {
                    hypoglycaemiaBool = false;
                  }
                }),
          );



      }

      var column = returnCell(context, intIndex, i, iOSswitch(intIndex));

      electrolyteCells.add(column);
    }





    return CupertinoPageScaffold(
        child: SafeArea(
            child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: data.size.height*0.09
                    ),
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
                        largeTitle: Text("Electrolyte Abnormalities"),
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
                      SliverToBoxAdapter(
                           child: Material(
                              color: Color(0xfff2f2f2),
                              child: Theme(
                                data: ThemeData(
                                    backgroundColor: Color(0xfff2f2f2)),
                                child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: data.size.width*0.02
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
                                            data: ThemeData(accentColor: specificColor),
                                            child: ExpansionTile(
                                                backgroundColor: Color(0xffffffff),
                                                initiallyExpanded: true,
                                                title: Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Text("Hyperkalaemia - Select All",textAlign: TextAlign.center),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: data.size.width * 0.015),
                                                child: CupertinoSwitch(
                                                    activeColor: Color(0xff39e600),
                                                    value: hyperkalaemiaBool,
                                                    onChanged: (bool newValue) {

                                                      for (var i =0;i < 5; i++)
                                                      {
                                                        if (allDrugBooleans[intIndex][i] != newValue) {

                                                          if(newValue == true) {
                                                            boolCount += 1;
                                                            intCount[finalIndex] += 1;
                                                          }
                                                          else {
                                                            boolCount -= 1;
                                                            intCount[finalIndex] -= 1;
                                                          }
                                                        }
                                                      }
                                                      setState(() {
                                                        hyperkalaemiaBool = !hyperkalaemiaBool;
                                                        items = badger.setBadge(items, "$boolCount", 1);
                                                        allDrugBooleans[intIndex][0]= newValue;
                                                        allDrugBooleans[intIndex][1]= newValue;
                                                        allDrugBooleans[intIndex][2]= newValue;
                                                        allDrugBooleans[intIndex][3]= newValue;
                                                        allDrugBooleans[intIndex][4]= newValue;
                                                      });
                                                      if (boolCount == 0) {
                                                        clearAll();
                                                      }
                                                    }),
                                              )
                                              ],
                                            ),
                                          children: [electrolyteCells[0],electrolyteCells[1],electrolyteCells[2],electrolyteCells[3],electrolyteCells[4]]
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
                                  title: Text("Hyponatraemia",textAlign: TextAlign.center),
                                  children: [electrolyteCells[5]]
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
                                  title: Text("Sympotmatic hypocalcaemia",textAlign: TextAlign.center),
                                  children: [electrolyteCells[6]]
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
                                  title: Text("Hypomagnasaemia",textAlign: TextAlign.center),
                                  children: [electrolyteCells[7]]
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
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text("Hypoglycaemia - Select All",textAlign: TextAlign.center),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: data.size.width *0.02),
                                  child: CupertinoSwitch(
                                      activeColor: Color(0xff39e600),
                                      value: hypoglycaemiaBool,
                                      onChanged: (bool newValue) {
                                        for (var i =8;i < 10; i++)
                                        {
                                          if (allDrugBooleans[intIndex][i] != newValue) {

                                            if(newValue == true) {
                                              boolCount += 1;
                                              intCount[finalIndex] += 1;
                                            }
                                            else {
                                              boolCount -= 1;
                                              intCount[finalIndex] -= 1;
                                            }
                                          }
                                        }
                                        setState(() {
                                          hypoglycaemiaBool = !hypoglycaemiaBool;
                                          items = badger.setBadge(items, "$boolCount", 1);
                                          allDrugBooleans[intIndex][8]= newValue;
                                          allDrugBooleans[intIndex][9]= newValue;
                                        });
                                        if (boolCount == 0) {
                                          clearAll();
                                        }
                                      }),
                                )
                                    ],
                                  ),
                                  children: [electrolyteCells[8],electrolyteCells[9]]
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
                                  title: Text("Hypokalaemia",textAlign: TextAlign.center),
                                  children: [electrolyteCells[10]]
                              ),
                            ),
                            Container(
                              height: data.size.height*0.05,
                              color: Color(0xfff2f2f2),
                            ),
                          ],
                          ),
                      ),
                    ]
                ),
            ),
        ),
    ),
    ]
    )
    )
    ),
    ),
        Material(
          color: Color(0xfff2f2f2),
          child: Container(
            alignment: Alignment.center,
            color: Color(0xfff2f2f2),
            height: data.size.height*0.09,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: data.size.height*0.01
                      ),
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.home,
                            size: genericIconSize(context)*1.5,
                            color: Colors.grey,
                          ),
                          Text("Weights",
                              style: TextStyle(
                                  fontSize: size14Text(context),
                                  color: Colors.grey
                              ))
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    }
                ),
                GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: data.size.height*0.01
                      ),
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.book,
                            size: genericIconSize(context)*1.5,
                            color: navBarIndex != 3 ? Colors.blue : Colors.grey,
                          ),
                          Text("Interventions",
                              style: TextStyle(
                                  fontSize: size14Text(context),
                                  color: navBarIndex != 3 ? Colors.blue : Colors.grey
                              )
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      if (navBarIndex != 1) {
                        Navigator.pop(context);
                      }
                    }
                ),
                GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: data.size.height*0.01
                      ),
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.check_mark_circled,
                            size: genericIconSize(context)*1.5,
                            color: navBarIndex == 3 ? Colors.blue : Colors.grey,
                          ),
                          Text("Selected",
                              style: TextStyle(
                                fontSize: size14Text(context),
                                color: navBarIndex == 3 ? Colors.blue : Colors.grey,
                              )
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      print(navBarIndex);
                      if (navBarIndex != 3) {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) {
                                  return FinalDisplay();
                                })
                        );
                      }
                    }
                ),
              ],
            ),
          ),
        )
        ]
    )
    )
    );

  }
}

