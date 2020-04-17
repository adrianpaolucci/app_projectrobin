import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'icons/my_flutter_app_icons.dart';
import 'seizuresNeurologyData.dart';
import 'interventionMainScreen.dart';
import 'intubationData.dart';
import 'asthmaData.dart';
import 'finalDisplay.dart';

class SeizuresNeurology extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SeizuresNeurologyState();
  }
}

final scaffoldKey = GlobalKey<ScaffoldState>();

class SeizuresNeurologyState extends State<SeizuresNeurology> {
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
                  for (var i = 0; i < seizuresNeurologyBoolean.length; i++) {
                    setState(() {
                      seizuresNeurologyBoolean[i] = false;
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
        body: CustomScrollView(
            slivers: <Widget>[
              SliverPadding(
                padding: EdgeInsets.only(bottom: data.size.width/2),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                        (context, i) {
                          return Column(children: <Widget> [
                            Icon(MyFlutterApp.syringe, size: 30),
                            RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: Text("${seizuresNeurologyDrugs[i]}", textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16.0),),
                                color: seizuresNeurologyBoolean[i] ? Color(0xffaccef7) : Color(0xfff2f2f2),
                                onPressed: () {
                                  scaffoldKey.currentState.hideCurrentSnackBar();
                                  if (seizuresNeurologyBoolean[i] == false) {
                                    boolCount += 1;
                                  }
                                  else {
                                    boolCount -= 1;
                                  }
                                  buildSnackBar(context);
                                  setState(() {
                                    seizuresNeurologyBoolean[i] = !seizuresNeurologyBoolean[i];
                                  });
                                }
                            ),
                            IconButton(icon: Icon(Icons.cancel),
                                color: seizuresNeurologyBoolean[i] ? Colors.black : Colors.white,
                                onPressed: () {
                                  scaffoldKey.currentState.hideCurrentSnackBar();
                                  if (seizuresNeurologyBoolean[i] == false) {
                                    boolCount += 1;
                                  }
                                  else {
                                    boolCount -= 1;
                                  }
                                  buildSnackBar(context);
                                  setState(() {
                                    seizuresNeurologyBoolean[i] = !seizuresNeurologyBoolean[i];
                                  });
                                })
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
    );
  }
}

