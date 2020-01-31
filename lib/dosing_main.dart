import 'package:app_search_bar/anaphylaxis.dart';
import 'package:app_search_bar/home.dart';
import 'package:flutter/material.dart';


class DosingMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DosingMainState();
  }
}

class _DosingMainState extends State<DosingMain> {

var interventions = ["Anaphylaxis", "Intubation", "Resuscitation","Haemorrhage","Antidotes","Infusions"];

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
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return Anaphylaxis();
                              }
                              )
                              );
                            },
                            child: Container(alignment: Alignment.center,
                                color: Color(0xfff2f2f2),
                            child: Text(interventions[index]))
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