import 'package:app_search_bar/asthmaData.dart';
import 'package:app_search_bar/interventionMainScreen.dart';
import 'package:flutter/material.dart';
import 'finalDisplay.dart';
import 'homeScreen.dart';
import 'intubation.dart';
import 'intubationData.dart';
import 'dart:ui';

class Asthma extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AsthmaState();
  }
}

final _scaffoldKey = GlobalKey<ScaffoldState>();


class AsthmaState extends State<Asthma> {
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
                  _scaffoldKey.currentState.hideCurrentSnackBar();
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
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }

    var asthmaDrugCells = ListView.builder(
        shrinkWrap: true,
        itemCount: asthmaDrugs.length,
        itemBuilder: (BuildContext context, var i) {
          return GestureDetector(
              child:Container(width: 9*data.size.width/10,height: 40,
                  decoration: BoxDecoration(border: Border.all(),color: getColor(i)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    Text(asthmaDrugs[i]),
                    Checkbox(
                        value: asthmaDrugBoolean[i],
                        onChanged: (bool newValue){
                          if (weight < 10.0) {
                            asthmuaDrugErrorAlert(context, i);
                          }
                          else {
                          _scaffoldKey.currentState.hideCurrentSnackBar();
                          if (newValue == true) {
                            boolCount += 1;
                          }
                          else {
                            boolCount -= 1;
                          }
                          buildSnackBar(context);
                          setState(() {
                            asthmaDrugBoolean[i] = newValue;
                          }
                          );
                        }
                        }
                        ),
                  ],
                  )
              ),
              onTap: () {
                if (weight < 10.0) {
                  asthmuaDrugErrorAlert(context, i);
                }
                else {
                  _scaffoldKey.currentState.hideCurrentSnackBar();
                  if (asthmaDrugBoolean[i] == false) {
                    boolCount += 1;
                  }
                  else {
                    boolCount -= 1;
                  }
                  buildSnackBar(context);
                  setState(() {
                    asthmaDrugBoolean[i] = !asthmaDrugBoolean[i];
                  }
                  );
                }
              }
              );
        });

    var asthmaCorticoCells = ListView.builder(
        shrinkWrap: true,
        itemCount: asthmaCorticos.length,
        itemBuilder: (BuildContext context, var i) {
          return GestureDetector(
              child:Container(width: 9*data.size.width/10,height: 40,
                  decoration: BoxDecoration(border: Border.all(),color: getColor(i)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    Text(asthmaCorticos[i]),
                    Checkbox(
                        value: asthmaCorticoBoolean[i],
                        onChanged: (bool newValue){
                          _scaffoldKey.currentState.hideCurrentSnackBar();
                          if (newValue == true) {
                            boolCount += 1;
                          }
                          else {
                            boolCount -= 1;
                          }
                          buildSnackBar(context);
                          setState(() {
                            asthmaCorticoBoolean[i] = newValue;
                          }
                          );
                        }),
                  ],
                  )
              ),
              onTap: () {
                _scaffoldKey.currentState.hideCurrentSnackBar();
                if (asthmaCorticoBoolean[i] == false) {
                  boolCount += 1;
                }
                else {
                  boolCount -= 1;
                }
                buildSnackBar(context);
                setState(() {
                  asthmaCorticoBoolean[i] = !asthmaCorticoBoolean[i];
                }
                );
              });
        });

    return Scaffold(
        key: _scaffoldKey,
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
                    SizedBox(height: 10),
                    Divider(thickness: 1.0),
                    ExpansionTile(
                      title: Text("General Drugs"),
                      children: <Widget>[GestureDetector(child: Text("Select Drug from below",
                          style: TextStyle(color: Colors.indigoAccent))),
                        SizedBox(width: 9*data.size.width/10, child: asthmaDrugCells)
                      ],
                    ),
                    Divider(thickness: 1.0),
                    PlusMinus(),
                    Divider(thickness: 1.0),
                    ExpansionTile(
                        title: Text("Corticosteroids"),
                        children: <Widget> [
                          GestureDetector(child: Text("Select Drug from below",
                              style: TextStyle(color: Colors.indigoAccent))),
                          SizedBox(width: 9*data.size.width/10, child: asthmaCorticoCells)
                        ]
                    ),
                    Divider(thickness: 1.0),
                    SizedBox(height: data.size.height/3)
                  ],
                  ),
                ]
            )
        )
        )
    );
  }
}

buildNavigationBar() {

  var navBar = BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.cancel),title: Text("Clear All"),backgroundColor: Color(0xfff2f2f2)),
        BottomNavigationBarItem(icon: Icon(Icons.stop, color:  Colors.white),title: Text("0 item(s) selected")),
        BottomNavigationBarItem(icon: Icon(Icons.check),title: Text("Confirm"),backgroundColor: Color(0xfff2f2f2))
      ]
  );
  return navBar;
}

void asthmuaDrugErrorAlert(BuildContext context, i) {
  final data = MediaQuery.of(context);
  var popup = new BackdropFilter(filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child:
      AlertDialog(
        title: Text("Alert"),
        content: Text("Cannot use ${asthmaDrugs[i]} when weight is less than 10.0 kg"),
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