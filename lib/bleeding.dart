import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'interventionMainScreen.dart';
import 'allDrugData.dart';
import 'all_sizings.dart';
import 'finalDisplay.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var intIndex = 9;

class Bleeding extends StatefulWidget {
//this code just creates a stateful widget (a page which isn't static)
  @override
  BleedingState createState() => BleedingState();
}

class BleedingState extends State<Bleeding> {
  @override
  Widget build(BuildContext context) {


    final data = MediaQuery.of(context);

    //function that changes all drugs' booleans to 'false' and
    //removes the badge on the navigation bar
    var navBarIndex = 1;

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

    //this defines the clear icon that's located on the navigation bar with functionality

    var clearAllIcon = BottomNavigationBarItem(
        icon: IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              clearAll();
            }),
        title: Text("Clear All"));

    //this defines the confirm button on the nav bar with functionality

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

    //items is how the nav bar icons are defined
    //im just assigning the values in the variable to the nav bar icons I've defined above

    items[0] = clearAllIcon;
    items[2] = confirmIcon;



    List<Widget> bleedingCells = [];

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
              }),
        );
      }

      var column = returnCell(context, intIndex, i, iOSswitch(intIndex));

      bleedingCells.add(column);
    }



    return CupertinoPageScaffold(
        child: SafeArea(
            child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: data.size.height*0.09
                    )
                    ,

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
                                              return Navigator.push(context, BackRoute(
                                                page: InterventionMain()
                                              ));
                                            }
                                        ),
                                      ),
                                    ),
                                    largeTitle: Text("Bleeding"),
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
                                          previousPage = Bleeding();
                                          return Navigator.push(
                                              context,
                                              ForwardRoute(
                                                page: FinalDisplay()
                                              ));
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
                                              Material(
                                                color: Color(0xfff2f2f2),
                                                child: Column(children: <Widget>[

                                                  Theme(
                                                    data: ThemeData(accentColor: specificColor),
                                                    child: ExpansionTile(
                                                        backgroundColor: Color(0xffffffff),
                                                        initiallyExpanded: true,
                                                        title: Text("General Drugs",textAlign: TextAlign.center),
                                                        children: bleedingCells
                                                    ),
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
                                Navigator.push(context, BackRoute(
                                  page: Home2()
                                ));
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
                                      color: navBarIndex != 2 ? Colors.blue : Colors.grey,
                                    ),
                                    Text("Interventions",
                                        style: TextStyle(
                                            fontSize: size14Text(context),
                                            color: navBarIndex != 2 ? Colors.blue : Colors.grey
                                        )
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                if (navBarIndex != 1) {
                                  Navigator.push(context, BackRoute(
                                      page: InterventionMain()
                                  ));
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
                                      color: navBarIndex == 2 ? Colors.blue : Colors.grey,
                                    ),
                                    Text("Selected",
                                        style: TextStyle(
                                          fontSize: size14Text(context),
                                          color: navBarIndex == 2 ? Colors.blue : Colors.grey,
                                        )
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                previousPage = Bleeding();
                                if (navBarIndex != 2) {
                                  Navigator.push(
                                      context,
                                      ForwardRoute(
                                        page: FinalDisplay()
                                      )
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
