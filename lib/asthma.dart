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



var intIndex1 = 1;
var intIndex2 = 2;

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
            allDrugBooleans[i][j] = false; intCount = [0,0,0,0,0,0,0,0,0,0,0];
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
              }),
        );
      }

      var column = returnCell(context, intIndex1, i, iOSswitch(intIndex1));

      asthmaDrugCells.add(column);
    }

    List<Widget> asthmaCorticoCells = [];

    for (var i = 0; i < allDrugs[intIndex2].length; i++) {

      Widget iOSswitch(var intIndex2) {
        return Padding(
          padding: EdgeInsets.only(
              right: data.size.width * 0.03),
          child: CupertinoSwitch(
              activeColor: Color(0xff39e600),
              value: allDrugBooleans[intIndex2][i],
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
                  allDrugBooleans[intIndex2][i] = newValue;
                });
                if (boolCount == 0) {
                  clearAll();
                }
              }),
        );
      }

      var column = returnCell(context, intIndex2, i, iOSswitch(intIndex2));

      asthmaCorticoCells.add(column);
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
                        largeTitle: Text("Asthma"),
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
                          itemExtent: data.size.height,
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
                                                children: asthmaCorticoCells
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