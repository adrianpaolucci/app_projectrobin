import 'package:app_search_bar/anaphylaxis.dart';
import 'package:flutter/material.dart';
import 'package:app_search_bar/intubation.dart';
import 'package:app_search_bar/home2.dart';

var interventions = [
                      "Anaphylaxis", "Resuscitation",
                      "Management of Shock","Bleeding",
                      "Intubation","Seizures/Neurology",
                      "Asthma","Infection",
                      "Antidotes", "Electrolye Abnormalities"
                      ];

var pages = [Anaphylaxis(),Anaphylaxis(),Anaphylaxis(),Anaphylaxis(),Intubation(),Anaphylaxis(),Anaphylaxis(),Anaphylaxis(),Anaphylaxis(),Anaphylaxis()];

var intColors = [
                 Colors.red,Colors.red,
                 Colors.red,Colors.red,
                 Colors.indigo,Colors.green,
                 Colors.indigoAccent,Colors.orangeAccent,
                 Colors.orange,Colors.purple
                ];

var int = "";
var specificColor;

class DosingMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DosingMainState();
  }
}

class _DosingMainState extends State<DosingMain> {


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
      body:
          CustomScrollView(
            slivers: <Widget>[
              SliverFixedExtentList(
                itemExtent: 50.0,
                delegate: SliverChildListDelegate([
                  Container(
                      alignment: Alignment.centerLeft,
                      width: 50,
                      height: 1000,
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Text("Calculations rounded to $weight kg",
                      textDirection: TextDirection.ltr, style: TextStyle(fontSize: 18),),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text("Choose an Intervention",
                    textAlign: TextAlign.center,)
                  )
                ]),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return GestureDetector(
                            onTap: () {
                              int = interventions[index];
                              specificColor = intColors[index];
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return pages[index];
                              }
                              )
                              );
                            },
                            child: Container(alignment: Alignment.center,
                                color: Color(0xfff2f2f2),
                            child: Text(interventions[index], textAlign: TextAlign.center,style: TextStyle(color: intColors[index],fontSize: 20.0)))
                        );
                      },
                  childCount: interventions.length,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 2.0,
                ),
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