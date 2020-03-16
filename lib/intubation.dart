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

class IntubationState extends State<Intubation> {
  @override
  Widget build(BuildContext context) {

    final data = MediaQuery.of(context);

    List<IntubationAgent> inductionAgents = [
      IntubationAgent(name: "Ketamine", value: "3.5 - 7.5 mg", boolean: true),
      IntubationAgent(name: "Propofol", value: "3.5 - 7.5 mg", boolean: true),
      IntubationAgent(name: "Thiopentone", value: "8.8 - 17.5 mg", boolean: false),
      IntubationAgent(name: "Fentanyl", value: "7 μg", boolean: false),
      IntubationAgent(name: "Midazolam", value: "0.35 mg", boolean: false),
    ];

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
                      onChanged: (newValue){
                        setState(() {
                          inductionAgent.boolean = newValue;
                        }
                        );
                      }),
                ],
                )),
                onTap: () {
              inductionAgent.boolean = !inductionAgent.boolean;
                  alertDialog(context);
                }  ))).values.toList();

    inductionAgentCells.insert(0,GestureDetector(child: Text("Select Drug from below", style: TextStyle(color: Colors.indigoAccent))));


    List<IntubationAgent> paralyticAgents = [
      IntubationAgent(name: "Suxamethonium", value: "3.5 - 7.5 mg", boolean: false),
      IntubationAgent(name: "Roceronium", value: "3.5 - 7.5 mg", boolean: false),
      IntubationAgent(name: "Vecuronium", value: "3.5 - 7.5 mg", boolean: false)
    ];

bool testVal = false;

    List<Widget> paralyticCells = paralyticAgents.asMap().map((i,paralyticAgent)=>
        MapEntry(i, GestureDetector(child: Container(width: 9*data.size.width/10, height: 40,
        decoration: BoxDecoration(border: Border.all(),color: getColor(i)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
          Text('${paralyticAgent.name}'),
          Text("${paralyticAgent.value}")
        ],
        )),
        onTap: () {
          alertDialog(context);
        }  ))).values.toList();

   paralyticCells.insert(0,GestureDetector(child: Text("Select Drug from below", style: TextStyle(color: Colors.indigoAccent))));

    return Scaffold(
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
              Text("")
            ],
            ),
            ]
        ),
      ),
      )
    );
  }

}


void alertDialog(BuildContext context) {
  final data = MediaQuery.of(context);
  var popup = new BackdropFilter(filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
  child:
  CupertinoAlertDialog(
      title: Text("Ketamine"),
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
          TextSpan(text: "0.35 - 0.7 mL")
        ])),
        FlatButton(child: Text("Okay"),
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.black)
            ),
            onPressed: () {
              Navigator.pop(context);
            })
      ]
      )
  ));

  showCupertinoDialog(context: context, builder: (BuildContext context) => popup);
}

