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
import 'icons/my_flutter_app_icons.dart';
import 'ios_search.dart';
import 'seizuresNeurology.dart';
import 'all_sizings.dart';
import 'shock.dart';
import 'bleeding.dart';
import 'infection.dart';
import 'croup.dart';
import 'analgesia.dart';
import 'drugSearch.dart';
import 'antidotes.dart';
import 'package:flutter/cupertino.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

var boolCount = 0;

var pageIndex = 0;

adrianDivider() {
  var divider = Divider(thickness: 1.0, color: Color(0xffa6a6a6));
  return divider;
}

List searchInterventions = ["Seizures and Neurology","Asthma","Asthma","Intubation","Intubation","Electrolyte Abnormalities","Anaphylaxis and Arrithmyia","Resuscitation","Shock","Bleeding","Infection","Croup","Analgesia","Electrolyte Abnormalities", "Antidotes"];
var suggestionArray = [];
List allDrugSearch = [];
List searchBools = [];
List suggestionList = [];
var varquery = "";

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


    final data = MediaQuery.of(context);

    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          iconSize: 30,
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            title: Text("Interventions",
                style: TextStyle(
                    fontSize: size14Text(context)
                )
            ),
          ),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search),
            title: Text("Search",
            style: TextStyle(
              fontSize: size14Text(context)
            ))
        ),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.check_mark_circled),
              title: Text("Selected",
                  style: TextStyle(
                      fontSize: size14Text(context)
                  ))
          )],
    ),
      // ignore: missing_return
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoPageScaffold(
              child: SafeArea(
                child: Material(
                  child: CupertinoScrollbar(
                    child: CustomScrollView(
                      slivers: <Widget>[
                        CupertinoSliverNavigationBar(
                          padding: EdgeInsetsDirectional.only(
                            start: 0,
                            end: 0,
                            top: 0,
                            bottom: 0
                          ),
                          leading: GestureDetector(
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                        CupertinoIcons.back,
                                        color: Colors.blue),
                                    Text("Back",
                                        style: TextStyle(
                                            fontSize: size18Text(context),
                                            color: Colors.blue
                                        ))
                                  ]
                              ),
                              onTap: () {
                                return Navigator.pop(context);
                              }
                          ),
                          largeTitle: Text("PediDOSed"),
                          trailing: GestureDetector(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        width: data.size.width*0.05,
                                        height: data.size.width*0.05,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.circular(
                                                data.size.width*0.025
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
                              onTap: () {
                                return Navigator.push(
                                    context,
                                    SlideLeftRoute(
                                        page: FinalDisplay()
                                    )
                                );
                              }
                          ),
                        ),
                        SliverFixedExtentList(
                          itemExtent: data.size.height * 0.08,
                          delegate: SliverChildListDelegate([
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: paddingVerticalBetweenButtons(
                                      context)
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          /* showSearch(

                                            context: context,
                                            delegate: DrugSearch()
                                        );*/
                                          return Navigator.push(context,
                                              SlideLeftRoute(
                                                  page: SearchTab()));
                                        },
                                        child:
                                        Container(
                                          height: data.size.height * 0.06,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(
                                                  mediumButtonRadius(context)),
                                              color: Color(0xffe6e6e6)),
                                          child:
                                          Row(
                                            children: [
                                              Material(
                                                  color: Color(0xffe6e6e6),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: smallButtonPadding(
                                                            context)),
                                                    child: Icon(
                                                        Icons.search,
                                                        color: Color(
                                                            0xff808080)),
                                                  )
                                              ),
                                              Material(
                                                borderRadius: BorderRadius
                                                    .circular(
                                                    mediumButtonRadius(
                                                        context)),
                                                color: Color(0xffe6e6e6),
                                                child: Container(
                                                  alignment: Alignment
                                                      .centerLeft,
                                                  height: 4 * data.size.height /
                                                      70,
                                                  width: data.size.width * 0.8,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: smallButtonPadding(
                                                            context)),
                                                    child: Text("Search",
                                                        style: TextStyle(
                                                            fontSize: size16Text(
                                                                context),
                                                            color: Color(
                                                                0xff808080)
                                                        )
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                    )
                                  ]
                              ),
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                  left: data.size.width * 0.05,
                                ),
                                child: Row(children: <Widget>[
                                  FaIcon(
                                      FontAwesomeIcons.balanceScaleLeft,
                                      size: data.size.width / 12),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: data.size.width / 25),
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
                          ]),
                        ),
                        SliverPadding(
                            padding: EdgeInsets.only(
                                bottom: paddingVerticalBetweenButtons(context)),
                            sliver:
                            SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: paddingHorizontalBetweenButtons(
                                            context),
                                        vertical: paddingVerticalBetweenButtons(
                                            context)),
                                    child: Material(
                                      color: Colors.white,
                                      elevation: buttonShadowElev,
                                      shadowColor: shadowColour,
                                      borderRadius: BorderRadius.circular(
                                          lrgBorderRad),
                                      child:
                                      InkWell(
                                          onTap: () {
                                            int = interventions[index];
                                            specificColor = intColors[index];
                                            Navigator.push(context,
                                                SlideLeftRoute(
                                                    page: pages[index])
                                            );
                                          },
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: <Widget>[
                                                Center(
                                                    child: Text(
                                                        interventions[index],
                                                        textAlign: TextAlign
                                                            .center,
                                                        style:
                                                        TextStyle(
                                                            color: intColors[index],
                                                            fontSize: size16Text(
                                                                context))
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
                                childAspectRatio: data.devicePixelRatio * 0.75,
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          case 1:
            return SearchTab();
          case 2:
            return FinalDisplay();
        }
      }
    );
    }
  }



