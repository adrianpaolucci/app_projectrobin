import 'package:app_search_bar/analgesiaData.dart';
import 'package:app_search_bar/croupData.dart';
import 'package:app_search_bar/electrolyteAbnormalitiesData.dart';
import 'package:app_search_bar/infectionData.dart';
import 'package:app_search_bar/shockData.dart';
import 'package:flutter/material.dart';
import 'package:app_search_bar/homeScreen.dart';
import 'package:app_search_bar/intubationData.dart';
import 'package:app_search_bar/interventionMainScreen.dart';
import 'asthmaData.dart';
import 'seizuresNeurologyData.dart';
import 'package:flutter/cupertino.dart';
import 'allDrugData.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'anaphylaxisData.dart';
import 'all_sizings.dart';
import 'bleedingData.dart';
import 'drugSearch.dart';
import 'antidotesData.dart';
import 'ios_search.dart';
import 'anaphylaxis.dart';



class FinalDisplay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FinalDisplayState();
  }
}

/*
Material(
            color: Color(0xfff2f2f2),
            child: Center(child:
              Column(children: list),
      ),
          )

 */


var displayBools = [false,false,false,false,false,false,false,false,false,false,false];

List<Widget> list = [];

class FinalDisplayState extends State<FinalDisplay> {
  @override
  Widget build(BuildContext context) {

    final data = MediaQuery.of(context);

    navBarIndex = 3;

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

    showFinalDropdowns(context);

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
                                                  alignment: Alignment
                                                      .center,
                                                  child: Text("Back",
                                                      style: TextStyle(
                                                          fontSize: size18Text(
                                                              context),
                                                          color: Colors.blue
                                                      )),
                                                )
                                              ]
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              BackRoute(
                                                page: Anaphylaxis()
                                              )
                                            );
                                          }
                                      ),
                                    ),
                                  ),
                                  largeTitle: Text(
                                      "Drugs"),
                                  trailing: Material(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        right: 10
                                      ),
                                      child: IconButton(
                                        icon: Icon(CupertinoIcons.delete_simple,
                                            size: 30),
                                        onPressed: () {
                                            clearAll();
                                        },
                                      ),
                                    ),
                                  )
                              ),
                              SliverToBoxAdapter(
                                  child: Material(
                                      color: Color(0xfff2f2f2),
                                      child: Theme(
                                        data: ThemeData(
                                            backgroundColor: Color(
                                                0xfff2f2f2)),
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
                                                        color: Color(
                                                            0xfff2f2f2),
                                                        child: Text(
                                                          "$weight kg",
                                                          textDirection: TextDirection.ltr,
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: size20Text(
                                                                  context)
                                                          ),
                                                        ),
                                                      )
                                                    ]
                                                ),
                                              ),
                                              Material(
                                                color: Color(0xfff2f2f2),
                                                child: Center(child:
                                                Column(children: list),
                                                ),
                                              )

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
                                    color: navBarIndex == 1 ? Colors.blue : Colors.grey,
                                  ),
                                  Text("Interventions",
                                      style: TextStyle(
                                          fontSize: size14Text(context),
                                          color: navBarIndex == 1 ? Colors.blue : Colors.grey
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

void showFinalDropdowns(BuildContext context) {
  final data = MediaQuery.of(context);

  list = [];
  displayBools = [false,false,false,false,false,false,false,false,false,false,false];
  var allFinalDisplays = [
    anaphylaxisFinal(context),shockFinal(context),
    bleedingFinal(context),intubationFinal(context),
    sAndNFinal(context), asthmaFinal(context),
    infectionFinal(context),croupFinal(context),
    analgesiaFinal(context),electrolyteAbnormalitiesFinal(context),
    antidotesFinal(context)
  ];


  list.add(Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 0.1*data.size.width,
      vertical: 0.01* data.size.height
    ),
    child: Row(
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
              Container(
                height: data.size.height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        mediumButtonRadius(context)),
                    color: Color(0xffe6e6e6)),
                  child: Row(
                    children: [
                      Material(
                          color: Color(0xffe6e6e6),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: smallButtonPadding(context)),
                            child: Icon(
                                Icons.search,
                                color: Color(0xff808080)),
                          )
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(
                            mediumButtonRadius(
                                context)),
                        color: Color(0xffe6e6e6),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: 4*data.size.height/70,
                          width: data.size.width*0.6,
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
                ),
              )
        ]
    ),
  ));

  for (var i = 0; i < interventions.length; i++) {

    if (displayBools[i] == true) {
     // list.add(Divider(thickness: 1.0, color: Colors.black));
      list.add(ExpansionTile(
        initiallyExpanded: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("${interventions[i]}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                    color: intColors[i],
                    fontSize: size18Text(context))),
            Container(
                height: data.size.width*0.06,
                width: data.size.width*0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(data.size.width*0.03),
                  color: intColors[i]),
                child: Center(
                    child: Text("${intCount[i]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)
                    )
                )
            )

          ],
        ),
        children: allFinalDisplays[i],
      ));
      //list.add(Divider(thickness: 1.0, color: Colors.black));
      list.add(Divider());
    }
  }
  list.toList();
}

