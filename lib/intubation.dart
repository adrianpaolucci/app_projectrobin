import 'dart:ui';
import 'package:app_search_bar/asthmaData.dart';
import 'package:app_search_bar/finalDisplay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_search_bar/interventionMainScreen.dart';
import 'package:flutter/widgets.dart';
import 'package:app_search_bar/homeScreen.dart';
import 'intubationData.dart';
import 'seizuresNeurology.dart';
import 'seizuresNeurologyData.dart';



Color getColor(i) {
  if (i % 2 == 0) {
    return Color(0xffcccccc);
  } else {
    return Color(0xffe6e6e6);
  }
}

final allDrugs = [asthmaDrugs,asthmaCorticos,inductionAgents,paralyticAgents,seizuresNeurologyDrugs];
final allDrugBooleans = [asthmaDrugBoolean,asthmaCorticoBoolean,inductionBoolean,paralyticBoolean,seizuresNeurologyBoolean];

class Intubation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IntubationState();
  }
}


String inductionAgentName;
String inductionAmount;
String paralyticAgentName;
String paralyticAmount;

final scaffoldKey = GlobalKey<ScaffoldState>();



class IntubationState extends State<Intubation> {

  clearAll() {
    setState(() {
      items = badger.setBadge(items, "0", 1);
    });
    for (var i = 0; i < allDrugs.length; i++) {
      var subLength = allDrugs[i].length;
      for (var j = 0; j < allDrugs[i].length; j++) {
        allDrugBooleans[i][j] = false;
      }
    }
    boolCount = 0;
  }

  @override
  Widget build(BuildContext context) {

    final data = MediaQuery.of(context);

    void buildSnackBar(BuildContext context) {

      final snackBar = SnackBar(
          backgroundColor: Colors.white,
          content: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
            GestureDetector(child: Container(
                alignment: Alignment.center,height: 30, width: 100, color: Color(0xffa6a6a6),
                child: Text("Clear All",
                    style: TextStyle(color: Colors.black))
            ),
                onTap: () {
                  scaffoldKey.currentState.hideCurrentSnackBar();
                  boolCount = 0;
                  for (var i = 0; i < inductionBoolean.length; i++) {
                    setState(() {
                      inductionBoolean[i] = false;
                    });
                  }
                  for (var i = 0; i < paralyticBoolean.length; i++) {
                    setState(() {
                      paralyticBoolean[i] = false;
                    });

                  }
                  for (var i = 0; i < asthmaDrugBoolean.length; i++) {
                    setState(() {
                      asthmaDrugBoolean[i] = false;
                    });

                  }
                  for (var i = 0; i < asthmaCorticoBoolean.length; i++) {
                    setState(() {
                      asthmaCorticoBoolean[i] = false;
                    });
                  }
                  buildSnackBar(context);
                }),
            Text('$boolCount item(s) selected', style: TextStyle(color: Colors.black)),
            GestureDetector(child: Container(alignment: Alignment.center,height: 30, width: 100, color: Color(0xffa6a6a6),child: Text("Confirm", style: TextStyle(color: Colors.black))),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FinalDisplay();
                  })
                  );
                })
          ]
          ),
          duration: const Duration(minutes: 20));
      scaffoldKey.currentState.showSnackBar(snackBar);
    }

    var inductionAgentCells = ListView.builder(
        shrinkWrap: true,
        itemCount: inductionAgents.length,
        itemBuilder: (BuildContext context, var i) {
          return GestureDetector(
              child:Container(width: 9*data.size.width/10,height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: getColor(i)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    Text(inductionAgents[i]),
                    Switch(
                        activeColor: Color(0xff39e600),
                        value: inductionBoolean[i],
                        onChanged: (bool newValue){
                          if (inductionAgents[i] == "Propofol" && weight < 10.0) {
                            propofolErrorAlert(context);
                          }
                          else {
                            scaffoldKey.currentState.hideCurrentSnackBar();
                            if (newValue == true) {
                              boolCount += 1;
                            }
                            else {
                              boolCount -= 1;
                            }
                            buildSnackBar(context);
                            setState(() {
                              inductionBoolean[i] = newValue;
                            }
                            );
                          }
                        }),
                  ],
                  )
              ),
              onTap: () {
                if (inductionAgents[i] == "Propofol" && weight < 10.0) {
                  propofolErrorAlert(context);
                }
                else {
                  scaffoldKey.currentState.hideCurrentSnackBar();
                  if (inductionBoolean[i] == false) {
                    boolCount += 1;
                  }
                  else {
                    boolCount -= 1;
                  }
                  buildSnackBar(context);
                  setState(() {
                    inductionBoolean[i] = !inductionBoolean[i];
                  }
                  );
                }
              });
        });

    var paralyticAgentCells = ListView.builder(
        shrinkWrap: true,
        itemCount: paralyticAgents.length,
        itemBuilder: (BuildContext context, var i) {
          return GestureDetector(child: Container(width: 9*data.size.width/10, height: 40,
              decoration: BoxDecoration(border: Border.all(),color: getColor(i)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                Text(paralyticAgents[i]),
                Switch(
                    activeColor: Color(0xff39e600),
                    value: paralyticBoolean[i],
                    onChanged: (bool newValue){
                      scaffoldKey.currentState.hideCurrentSnackBar();
                      paralyticAgentName = paralyticAgents[i];
                      if (newValue == true) {
                        boolCount += 1;
                      }
                      else {
                        boolCount -=1;
                      }
                      buildSnackBar(context);
                      setState(() {
                        paralyticBoolean[i] = newValue;
                      }
                      );
                    }),
              ]
              )),
              onTap: () {
                scaffoldKey.currentState.hideCurrentSnackBar();
                if (paralyticBoolean[i] == false) {
                  boolCount += 1;
                }
                else {
                  boolCount -= 1;
                }
                buildSnackBar(context);
                setState(() {
                  paralyticBoolean[i] = !paralyticBoolean[i];
                });
              }
          );
        }
    );


    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "PediDosED",
            style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(child: Material(
          child: Column(
              children: <Widget>[
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
                Column(children: <Widget>[
                  SizedBox(height: 30),
                  Divider(thickness: 1.0),
                  ExpansionTile(
                    title: Text("Intubation Equipment Info"),
                    children: intubationEquipmentInfo(context),
                  ),
                  Divider(thickness: 1.0),
                  SizedBox(height: 10),
                  Divider(thickness: 1.0),
                  ExpansionTile(
                    title: Text("Induction Agents"),
                    children: <Widget>[GestureDetector(child: Text("Select Drug from below",
                        style: TextStyle(color: Colors.indigoAccent))),
                      SizedBox(width: 9*data.size.width/10, child: inductionAgentCells)
                    ],
                  ),
                  Divider(thickness: 1.0),
                  PlusMinus(),
                  Divider(thickness: 1.0),
                  ExpansionTile(
                      title: Text("Paralytic Agents"),
                      children: <Widget> [
                        GestureDetector(child: Text("Select Drug from below",
                            style: TextStyle(color: Colors.indigoAccent))),
                        SizedBox(width: 9*data.size.width/10, child: paralyticAgentCells)
                      ]
                  ),
                  Divider(thickness: 1.0),
                  SizedBox(height: data.size.height/3)
                ],
                ),
              ]
          ),
        ),
        )
    );
  }
}



void propofolErrorAlert(BuildContext context) {
  final data = MediaQuery.of(context);
  var popup = new BackdropFilter(filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child:
      AlertDialog(
        title: Text("Alert"),
        content:
        Text("Cannot use Propofol when weight is less than 10 kg",
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