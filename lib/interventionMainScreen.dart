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
import 'seizuresNeurologyData.dart';
import 'intubationData.dart';
import 'asthmaData.dart';

var boolCount = 0;

adrianDivider() {
  var divider = Divider(thickness: 1.0, color: Colors.black);
  return divider;
}

final _scaffoldKey = GlobalKey<ScaffoldState>();

var interventions = [
                      "Anaphylaxis", "Resuscitation",
                      "Management of Shock","Bleeding",
                      "Intubation","Seizures/Neurology",
                      "Asthma","Infection",
                      "Antidotes", "Electrolye Abnormalities",
                      ];



var pages = [Anaphylaxis(),Anaphylaxis(),Anaphylaxis(),Anaphylaxis(),Intubation(),SeizuresNeurology(),Asthma(),Anaphylaxis(),Anaphylaxis(),Anaphylaxis()];
var intColors = [
                 Colors.red,Colors.red,
                 Colors.red,Colors.red,
                 Colors.indigo,Colors.green,
                 Colors.indigoAccent,Colors.orangeAccent,
                 Colors.orange,Colors.purple
                ];

BottomNavigationBadge badger = BottomNavigationBadge(
    backgroundColor: Colors.red,
    badgeShape: BottomNavigationBadgeShape.circle,
    textColor: Colors.white,
    position: BottomNavigationBadgePosition.topRight,
    textSize: 12.0);

List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.cancel), onPressed: () {},), title: Text("Clear All")),
  BottomNavigationBarItem(icon: Icon(Icons.format_list_numbered), title: Text("Drugs")),
  BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.check), onPressed: () {},), title: Text("Confirm"))
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
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "PediDosED",
          style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: Opacity(
        opacity: 0.7,
              child: FabCircularMenu(
              fabColor: Color(0xffcccccc),
              ringColor: Color(0xffe6e6e6),
              fabOpenIcon: Icon(Icons.settings),
              animationDuration: Duration(milliseconds: 500),
              fabOpenColor: Color(0xffccccc),
              children: [
        IconButton(icon: Icon(Icons.settings),iconSize: 35),
        IconButton(icon: Icon(Icons.question_answer),iconSize: 35),
        IconButton(icon: Icon(Icons.book),iconSize: 35)
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
                      width: 50,
                      padding: EdgeInsets.only(left: data.size.width*0.05, top: paddingVerticalBetweenButtons(context)),
                      child: Row(children: <Widget>[
                        FaIcon(FontAwesomeIcons.balanceScaleLeft, size: data.size.width/12),
                        Padding(
                          padding: EdgeInsets.only(top: data.size.height/100),
                        child: Text("   $weight kg",
                      textDirection: TextDirection.ltr, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      )
                        )
                      ]
                      )
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text("Select an Intervention Below",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontStyle: FontStyle.italic, color: Colors.blue, fontWeight: FontWeight.bold))
                  )
                ]),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: paddingVerticalBetweenButtons(context)),
              sliver:
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return InkWell(
                            onTap: () {
                              int = interventions[index];
                              specificColor = intColors[index];
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return pages[index];
                              }
                              )
                              );
                            },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: paddingHorizontalBetweenButtons(context),
                              vertical: paddingVerticalBetweenButtons(context)),
                            child: Material(
                                color: Colors.white,
                                elevation: buttonShadowElev,
                                shadowColor: shadowColour,
                                borderRadius: BorderRadius.circular(lrgBorderRad),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Center(
                                                child:  Text(interventions[index],
                                                    textAlign: TextAlign.center,style:
                                                    TextStyle(
                                                        color: intColors[index],
                                                        fontSize: medButtonText(context))
                                                )
                                            ),
                                          ]
                                        )
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


class PlusMinus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/plusminus.png');
    Image image = Image(image: assetImage);
    return Container(alignment: Alignment.center,
        width: 500,
        height: 60,
        color: Colors.white,
        child: image);
  }
}