anaphylaxisFinal(BuildContext context) {
  var anaphylaxisBoolean = allDrugBooleans[6];
  var resuscBoolean = allDrugBooleans[7];
  final data = MediaQuery.of(context);
  var anaphylaxisWidgets = [anaphylaxisAdrenalineIMDisplay(context),anaphylaxisFluidDisplay(context),anaphylaxisInitialAdrenalineDisplay(context)];
  var resuscWidgets = [resuscAdrenalineIVDisplay(context),resuscDCshockDisplay(context),resuscAtropineDisplay(context),resuscAmlodaroneDisplay(context),resuscLignocaineDisplay(context),resuscAdenosineDisplay(context)];
  List<Widget>anaphylaxisList = [];
  for (var i = 0; i < anaphylaxisBoolean.length; i++) {
    if (anaphylaxisBoolean[i] == true) {
      displayBools[0] = true;
      anaphylaxisList.add(anaphylaxisWidgets[i]);
      anaphylaxisList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
    }
  }
  for (var i = 0; i < resuscBoolean.length; i++) {
    if (resuscBoolean[i] == true) {
      displayBools[0] = true;
      anaphylaxisList.add(resuscWidgets[i]);
      anaphylaxisList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
    }
  }
  if (anaphylaxisList.isNotEmpty) {
    anaphylaxisList.removeLast();
  }
  return anaphylaxisList;
}

shockFinal(BuildContext context) {
  var shockBoolean = allDrugBooleans[8];
  final data = MediaQuery.of(context);
  var shockWidgets = [shockFluidDisplay(context),shockAdrenalineDisplay(context),shockNoradrenalineDisplay(context),shockDobutamineDisplay(context),shockDopamineDisplay(context),shockStressDoseDisplay(context)];

  List<Widget>shockList = [];
  for (var i = 0; i < shockBoolean.length; i++) {
      if (shockBoolean[i] == true) {
        displayBools[1] = true;
        shockList.add(shockWidgets[i]);
        shockList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
      }
  }
  if (shockList.isNotEmpty) {
    shockList.removeLast();
  }
  return shockList;
}

bleedingFinal(BuildContext context) {
  var bools = allDrugBooleans[9];
  final data = MediaQuery.of(context);
  var widgets = [tranexamicDisplay(context),redCellsDisplay(context),frozenPlasmaDisplay(context),cryoprecipitateDisplay(context),plateletsDisplay(context)];
  List<Widget> bleedingList = [];

  for (var i = 0; i < bools.length; i++) {
    if (bools[i] == true) {
      displayBools[2] = true;
      bleedingList.add(widgets[i]);
      bleedingList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
    }
  }
  if (bleedingList.isNotEmpty) {
    bleedingList.removeLast();
  }
  return bleedingList;
}

intubationFinal(BuildContext context) {
  var inductionBoolean = allDrugBooleans[3];
  var paralyticBoolean = allDrugBooleans[4];
  final data = MediaQuery.of(context);
  var inductionWidgets = [ketamineDisplay(context),propofolDisplay(context),thiopentoneDisplay(context),fentanylBolusDisplay(context),midazolamDisplay(context),fentanylInfusionDisplay(context)];

  var paralyticWidgets = [suxamethoniumDisplay(context),rocuroniumDisplay(context),vecuroniumDisplay(context),atracuriumDisplay(context)];

  List<Widget>intubationList = intubationEquipmentInfo(context);

  if (allDrugBooleans[15][0]==true){
    displayBools[3] = true ;
  }


  for (var i=0; i < inductionAgents.length; i++) {
    if (inductionBoolean[i] == true) {
      //intubation boolean is true, therefore it is shown on the final screen
      displayBools[3] = true;
      //add final display for specific drug selected
      intubationList.add(inductionWidgets[i]);
      intubationList.add(
          SizedBox(width: data.size.width*0.9,
              child: adrianDivider()
          )
      );
    }
  }
  for (var i = 0; i < paralyticAgents.length; i++) {
    if (paralyticBoolean[i] == true) {
      displayBools[3] = true;
      intubationList.add(paralyticWidgets[i]);
      intubationList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
    }
  }
  if (intubationList.isNotEmpty) {
    intubationList.removeLast();
  }
  return intubationList;
}

asthmaFinal(BuildContext context) {
  final data = MediaQuery.of(context);
  var asthmaDrugWidgets = [inhaledSalbutamolDisplay(context),inhaledIpratropiumDisplay(context),ivMagnesiumDisplay(context),ivAminophyllineDisplay(context),asthmaAdrenalineDisplay(context)];
  var asthmaCortisoWidgets = [methylprednisoloneDisplay(context),dexamethasoneDisplay(context),hydrocortisoneDisplay(context),prednisoloneDisplay(context)];
  List<Widget>asthmaList = [];
  for (var i = 0; i < allDrugs[1].length; i++) {
    if (allDrugBooleans[1][i] == true) {
      displayBools[5] = true;
      asthmaList.add(asthmaDrugWidgets[i]);
      asthmaList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
    }
  }
  for (var i = 0; i < allDrugs[2].length; i++) {
    if (allDrugBooleans[2][i] == true){
      displayBools[5] = true;
      asthmaList.add(asthmaCortisoWidgets[i]);
      asthmaList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
    }
  }
  if (asthmaList.isNotEmpty) {
    asthmaList.removeLast();
  }
  return asthmaList;
}

