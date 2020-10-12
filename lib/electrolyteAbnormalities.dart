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

    electrolyteAbnormalitiesItems(i, IconData icon, String heading, var colour) {
      return GestureDetector(
          child: Badge(
            badgeColor: Color(0xff666666),
            animationDuration: Duration(milliseconds: 250),
            badgeContent: InkWell(
                child: Icon(CupertinoIcons.clear_thick, color: Colors.white),
                onTap: () {
                  if (allDrugBooleans[13][i] == true) {
                      boolCount -= 1;
                    setState(() {
                      allDrugBooleans[13][i] = !allDrugBooleans[13][i];
                      items = badger.setBadge(items, "$boolCount", 1);
                      if (boolCount == 0) {
                        for (var i = 0; i <
                            allDrugs[13].length; i++) {
                          items = badger.removeBadge(items, 1);
                        }
                      }
                    });
                  }
                }),
            elevation: 14.0,
            showBadge: allDrugBooleans[13][i],
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
                        color: allDrugBooleans[13][i] ? Color(0xffc7defa) : Colors.white
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
                                          style: TextStyle(color: Colors.black, fontSize: size16Text(context))),
                                    )
                                ),

                                //icon
                                Material(
                                  color: colour,
                                  borderRadius: BorderRadius.circular(mediumButtonRadius(context)),
                                  child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: i % 2 == 0 ? Icon(MyFlutterApp.syringe, size: genericIconSize(context), color: Colors.white) : Icon(MyFlutterApp.pipette, size: genericIconSize(context), color: Colors.white)
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
              if (allDrugBooleans[13][i] == false) {
                  boolCount += 1;
                  intCount[finalIndex] += 1;
              }
              else {
                  boolCount -= 1;
                  intCount[finalIndex] -= 1;
              }
              setState(() {
                allDrugBooleans[13][i] = !allDrugBooleans[13][i];
                items = badger.setBadge(items, "$boolCount", 1);
              });
              if (boolCount == 0) {
                for (var i = 0; i < allDrugs[13].length; i++) {
                  setState(() {
                    items = badger.removeBadge(items,1);
                  });
                }
              }
          }
      );
    }

    addEAIconsFirst(BuildContext context) {

      List<Widget> eAItems = [];
      for (var i = 0; i < 5; i++) {
        eAItems.add(electrolyteAbnormalitiesItems(i, MyFlutterApp.pipette, "${allDrugs[13][i]}", Color(0xfff7caac)));
      }
      return eAItems;
    }

    addEAIconsSecond(BuildContext context) {

      List<Widget> eAItems = [];
      for (var i = 5; i < 6; i++) {
        eAItems.add(electrolyteAbnormalitiesItems(i, MyFlutterApp.pipette, "${allDrugs[13][i]}", Color(0xffffe598)));
      }
      return eAItems;
    }

    addEAIconsThird(BuildContext context) {

      List<Widget> eAItems = [];
      for (var i = 6; i < 7; i++) {
        eAItems.add(electrolyteAbnormalitiesItems(i, MyFlutterApp.pipette, "${allDrugs[13][i]}", Color(0xff9cc2e5)));
      }
      return eAItems;
    }

    addEAIconsFourth(BuildContext context) {

      List<Widget> eAItems = [];
      for (var i = 7; i < 8; i++) {
        eAItems.add(electrolyteAbnormalitiesItems(i, MyFlutterApp.pipette, "${allDrugs[13][i]}", Color(0xffa8d08d)));
      }
      return eAItems;
    }

    addEAIconsFifth(BuildContext context) {

      List<Widget> eAItems = [];
      for (var i = 8; i < 10; i++) {
        eAItems.add(electrolyteAbnormalitiesItems(i, MyFlutterApp.pipette, "${allDrugs[13][i]}", Color(0xff9cc2e5)));
      }
      return eAItems;
    }

    addEAIconsSixth(BuildContext context) {

      List<Widget> eAItems = [];
      for (var i = 10; i < 11; i++) {
        eAItems.add(electrolyteAbnormalitiesItems(i, MyFlutterApp.pipette, "${allDrugs[13][i]}", Color(0xffd0cece)));
      }
      return eAItems;
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
                        largeTitle:
                             Text("Electrolyte Abnormalities"),
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
                          itemExtent: data.size.height*0.1,
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
                                    ]
                                ),
                              ),
                            ),
                          ]
                          )
                      ),

                      SliverPadding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          sliver: SliverToBoxAdapter(
                            child: Center(
                              child: Text("Hyperkalaemia",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size18Text(context),
                                      fontStyle: FontStyle.italic
                                  )),
                            ),
                          )
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        sliver: SliverStaggeredGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12.0,
                          children: addEAIconsFirst(context),
                          staggeredTiles: [
                            StaggeredTile.extent(1, largeButtonHeight(context)),
                            StaggeredTile.extent(1, largeButtonHeight(context)),
                            StaggeredTile.extent(2, largeButtonHeight(context)),
                            StaggeredTile.extent(1, largeButtonHeight(context)),
                            StaggeredTile.extent(1, largeButtonHeight(context)),
                          ],
                        ),
                      ),
                      SliverPadding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          sliver: SliverToBoxAdapter(
                            child: Center(
                              child: Text("Hyponatraemia",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size18Text(context),
                                      fontStyle: FontStyle.italic
                                  )),
                            ),
                          )
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        sliver: SliverStaggeredGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12.0,
                          children: addEAIconsSecond(context),
                          staggeredTiles: [
                            StaggeredTile.extent(2, largeButtonHeight(context)),
                          ],
                        ),
                      ),
                      SliverPadding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          sliver: SliverToBoxAdapter(
                            child: Center(
                              child: Text("Hypocalcaemia",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size18Text(context),
                                      fontStyle: FontStyle.italic
                                  )),
                            ),
                          )
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        sliver: SliverStaggeredGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12.0,
                          children: addEAIconsThird(context),
                          staggeredTiles: [
                            StaggeredTile.extent(2, largeButtonHeight(context)),
                          ],
                        ),
                      ),
                      SliverPadding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          sliver: SliverToBoxAdapter(
                            child: Center(
                              child: Text("Hypomagnasaemia",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size18Text(context),
                                      fontStyle: FontStyle.italic
                                  )),
                            ),
                          )
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        sliver: SliverStaggeredGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12.0,
                          children: addEAIconsFourth(context),
                          staggeredTiles: [
                            StaggeredTile.extent(2, largeButtonHeight(context)),
                          ],
                        ),
                      ),
                      SliverPadding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          sliver: SliverToBoxAdapter(
                            child: Center(
                              child: Text("Hypoglycaemia",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size18Text(context),
                                      fontStyle: FontStyle.italic
                                  )),
                            ),
                          )
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        sliver: SliverStaggeredGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12.0,
                          children: addEAIconsFifth(context),
                          staggeredTiles: [
                            StaggeredTile.extent(1, largeButtonHeight(context)),
                            StaggeredTile.extent(1, largeButtonHeight(context)),
                          ],
                        ),
                      ),
                      SliverPadding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          sliver: SliverToBoxAdapter(
                            child: Center(
                              child: Text("Hypokalaemia",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size18Text(context),
                                      fontStyle: FontStyle.italic
                                  )),
                            ),
                          )
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        sliver: SliverStaggeredGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12.0,
                          children: addEAIconsSixth(context),
                          staggeredTiles: [
                            StaggeredTile.extent(6, largeButtonHeight(context)),
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

