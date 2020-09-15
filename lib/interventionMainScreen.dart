import 'package:app_search_bar/anaphylaxis.dart';
import 'package:app_search_bar/drugSearch.dart';
import 'package:app_search_bar/electrolyteAbnormalities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_search_bar/intubation.dart';
import 'package:app_search_bar/homeScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'asthma.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:bottom_navigation_badge/bottom_navigation_badge.dart';
import 'finalDisplay.dart';
import 'allDrugData.dart';
import 'seizuresNeurology.dart';
import 'all_sizings.dart';
import 'shock.dart';
import 'bleeding.dart';
import 'infection.dart';
import 'croup.dart';
import 'analgesia.dart';
import 'drugSearch.dart';
import 'antidotes.dart';

var boolCount = 0;

adrianDivider() {
  var divider = Divider(thickness: 1.0, color: Color(0xffa6a6a6));
  return divider;
}

var interventions = [
  "Anaphylaxis and Antiarrhymics", "Shock",
  "Bleeding","Intubation",
  "Seizures/Neurology", "Asthma",
  "Infection", "Croup",
  "Analgesia", "Electrolye Abnormalities",
  "Antidotes"
];

var pages = [
  Anaphylaxis(),Shock(),
  Bleeding(),Intubation(),
  SeizuresNeurology(),Asthma(),
  Infection(),Croup(),
  Analgesia(),ElectrolyteAbnormalities(),
  Antidotes(),
];


var intColors = [
  Colors.red,Colors.red,
  Colors.red, Colors.indigo,
  Colors.green, Colors.indigo,
  Colors.orange, Colors.orange,
  Colors.indigo, Colors.purple,
  Colors.orange
];

BottomNavigationBadge badger = BottomNavigationBadge(
    backgroundColor: Colors.red,
    badgeShape: BottomNavigationBadgeShape.circle,
    textColor: Colors.white,
    position: BottomNavigationBadgePosition.topRight,
    textSize: 12.0);

List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(icon: IconButton(
    icon: Icon(
      Icons.cancel,
    ),
    onPressed: () {}),
      title: Text("Clear All")
  ),
  BottomNavigationBarItem(icon: Icon(Icons.format_list_numbered),
      title: Text("Drugs")
  ),
  BottomNavigationBarItem(icon: IconButton(
    icon: Icon(Icons.check), onPressed: () {}),
      title: Text("Confirm")
  )
];

var int = "";
var specificColor;

class InterventionMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DosingMainState();
  }
}


class _DosingMainState extends State<InterventionMain> {

  @override
  Widget build(BuildContext context) {


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

    final data = MediaQuery.of(context);

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
              Navigator.push(context, SlideLeftRoute(page: FinalDisplay())
              );
            }),
        title: Text("Confirm"));

    items[0] = clearAllIcon;
    items[2] = confirmIcon;

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
              Navigator.push(context, SlideRightRoute(page: Home2()));
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
      floatingActionButton: Opacity(
          opacity: 0.7,
              child:
                 FabCircularMenu(
                  ringDiameter: 400,
                  fabColor: Color(0xffcccccc),
                  ringColor: Color(0xffe6e6e6),
                  fabOpenIcon: Icon(Icons.settings,color: Colors.black),
                  animationDuration: Duration(milliseconds: 250),
                  fabOpenColor: Color(0xffccccc),
                  children: [
                    IconButton(
                        icon: Icon(
                            Icons.settings,
                            color: Colors.black87),
                        iconSize: 1.2*genericIconSize(context),
                        onPressed: () {}
                    ),
                    IconButton(
                        icon: Icon(
                            Icons.question_answer,
                            color: Colors.black87),
                        iconSize: 1.2*genericIconSize(context),
                        onPressed: () {}
                        ),
                    IconButton(
                        icon: Icon(
                            Icons.book,
                            color: Colors.black87),
                        iconSize: 1.2*genericIconSize(context),
                        onPressed: () {}
                        )
                  ]
              )
      ),
        body:
        CustomScrollView(
          slivers: <Widget>[
            SliverFixedExtentList(
              itemExtent: 50,
              delegate: SliverChildListDelegate([
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                        left: data.size.width*0.05,
                        top: paddingVerticalBetweenButtons(context)
                    ),
                    child: Row(children: <Widget>[
                      FaIcon(
                          FontAwesomeIcons.balanceScaleLeft,
                          size: data.size.width/12),
                      Padding(
                          padding: EdgeInsets.only(
                              left: data.size.width/25),
                          child: Text(
                            "$weight kg",
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size20Text(context)
                            ),
                          )
                      )
                    ]
                    )
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () {
                            showSearch(
                                context: context,
                                delegate: DrugSearch()
                            );
                          },
                          child:
                          Material(
                            elevation: buttonShadowElev,
                            shadowColor: shadowColour,
                            borderRadius: BorderRadius.circular(mediumButtonRadius(context)*0.5),
                            color: Colors.white,
                            child:
                            Row(
                              children: [
                                Material(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: smallButtonPadding(context)),
                                      child: Icon(Icons.search),
                                    )
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(mediumButtonRadius(context)*0.5),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 4*data.size.height/70,
                                    width: data.size.width*0.6,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: smallButtonPadding(context)),
                                      child: Text("Search Drugs..."),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                      )
                    ]
                ),
                Container(
                    alignment: Alignment.center,
                    child: Text("Select an Intervention Below",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: size14Text(context)
                        )
                    )
                )
              ]),
            ),
            SliverPadding(
                padding: EdgeInsets.only(bottom: paddingVerticalBetweenButtons(context)),
                sliver:
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: paddingHorizontalBetweenButtons(context),
                                vertical: paddingVerticalBetweenButtons(context)),
                            child: Material(
                              color: Colors.white,
                              elevation: buttonShadowElev,
                              shadowColor: shadowColour,
                              borderRadius: BorderRadius.circular(lrgBorderRad),
                              child:
                              InkWell(
                                  onTap: () {
                                    int = interventions[index];
                                    specificColor = intColors[index];
                                    Navigator.push(context, SlideLeftRoute(page: pages[index])
                                    );
                                  },
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                            child:  Text(interventions[index],
                                                textAlign: TextAlign.center,style:
                                                TextStyle(
                                                    color: intColors[index],
                                                    fontSize: size16Text(context))
                                            )
                                        ),
                                      ]
                                  )
                              ),
                            ),
                          );
                        },
                    childCount: interventions.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: data.devicePixelRatio*0.75,
                  ),
                )
            )
          ],
        )
    );
  }
}