sAndNFinal(BuildContext context) {
  var seizuresNeurologyBoolean = allDrugBooleans[0];
  final data = MediaQuery.of(context);
  var sAndNWidgets = [sAndNMidazolamIVDisplay(context),sAndNMidazolamIBDisplay(context),sAndNDiazepamDisplay(context),sAndNLorazepamDisplay(context),sAndNFosphenytoinDisplay(context),sAndNPhenytoinDisplay(context),sAndNPhenobarbitoneDisplay(context),sAndNLevetiracemDisplay(context),sAndNValproateDisplay(context),sAndNPyridoxineDisplay(context),sAndNMidazolamInfusionDisplay(context),sAndNHypertonicSalineDisplay(context),sAndNMannitolDisplay(context)];
  List<Widget>sAndNList = [];
  for (var i = 0; i < seizuresNeurologyDrugs.length; i++) {
    if (seizuresNeurologyBoolean[i] == true) {
      displayBools[4] = true;
      sAndNList.add(sAndNWidgets[i]);
      sAndNList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
    }
  }
  if (sAndNList.isNotEmpty){
    sAndNList.removeLast();
  }
  return sAndNList;
}

infectionFinal(BuildContext context) {
  var bools = allDrugBooleans[10];
  final data = MediaQuery.of(context);
  var widgets = [aciclovirDisplay(context),artesunateDisplay(context),oseltamivirDisplay(context),cefotaximeDisplay(context),ceftriaxoneDisplay(context),azithromycinDisplay(context),pipAndTazobDisplay(context)];
  List<Widget> infectionList = [];
  for (var i = 0; i < bools.length; i++) {
    if (bools[i] == true) {
      displayBools[6] = true;
      infectionList.add(widgets[i]);
      infectionList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
    }
  }
  if (infectionList.isNotEmpty) {
    infectionList.removeLast();
  }
  return infectionList;
}

croupFinal(BuildContext context) {
  var bools = allDrugBooleans[11];
  final data = MediaQuery.of(context);
  var widgets = [croupNebAdrenalineDisplay(context),croupDexamethDisplay(context),croupPrednisoloneDisplay(context)];
  List<Widget> croupList = [];
  for (var i = 0; i < bools.length; i++) {
    if (bools[i] == true) {
      displayBools[7] = true;
      croupList.add(widgets[i]);
      croupList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
    }
  }
  if (croupList.isNotEmpty) {
    croupList.removeLast();
  }
  return croupList;
}

analgesiaFinal(BuildContext context) {
  var bools = allDrugBooleans[12];
  final data = MediaQuery.of(context);
  var widgets = [analgesiaParacetDisplay(context),analgesiaMorphineDisplay(context)];
  List<Widget> analgesiaList = [];
  for (var i = 0; i < bools.length; i++) {
    if (bools[i] == true) {
      displayBools[8] = true;
      analgesiaList.add(widgets[i]);
      analgesiaList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
    }
  }
  if (analgesiaList.isNotEmpty) {
    analgesiaList.removeLast();
  }
  return analgesiaList;
}

electrolyteAbnormalitiesFinal(BuildContext context) {
  var bools = allDrugBooleans[13];
  final data = MediaQuery.of(context);
  var widgets =
  [
    hyperkalCalcChlorideDisplay(context),hyperkalCalcGluDisplay(context),
    hyperkalSalbutDisplay(context),hyperkalInsGluDisplay(context),
    hyperkalSodiumBicarbDisplay(context),hyponatraemiaDisplay(context),
    hypocalcDisplay(context),hypomagDisplay(context),
    hypomglyGlucoseDisplay(context),hypomglyGlucagonDisplay(context),
    hypokalArrDisplay(context)
  ];
  List<Widget> electrolyteList = [];
  for (var i = 0; i < bools.length; i++) {
    if (bools[i] == true) {
      displayBools[9] = true;
      electrolyteList.add(widgets[i]);
      electrolyteList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
    }
  }
  if (electrolyteList.isNotEmpty) {
    electrolyteList.removeLast();
  }
  return electrolyteList;
}

antidotesFinal(BuildContext context) {
  var shockBoolean = allDrugBooleans[14];
  final data = MediaQuery.of(context);
  var antidotesWidgets = [antidoteAtropineDisplay(context),antidotePralixodimeDisplay(context),antidotePrazosineDisplay(context),antidoteNAcetylDisplay(context)];

  List<Widget>antidoteList = [];
  for (var i = 0; i < shockBoolean.length; i++) {
    if (shockBoolean[i] == true) {
      displayBools[10] = true;
      antidoteList.add(antidotesWidgets[i]);
      antidoteList.add(SizedBox(width: data.size.width*0.9, child: adrianDivider()));
    }
  }
  if (antidoteList.isNotEmpty) {
    antidoteList.removeLast();
  }
  return antidoteList;
}




