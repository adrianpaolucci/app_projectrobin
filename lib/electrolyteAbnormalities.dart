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
        if ((i == 5) | (i == 6) | (i == 7) | (i ==10)  ){
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
                }),
          );
        }
        else
        {
          return SizedBox();
        }



      }

      var column = returnCell(context, intIndex, i, iOSswitch(intIndex));

      electrolyteCells.add(column);
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
                      SliverFixedExtentList(
                          itemExtent: data.size.height*2,
                          delegate: SliverChildListDelegate([
                            Material(
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
                                                    Text("Hyperkalaemia - All Drugs",textAlign: TextAlign.center),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: data.size.width * 0.015),
                                                child: CupertinoSwitch(
                                                    activeColor: Color(0xff39e600),
                                                    value: allDrugBooleans[intIndex][0],
                                                    onChanged: (bool newValue) {
                                                      if (newValue == true) {
                                                        boolCount += 5;
                                                        intCount[finalIndex] += 5;
                                                      }
                                                      else {
                                                        boolCount -= 5;
                                                        intCount[finalIndex] -= 5;
                                                      }
                                                      setState(() {
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
                                      Text("Hypoglycaemia - All Drugs",textAlign: TextAlign.center),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: data.size.width *0.02),
                                  child: CupertinoSwitch(
                                      activeColor: Color(0xff39e600),
                                      value: allDrugBooleans[intIndex][8],
                                      onChanged: (bool newValue) {
                                        if (newValue == true) {
                                          boolCount += 2;
                                          intCount[finalIndex] += 2;
                                        }
                                        else {
                                          boolCount -= 2;
                                          intCount[finalIndex] -= 2;
                                        }
                                        setState(() {
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

