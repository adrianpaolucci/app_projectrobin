import 'package:app_search_bar/allDrugData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'homeScreen.dart';
import 'icons/my_flutter_app_icons.dart';
import 'seizuresNeurologyData.dart';
import 'interventionMainScreen.dart';
import 'intubationData.dart';
import 'asthmaData.dart';
import 'finalDisplay.dart';
import 'package:bottom_navigation_badge/bottom_navigation_badge.dart';
import 'dart:ui';
import 'all_sizings.dart';
import 'package:badges/badges.dart';

class Shock extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShockState();
  }
}

final seizureNeurologyIcons = [
  Icon(MyFlutterApp.pipette), Icon(MyFlutterApp.syringe),
  Icon(MyFlutterApp.pipette), Icon(MyFlutterApp.pipette),
  Icon(MyFlutterApp.syringe), Icon(MyFlutterApp.pipette),
  Icon(MyFlutterApp.syringe), Icon(MyFlutterApp.syringe),
  Icon(MyFlutterApp.pipette),Icon(MyFlutterApp.pipette),
  Icon(MyFlutterApp.syringe), Icon(MyFlutterApp.pipette),
  Icon(MyFlutterApp.pipette)];


class ShockState extends State<Shock> {

  @override
  Widget build(BuildContext context) {

    final data = MediaQuery.of(context);

    clearAll() {
      for (var i = 0; i < allDrugs.length; i++) {
        for (var j = 0; j < allDrugs[i].length; j++) {
          setState(() {
            items = badger.removeBadge(items, 1);
            allDrugBooleans[i][j] = false;
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
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FinalDisplay();
              })
              );
            }),
        title: Text("Confirm"));

    items[0] = clearAllIcon;
    items[2] = confirmIcon;

    myItems(i, IconData icon, String heading, var colour) {
      return GestureDetector(
          child: Badge(
            animationDuration: Duration(milliseconds: 500),
            badgeContent: InkWell(
                child: Icon(CupertinoIcons.clear_thick, color: Colors.white),
                onTap: () {
                  if (allDrugBooleans[8][i] == true) {
                    boolCount -= 1;
                    setState(() {
                      allDrugBooleans[8][i] = !allDrugBooleans[8][i];
                      items = badger.setBadge(items, "$boolCount", 1);
                      if (boolCount == 0) {
                        for (var i = 0; i <
                            seizuresNeurologyDrugs.length; i++) {
                          items = badger.removeBadge(items, 1);
                        }
                      }
                    });
                  }
                }),
            elevation: 14.0,
            showBadge: allDrugBooleans[8][i],
            padding: EdgeInsets.all(2),
            position: BadgePosition.topRight(top: 0, right: 0),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                child: Material(
                  elevation: 14.0,
                  shadowColor: Color(0x802196F3),
                  borderRadius: BorderRadius.circular(data.size.height/30.73),
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(largeButtonRadius(context)),
                        color: allDrugBooleans[8][i] ? Color(0xffc7defa) : Colors.white
                    ),
                    duration: Duration(milliseconds: 500),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(heading,
                                          style: TextStyle(color: Colors.black, fontSize: size16Text(context))),
                                    )
                                ),

                                //icon
                                Material(
                                  color: colour,
                                  borderRadius: BorderRadius.circular(mediumButtonRadius(context)),
                                  child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: i % 2 == 0 ? Icon(MyFlutterApp.syringe, size: genericIconSize(context), color: Colors.white) : Icon(MyFlutterApp.pipette, size: 25, color: Colors.white)
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
            ),
          ),
          onTap: () {
              if (allDrugBooleans[8][i] == false) {
                boolCount += 1;
              }
              else {
                boolCount -= 1;
              }
              setState(() {
                allDrugBooleans[8][i] = !allDrugBooleans[8][i];
                items = badger.setBadge(items, "$boolCount", 1);
              });
              if (boolCount == 0) {
                for (var i = 0; i < allDrugBooleans[8].length; i++) {
                  setState(() {
                    items = badger.removeBadge(items,1);
                  });
                }
              }
          }
      );
    }

    addSeizuresNeurologyIcons(BuildContext context) {

      List<Widget> sAndNItems = [
      ];

      for (var i = 0; i < allDrugs[8].length; i++) {
        sAndNItems.add(myItems(i, MyFlutterApp.pipette, "${allDrugs[8][i]}", specificColor));
      }

      return sAndNItems;
    }

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          items: items,
        ),
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "PediDosED",
            style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),
        body:
        CustomScrollView(
            slivers: [
              SliverFixedExtentList(
                itemExtent: 100,
                delegate: SliverChildListDelegate([
                  topInterventionTitle(context, weight, specificColor, int)
                ]),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                sliver: SliverStaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  children: addSeizuresNeurologyIcons(context),
                  staggeredTiles: [
                    StaggeredTile.extent(1, 120.00),
                    StaggeredTile.extent(1, 120.00),
                    StaggeredTile.extent(2, 120.00),
                    StaggeredTile.extent(1, 120.00),
                    StaggeredTile.extent(1, 120.00),
                    StaggeredTile.extent(2, 120.00),
                  ],
                ),
              )
            ]
        )
    );
  }
}


