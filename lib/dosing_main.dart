import 'package:app_search_bar/anaphylaxis.dart';
import 'package:flutter/material.dart';
import 'package:app_search_bar/intubation.dart';
import 'package:app_search_bar/home2.dart';

var interventions = ["Anaphylaxis", "Haemorrhage", "Resuscitation","Seizures/Neurology","Intubation","Electrolyte Abnormalities","Antidotes","Push-Dode Pressors","Infusions"];
var pages = [Anaphylaxis(),Anaphylaxis(),Anaphylaxis(),Anaphylaxis(),Intubation(),Anaphylaxis(),Anaphylaxis(),Anaphylaxis(),];
var intColors = [Colors.red,Colors.brown,Colors.red,Colors.green,Colors.blueAccent,Colors.purple,Colors.orange,Colors.pinkAccent,Colors.brown];
var int = "";
var specificColor = null;

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
                      width: 50,
                      height: 1000,
                      padding: EdgeInsets.only(left: 20, top: 20),
                      child: Text(
                          "Calculations rounded to $weight kg",
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr),
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