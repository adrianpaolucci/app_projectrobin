import 'package:flutter/material.dart';
import 'package:app_search_bar/home.dart';
import 'package:app_search_bar/dosing_main.dart';

class Anaphylaxis extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
                Container(height: 100, width: 130, color: Color(0xfff2f2f2),
                    child: Center(child: Text("$weight"))
                ),
                Container(height: 100, width: 130, color: Color(0xfff2f2f2),
                    child: Center(child:
                    Text("Anaphylaxis",style: TextStyle(color: Colors.red,fontSize: 24.0),textAlign: TextAlign.center,))
                ),
                Container(height: 100, width: 130, color: Color(0xfff2f2f2),
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
             ],
            ),
            Column(
              children: <Widget>[
                SizedBox(height:20),
                Divider(thickness: 1.0, color: Colors.black),
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
                Divider(thickness: 1.0, color: Colors.black),
                PlusMinus(),
                Divider(thickness: 1.0, color: Colors.black),
                ExpansionTile(
                    title: Text("IV Fluid Bolus"),
                    children: <Widget>[
                      Column(children: <Widget>[
                        Container(height: 30,
                            child: Center(child:
                            Text("Sample Amount in mL",textAlign: TextAlign.center, style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),))),
                        Container(height: 30,
                            child: Center(child:
                            Text("Sample Dilution of 1:1000",textAlign: TextAlign.center, style: TextStyle()))),
                      ],
                      )
                    ],
                    backgroundColor: Color(0xfff2f2f2)
                ),
                Divider(thickness: 1.0, color: Colors.black),
              ],
            )
          ],
      ),
      )
    );
  }
}

