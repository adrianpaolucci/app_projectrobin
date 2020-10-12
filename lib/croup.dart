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

class Croup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CroupState();
  }
}

final seizureNeurologyIcons = [
  Icon(MyFlutterApp.pipette), Icon(MyFlutterApp.syringe),
  Icon(MyFlutterApp.syringe)];


class CroupState extends State<Croup> {

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
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
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
            animationDuration: Duration(milliseconds: 250),
            badgeContent: InkWell(
                child: Icon(CupertinoIcons.clear_thick, color: Colors.white),
                onTap: () {
                  if (allDrugBooleans[11][i] == true) {
                    boolCount -= 1;
                    setState(() {
                      allDrugBooleans[11][i] = !allDrugBooleans[11][i];
                      items = badger.setBadge(items, "$boolCount", 1);
                      if (boolCount == 0) {
                        clearAll();
                      }
                    });
                  }
                }),
            elevation: 14.0,
            showBadge: allDrugBooleans[11][i],
            padding: EdgeInsets.all(2),
            position: BadgePosition.topRight(top: 0, right: 0),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                child: Material(
                  elevation: 14.0,
                  shadowColor: Color(0x802196F3),
                  borderRadius: BorderRadius.circular(data.size.height / 30.73),
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            largeButtonRadius(context)),
                        color: allDrugBooleans[11][i]
                            ? Color(0xffc7defa)
                            : Colors.white
                    ),
                    duration: Duration(milliseconds: 250),
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
                                          style: TextStyle(color: Colors.black,
                                              fontSize: size14Text(context))),
                                    )
                                ),
                                Material(
                                  color: colour,
                                  borderRadius: BorderRadius.circular(
                                      mediumButtonRadius(context)),
                                  child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: i % 2 == 0 ? Icon(
                                          MyFlutterApp.syringe,
                                          size: genericIconSize(context),
                                          color: Colors.white) : Icon(
                                          MyFlutterApp.pipette,
                                          size: genericIconSize(context),
                                          color: Colors.white)
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
            if (weight < 6) {
              croupErrorAlert(context, i);
            }
            else {
              if (allDrugBooleans[11][i] == false) {
                boolCount += 1;
                intCount[finalIndex] += 1;
              }
              else {
                boolCount -= 1;
                intCount[finalIndex] -= 1;
              }
              setState(() {
                allDrugBooleans[11][i] = !allDrugBooleans[11][i];
                items = badger.setBadge(items, "$boolCount", 1);
                if (boolCount == 0) {
                  clearAll();
                }
              });
            }
          }
      );
    }

    addCroupIcons(BuildContext context) {
      List<Widget> croupItems = [
      ];

      for (var i = 0; i < allDrugs[11].length; i++) {
        croupItems.add(myItems(
            i, MyFlutterApp.pipette, "${allDrugs[11][i]}", specificColor));
      }

      return croupItems;
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
                              vertical: data.size.height * 0.01
                          ),
                          child: Center(
                            child: GestureDetector(
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
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
                        largeTitle: Text("Croup"),
                        trailing: (boolCount != 0) ? GestureDetector(
                            child: SizedBox(
                              width: data.size.width * 0.25,
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
                          itemExtent: data.size.height*0.10,
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
                                            vertical: data.size.height * 0.025
                                        ),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                width: data.size.width * 0.15,
                                                alignment: Alignment.centerRight,
                                                color: Color(0xfff2f2f2),
                                                child: FaIcon(
                                                    FontAwesomeIcons.balanceScaleLeft,
                                                    size: data.size.width / 12),
                                              ),
                                              Container(
                                                width: data.size.width * 0.25,
                                                alignment: Alignment.center,
                                                color: Color(0xfff2f2f2),
                                                child: Text(
                                                  "$weight kg",
                                                  textDirection: TextDirection.ltr,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: size20Text(context)
                                                  ),
                                                ),
                                              )
                                            ]
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ),
                          ]
                          )
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8),
                        sliver: SliverStaggeredGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12.0,
                          children: addCroupIcons(context),
                          staggeredTiles: [
                            StaggeredTile.extent(
                                1, largeButtonHeight(context)),
                            StaggeredTile.extent(
                                1, largeButtonHeight(context)),
                            StaggeredTile.extent(
                                2, largeButtonHeight(context)),
                          ],
                        ),
                      ),
                    ]
                )
            )
        )
    );
  }
}