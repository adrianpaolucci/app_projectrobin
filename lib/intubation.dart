import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_search_bar/dosing_main.dart';
import 'package:flutter/widgets.dart';
import 'package:app_search_bar/home2.dart';
import 'data.dart';


Color getColor(i) {
  if (i % 2 == 0) {
    return Color(0xffa6a6a6);
  } else {
    return Color(0xfff2f2f2);
  }
}


class Intubation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IntubationState();
  }
}

var boolCount = 0;
String inductionAgentName;
String inductionAmount;
String paralyticAgentName;
String paralyticAmount;


class IntubationState extends State<Intubation> {



  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {


    final data = MediaQuery.of(context);
    List<IntubationAgent> paralyticAgents = [];
    List<IntubationAgent> inductionAgents = [];

    for (var i = 0; i < allAgents.length; i++) {
      if (allAgents[i].type == "Induction") {
        inductionAgents.add(allAgents[i]);
      }
      else {
        paralyticAgents.add(allAgents[i]);
      }
    }



    List<Widget> inductionAgentCells = inductionAgents.asMap().map((i,inductionAgent) =>
        MapEntry(i, GestureDetector(
            child: Container(width: 9*data.size.width/10, height: 40,
                decoration: BoxDecoration(border: Border.all(),color: getColor(i)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                  Text('${inductionAgent.name}'),
                  Text("${inductionAgent.value}"),
                  Checkbox(
                      value: inductionAgent.boolean,
                      onChanged: (bool newValue){
                        _scaffoldKey.currentState.hideCurrentSnackBar();
                        inductionAgentName = inductionAgent.name;
                        inductionAmount = inductionAgent.value;
                        if (newValue == true) {
                          boolCount += 1;
                        }
                        else {
                          boolCount -=1;
                        }
                        buildSnackBar(context);
                        setState(() {
                          inductionAgent.boolean = newValue;
                        }
                        );
                      }),
                ],
                )
            ),
                onTap: () {
              inductionAgent.boolean = !inductionAgent.boolean;
                }  ))).values.toList();

    inductionAgentCells.insert(0,GestureDetector(child: Text("Select Drug from below", style: TextStyle(color: Colors.indigoAccent))));


