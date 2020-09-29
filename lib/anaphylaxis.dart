import 'package:app_search_bar/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:app_search_bar/interventionMainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'allDrugData.dart';
import 'all_sizings.dart';
import 'finalDisplay.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icons/my_flutter_app_icons.dart';







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

    var testCells = returnCells(context, 6);



    var anaphylaxisCells = ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: allDrugs[6].length,
        itemBuilder: (BuildContext context, var i) {
          var column = Column(
            children: [
              GestureDetector(
                  child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(mediumButtonRadius(context)),
                          color: Color(0xffffffff)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:data.size.width*0.03),
                                child: Material(
                                  color: specificColor,
                                  borderRadius: BorderRadius.circular(iconRadius(context)),
                                  child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(MyFlutterApp.syringe, size: genericIconSize(context), color: Colors.white)
                                  ),
                                ),
                              ),
                              Text(allDrugs[6][i],style: TextStyle(fontSize: size16Text(context)))
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: data.size.width*0.03),
                            child: CupertinoSwitch(
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
                          ),
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
                  }),
              i != allDrugs[6].length - 1 ? Padding(
                  padding: EdgeInsets.only(left: data.size.width*0.12),
                  child: Divider(
                      thickness: 1.0)
              ) : SizedBox(
                  height: smallButtonPadding(context)),
            ],
          );
          return column;
        });

    var resuscCells = ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: allDrugs[7].length,
        itemBuilder: (BuildContext context, var i) {
          var column = Column(
              children: <Widget>[
                GestureDetector(
                    child: Container(
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
                              Text(allDrugs[7][i],
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
                          ),
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
                    }),
                i != allDrugs[7].length - 1 ? Padding(
                    padding: EdgeInsets.only(left: data.size.width*0.12),
                    child: Divider(thickness: 1.0)
                ) : SizedBox(height: smallButtonPadding(context)),
              ]
          );
          return column;
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
                          title: Text("Anaphylaxis",textAlign: TextAlign.center),
                          children: <Widget>[
                            testCells
                          ],
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
                            title: Text("Resuscitation",textAlign: TextAlign.center),
                            children: <Widget> [
                              resuscCells
                            ]
                        ),
                      ),
                      SizedBox(height: data.size.height/3)
                    ],
                    ),
                  ),
                ]
            ),
          ),
        ),
        )
    );
  }
}

