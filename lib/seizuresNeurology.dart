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



class SeizuresNeurology extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SeizuresNeurologyState();
  }
}




final seizureNeurologyIcons = [Icon(MyFlutterApp.pipette, color: Colors.white), Icon(MyFlutterApp.syringe),
  Icon(MyFlutterApp.pipette), Icon(MyFlutterApp.pipette),
  Icon(MyFlutterApp.syringe), Icon(MyFlutterApp.pipette),
  Icon(MyFlutterApp.syringe), Icon(MyFlutterApp.syringe),
  Icon(MyFlutterApp.pipette),Icon(MyFlutterApp.pipette),
  Icon(MyFlutterApp.syringe), Icon(MyFlutterApp.pipette),
  Icon(MyFlutterApp.pipette)];


class SeizuresNeurologyState extends State<SeizuresNeurology> {

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

    MyItems(i, IconData icon, String heading, var colour) {
      return GestureDetector(
            child: Badge(
              animationDuration: Duration(milliseconds: 500),
                badgeContent: InkWell(
                    child: Icon(CupertinoIcons.clear_thick, color: Colors.white),
                    onTap: () {
                      if (allDrugBooleans[0][i] == true) {
                        boolCount -= 1;
                        setState(() {
                          allDrugBooleans[0][i] = !allDrugBooleans[0][i];
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
                showBadge: allDrugBooleans[0][i],
                padding: EdgeInsets.all(2),
                position: BadgePosition.topRight(top: 0, right: 0),
                  child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  child: Material(
                      elevation: 14.0,
                      shadowColor: Color(0x802196F3),
                    borderRadius: BorderRadius.circular(24.0),
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: allDrugBooleans[0][i] ? Color(0xffc7defa) : Colors.white
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
                                            style: TextStyle(color: Colors.black, fontSize: 16.0)),
                                      )
                                  ),

                                  //icon
                                  Material(
                                    color: colour,
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: i % 2 == 0 ? Icon(MyFlutterApp.syringe, size: 30, color: Colors.white) : Icon(MyFlutterApp.pipette, size: 25, color: Colors.white)
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
              if (seizuresNeurologyDrugs[i] == "Pyridoxine" && weight >= 10) {
                pyridoxineErrorAlert(context);
              }
              else {
                if (allDrugBooleans[0][i] == false) {
                  boolCount += 1;
                }
                else {
                  boolCount -= 1;
                }
                setState(() {
                  allDrugBooleans[0][i] = !allDrugBooleans[0][i];
                  items = badger.setBadge(items, "$boolCount", 1);
                });
                if (boolCount == 0) {
                  for (var i = 0; i < seizuresNeurologyDrugs.length; i++) {
                    setState(() {
                      items = badger.removeBadge(items,1);
                    });
                  }
                }
              }
            }
        );
    }

    AddSeizuresNeurologyIcons(BuildContext context) {

      final data = MediaQuery.of(context);
      List<Widget> sAndNItems = [
      ];

      for (var i = 0; i < seizuresNeurologyDrugs.length; i++) {
        sAndNItems.add(MyItems(i, MyFlutterApp.pipette, "${seizuresNeurologyDrugs[i]}", Colors.green));
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
                children: AddSeizuresNeurologyIcons(context),
                staggeredTiles: [
                  StaggeredTile.extent(1, 120.00),
                  StaggeredTile.extent(1, 120.00),
                  StaggeredTile.extent(2, 120.00),
                  StaggeredTile.extent(1, 120.00),
                  StaggeredTile.extent(1, 120.00),
                  StaggeredTile.extent(1, 120.00),
                  StaggeredTile.extent(1, 120.00),
                  StaggeredTile.extent(2, 120.00),
                  StaggeredTile.extent(1, 120.00),
                  StaggeredTile.extent(1, 120.00),
                  StaggeredTile.extent(2, 120.00),
                  StaggeredTile.extent(1, 120.00),
                  StaggeredTile.extent(1, 120.00),
                  ],
                  ),
)
              ]
            )
                  );

    /* CustomScrollView(
            slivers: [
            SliverFixedExtentList(
            itemExtent: data.size.height*0.15,
              delegate: SliverChildListDelegate([
                Row(children: <Widget>[
                  Container(height: 100, width: 0.7*data.size.width, color: Color(0xfff2f2f2),
                      child: Center(child:
                      Text("$int",style: TextStyle(color: specificColor,fontSize: 24.0),textAlign: TextAlign.center,))
                  ),
                  Container(height: 100, width: data.size.width*0.3, color: Color(0xfff2f2f2),
                      child: Center(child: Text("$weight kg", style: TextStyle(fontSize: 16.0),))
                  )
                ]
                ),
              ]),
            ),
        SliverFixedExtentList(
          itemExtent: data.size.height*2,
          delegate: SliverChildListDelegate([
        StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 24.0,
          mainAxisSpacing: 24.0,
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          children: <Widget>[
            MyItems(MyFlutterApp.pipette, "Test", Colors.green),
            MyItems(MyFlutterApp.pipette, "Test", Colors.green),
            MyItems(MyFlutterApp.syringe, "Test", Colors.green),
            MyItems(MyFlutterApp.pipette, "Test", Colors.green),
            MyItems(MyFlutterApp.syringe, "Test", Colors.green),
            MyItems(MyFlutterApp.pipette, "Test", Colors.green),
            MyItems(MyFlutterApp.pipette, "Test", Colors.green),
          ],
        staggeredTiles: [
          StaggeredTile.extent(2, 130.00),
          StaggeredTile.extent(1, 150.00),
          StaggeredTile.extent(1, 150.00),
          StaggeredTile.extent(1, 130.00),
          StaggeredTile.extent(1, 130.00),
          StaggeredTile.extent(2, 240.00),
          StaggeredTile.extent(2, 120.00),
        ],)
          ]
          )
        )
        */

        
        /* CustomScrollView(
            slivers: <Widget>[
              SliverFixedExtentList(
                itemExtent: 100,
                delegate: SliverChildListDelegate([
                  Row(children: <Widget>[
                    Container(height: 100, width: 0.7*data.size.width, color: Color(0xfff2f2f2),
                        child: Center(child:
                        Text("$int",style: TextStyle(color: specificColor,fontSize: 24.0),textAlign: TextAlign.center,))
                    ),
                    Container(height: 100, width: data.size.width*0.3, color: Color(0xfff2f2f2),
                        child: Center(child: Text("$weight kg", style: TextStyle(fontSize: 16.0),))
                    )
                  ]
                  ),
                ]),
              ),
                  
                   SliverPadding(
                     padding: EdgeInsets.only(top: 20),
                    sliver:
                   SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                              (context, i) {
                                return Column(children: <Widget> [
                                  SizedBox(height: 5),
                                  RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0)
                                      ),
                                      child: Column(children: <Widget> [
                                        seizureNeurologyIcons[i],
                                        Row(children: <Widget>[
                                          Text("${seizuresNeurologyDrugs[i]}", textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 14.0)),
                                          IconButton(icon: Icon(Icons.cancel),
                                              color: seizuresNeurologyBoolean[i] ? Colors.black : Color(0xfff2f2f2),
                                              onPressed: () {
                                                if (seizuresNeurologyBoolean[i] == true) {
                                                  print(boolCount);
                                                  boolCount -= 1;
                                                  setState(() {
                                                    items = badger.setBadge(items, "$boolCount", 1);
                                                    seizuresNeurologyBoolean[i] = !seizuresNeurologyBoolean[i];
                                                  });
                                                  print(boolCount);
                                                }
                                              })
                                        ]
                                        )
                                      ]
                                      ),
                                      color: seizuresNeurologyBoolean[i] ? Color(0xffaccef7) : Color(0xfff2f2f2),
                                      onPressed: () {
                                        print(boolCount);
                                        if (seizuresNeurologyDrugs[i] == "Pyridoxine" && weight >= 10) {
                                          pyridoxineErrorAlert(context);
                                        }
                                        else {
                                          items[0] = clearAllIcon;
                                          items[2] = confirmIcon;
                                          if (seizuresNeurologyBoolean[i] == false) {
                                            boolCount += 1;
                                          }
                                          else {
                                            boolCount -= 1;
                                          }
                                          setState(() {
                                            seizuresNeurologyBoolean[i] = !seizuresNeurologyBoolean[i];
                                            items = badger.setBadge(items, "$boolCount", 1);
                                          });
                                          print(boolCount);
                                        }
                                      }
                                  ),
                                ]
                                );
                              },
                          childCount: seizuresNeurologyDrugs.length,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20.0,
                            crossAxisSpacing: 0,
                            childAspectRatio: 1.5
                        ),
                      ),
                   )
    ]
    )

        ]
              )
    );
*/

  }
}

void pyridoxineErrorAlert(BuildContext context) {
  final data = MediaQuery.of(context);
  var popup = new BackdropFilter(filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child:
      AlertDialog(
        title: Text("Alert"),
        content:
        Text("Cannot use Pyridoxine when weight is 10 kg or more",
            style: TextStyle(fontSize: 16)),
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


