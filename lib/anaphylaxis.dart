import 'package:app_search_bar/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:app_search_bar/interventionMainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';


class Anaphylaxis extends StatefulWidget {

  @override
  AnaphylaxisState createState() => AnaphylaxisState();
  }

class AnaphylaxisState extends State<Anaphylaxis> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "PediDosED",
          style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: Material(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
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
                      return InterventionMain();
                      }
                    )
                    );
                      }
                    )
                )
                )
             ],
            ),
            Column(
              children: <Widget>[
                SizedBox(height:20),
                adrianDivider(),
                ExpansionTile(
                  title: Text("IM Adrenaline"),
                  children: <Widget>[
                    Column(children: <Widget>[
                      Container(color: Color(0xfff2f2f2),height: 30,
                          child: Center(child:
                          Text("0.05mL",textAlign: TextAlign.center, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),))),
                      Container(color: Color(0xfff2f2f2),height: 30,
                          child: Center(child:
                          Text("(1:1000 small ampule)",textAlign: TextAlign.center, style: TextStyle()))),
                    ],
                    )
                  ],
                ),
                adrianDivider(),
                PlusMinus(),
                adrianDivider(),
                ExpansionTile(
                    title: Text("IV Fluid Bolus"),
                    children: <Widget>[
                      Column(children: <Widget>[
                        Container(height: 30,
                            child: Center(child:
                            Text("$weight mL",textAlign: TextAlign.center, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),))),
                        Container(height: 30,
                            child: Center(child:
                            Text("Dilute by 1:10 in Saline",textAlign: TextAlign.center, style: TextStyle()))),
                      ],
                      )
                    ],
                    backgroundColor: Color(0xfff2f2f2)
                ),
                adrianDivider(),
              ],
            )
          ],
      ),
      )
    );
  }
}

