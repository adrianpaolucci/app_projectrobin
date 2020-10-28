import 'package:app_search_bar/allDrugData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'homeScreen.dart';
import 'icons/my_flutter_app_icons.dart';
import 'seizuresNeurologyData.dart';
import 'interventionMainScreen.dart';
import 'finalDisplay.dart';
import 'dart:ui';
import 'all_sizings.dart';
import 'package:badges/badges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            allDrugBooleans[i][j] = false; intCount = [0,0,0,0,0,0,0,0,0,0,0];
          });
        }
      }
      boolCount = 0;
    }

    var clearAllIcon = BottomNavigationBarItem(
        icon: IconButton(
            icon: Icon(
                Icons.cancel,
                size: genericIconSize(context)),
            onPressed: () {
              clearAll();
            }),
        title: Text("Clear All",
        style: TextStyle(
          fontSize: size14Text(context)
        )
        )
    );
    

    var confirmIcon = BottomNavigationBarItem(
        icon: IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return FinalDisplay();
              })
              );
            }),
        title: Text("Confirm",
            style: TextStyle(
                fontSize: size14Text(context))
    )
    );

    items[0] = clearAllIcon;
    items[2] = confirmIcon;

    myItems(i, IconData icon, String heading, var colour) {
      return GestureDetector(
          child: Badge(
            animationDuration: Duration(milliseconds: 250),
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
            position: BadgePosition.topRight(top: 0, right: 0),
            child: Padding(
                padding: EdgeInsets.all(6),
                child: Material(
                  elevation: 14.0,
                  shadowColor: Color(0x802196F3),
                  borderRadius: BorderRadius.circular(largeButtonRadius(context)),
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(largeButtonRadius(context)),
                        color: allDrugBooleans[8][i] ? Color(0xffc7defa) : Colors.white
                    ),
                    duration: Duration(milliseconds: 250),
                    child: Center(

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
            ),
          ),
          onTap: () {
              if (allDrugBooleans[8][i] == false) {
                boolCount += 1;
                intCount[finalIndex] += 1;
              }
              else {
                boolCount -= 1;
                intCount[finalIndex] -= 1;
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
                        largeTitle: Text("Shock"),
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
                                    ]
                                ),
                              ),
                            ),
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