    List<Widget> paralyticCells = paralyticAgents.asMap().map((i,paralyticAgent)=>
        MapEntry(i, GestureDetector(child: Container(width: 9*data.size.width/10, height: 40,
        decoration: BoxDecoration(border: Border.all(),color: getColor(i)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
          Text('${paralyticAgent.name}'),
          Text("${paralyticAgent.value}"),
          Checkbox(
              value: paralyticAgent.boolean,
              onChanged: (bool newValue){
                _scaffoldKey.currentState.hideCurrentSnackBar();
                paralyticAgentName = paralyticAgent.name;
                paralyticAmount = paralyticAgent.value;
                if (newValue == true) {
                  boolCount += 1;
                }
                else {
                  boolCount -=1;
                }
                buildSnackBar(context);
                setState(() {
                  paralyticAgent.boolean = newValue;
                }
                );
              }),
        ]
        )),
        onTap: () {
          buildSnackBar(context);
        }  ))).values.toList();

   paralyticCells.insert(0,GestureDetector(child: Text("Select Drug from below", style: TextStyle(color: Colors.indigoAccent))));
   paralyticCells.add(GestureDetector(child: Container(height: 50)));

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
              Container(height: 100, width: data.size.width/5, color: Color(0xfff2f2f2),
                  child: Center(child: Text("$weight kg"))
              ),
              Container(height: 100, width: 0.6*data.size.width, color: Color(0xfff2f2f2),
                  child: Center(child:
                  Text("$int",style: TextStyle(color: specificColor,fontSize: 24.0),textAlign: TextAlign.center,))
              ),
              Container(height: 100, width: data.size.width/5, color: Color(0xfff2f2f2),
                  child: Center(child:
                  GestureDetector(child: Text("Back to Case Selection",textAlign: TextAlign.center),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return DosingMain();
                        }
                        )
                        );
                      }
                  )
                  )
              )
            ]
            ),
            Column(children: <Widget>[
                  SizedBox(height: 30),
                  Divider(thickness: 1.0, color: Colors.black),
                  ExpansionTile(
                    title: Text("Intubation Equipment"),
                    children: <Widget>[
                      Text("General Information", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10),
                        Text.rich(
                            TextSpan(
                                text: "",
                                children: <TextSpan>[
                                  TextSpan(text: "Depth",style: TextStyle(fontSize: 16, decoration: TextDecoration.underline)),
                                  TextSpan(text: ": 9 - 9.5 cm to lip, 11 cm to nose", style: TextStyle(fontSize: 16))
                                ]
                            )
                        ),
                        SizedBox(height: 10),
                        Text.rich(
                            TextSpan(
                                text: "",
                                children: <TextSpan>[
                                  TextSpan(text: "LMA Size",style: TextStyle(fontSize: 16, decoration: TextDecoration.underline)),
                                  TextSpan(text: ": 1", style: TextStyle(fontSize: 16))
                                ]
                            )
                        ),
                        SizedBox(height: 10),
                        Text.rich(
                            TextSpan(
                                text: "",
                                children: <TextSpan>[
                                  TextSpan(text: "Laryngoscope",style: TextStyle(fontSize: 16, decoration: TextDecoration.underline)),
                                  TextSpan(text: ": 0", style: TextStyle(fontSize: 16))
                                ]
                            )
                        ),
                        SizedBox(height: 10),
                        Text.rich(
                            TextSpan(
                                text: "",
                                children: <TextSpan>[
                                  TextSpan(text: "Suction",style: TextStyle(fontSize: 16, decoration: TextDecoration.underline)),
                                  TextSpan(text: ": 6 Fr", style: TextStyle(fontSize: 16))
                                ]
                            )
                        ),
                        SizedBox(height: 20),
                      Text("ET Tubes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      Container(alignment: Alignment.centerLeft, decoration: BoxDecoration(border: Border.all(), color: Color(0xffa6a6a6)),width: data.size.width, height: 25,
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget> [
                          Text("Uncuffed",style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),),
                          Text("3.5", style: TextStyle(fontWeight: FontWeight.bold))
                          ])),
                      SizedBox(height: 15),
                      Container(alignment: Alignment.centerLeft, decoration: BoxDecoration(border: Border.all(), color: Color(0xffa6a6a6)),width: data.size.width, height: 25,
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget> [
                            Text("Microcuff",style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                            Text("3", style: TextStyle(fontWeight: FontWeight.bold))
                          ]
                          )
                      ),
                      SizedBox(height: 15),
                      Container(alignment: Alignment.centerLeft, decoration: BoxDecoration(border: Border.all(), color: Color(0xffa6a6a6)),width: data.size.width, height: 25,
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget> [
                            Text("Cuffed",style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                            Text("N/A", style: TextStyle(fontWeight: FontWeight.bold))
                            ])),
                      ],
                      ),
              Divider(thickness: 1.0, color: Colors.black),
              PlusMinus(),
              Divider(thickness: 1.0, color: Colors.black),
              ExpansionTile(
                title: Text("Induction Agents"),
                children: inductionAgentCells,
              ),
              Divider(thickness: 1.0, color: Colors.black),
              PlusMinus(),
              Divider(thickness: 1.0,color: Colors.black),
              ExpansionTile(
                title: Text("Paralytic Agents"),
                children:
                  paralyticCells
              ),
              Divider(thickness: 1.0, color: Colors.black),
              SizedBox(height: data.size.height/3)
            ],
            ),
            ]
        ),
      ),
      )
    );
  }

  buildSnackBar(BuildContext context) {
    final snackBar = SnackBar(
        backgroundColor: Colors.white,
        content: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
          Text('$boolCount item(s) selected', style: TextStyle(color: Colors.black)),
        GestureDetector(child: Container(alignment: Alignment.center,height: 30, width: 100, color: Color(0xffa6a6a6),child: Text("Confirm", style: TextStyle(color: Colors.black))),
        onTap: () {alertDialog(context);
        }
        )
        ]
        ),
        duration: const Duration(minutes: 5));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}


void alertDialog(BuildContext context) {
  final data = MediaQuery.of(context);
  var popup = new BackdropFilter(filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
  child:
  CupertinoAlertDialog(
      title: Text(intubationMap['ketamine']['name']),
      content: Column(children: <Widget>[
        Container(padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(5),
          color: Color(0xffa6a6a6),
          width: 0.7 * data.size.width,
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Dilute", style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold)),
                Text("200 mg in 20 mL"),
                Text("OR"),
                Text("100 mg in 10 mL"),
              ]
          ),
        ),
        Text.rich(TextSpan(text: "", children:
        <TextSpan>[
          TextSpan(text: "Amount: ",
              style: TextStyle(decoration: TextDecoration.underline)),
          TextSpan(text: inductionAmount)
        ])),
        SizedBox(height: 15),
        Divider(thickness: 1.0, color: Colors.black),
        SizedBox(height: 15),
        Text(paralyticAgentName, style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold)),
        SizedBox(height: 15),
        Container(padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(5),
          color: Color(0xffa6a6a6),
          width: 0.7 * data.size.width,
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Dilute", style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold)),
                Text("200 mg in 20 mL"),
                Text("OR"),
                Text("100 mg in 10 mL"),
              ]
          ),
        ),
        Text.rich(TextSpan(text: "", children:
        <TextSpan>[
          TextSpan(text: "Amount: ",
              style: TextStyle(decoration: TextDecoration.underline)),
          TextSpan(text: paralyticAmount)
        ])),
        SizedBox(height: 15),
        FlatButton(child: Text("Okay"),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.black)
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ]
      )
  ));

  showCupertinoDialog(context: context, builder: (BuildContext context) => popup);
}
