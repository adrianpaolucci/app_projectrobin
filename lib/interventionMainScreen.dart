import 'package:app_search_bar/anaphylaxis.dart';
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

var boolCount = 0;

adrianDivider() {
  var divider = Divider(thickness: 1.0, color: Colors.black);
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
  Infection(),Anaphylaxis(),
  Anaphylaxis(),Anaphylaxis(),
  Anaphylaxis(),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FinalDisplay();
              })
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(data.size.height/20),
        child: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          title: Text(
            "PediDosED",
            style: TextStyle(
                color: Colors.black)
          ),
          backgroundColor: Colors.white,
        ),
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
                    IconButton(icon: Icon(Icons.settings, color: Colors.black87),iconSize: 1.2*genericIconSize(context)),
                    IconButton(icon: Icon(Icons.question_answer, color: Colors.black87),iconSize: 1.2*genericIconSize(context)),
                    IconButton(icon: Icon(Icons.book, color: Colors.black87),iconSize: 1.2*genericIconSize(context))
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
                Container(
                    alignment: Alignment.bottomCenter,
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
                padding: EdgeInsets.only(top: paddingVerticalBetweenButtons(context)),
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
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return pages[index];
                                        }
                                        )
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


