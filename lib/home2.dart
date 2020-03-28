import 'package:flutter/material.dart';
import 'package:app_search_bar/dosing_main.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';

class Home2 extends StatefulWidget {
  State<StatefulWidget> createState() {
    return Home2State();
  }
}

final ranges = [
  [2.0,2.5,3.0,3.5],[2.0,2.5,3.0,3.5],
  [4.0,4.5,5.0],[4.0,4.5,5.0],
  [5.5,6.0,6.5],[5.5,6.0,6.5],
  [7.0,8.0],[7.0,8.0],
  [9.0,10.0],[9.0,10.0],
  [10.0,11.0,12.0],[10.0,11.0,12.0],
  [11.0,12.0,13.0],[11.0,12.0,13.0],
  [13.0,14.0,15.0],[13.0,14.0,15.0],
  [15.0,16.0,17.0],[15.0,16.0,17.0],
  [18.0,19.0,20.0],[18.0,19.0,20.0],
];



final allWeights = [2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,22.0,24.0,26.0,28.0,30.0,35.0,40.0,45.0,50.0,55.0,60.0,65.0,70.0,75.0,80.0];
var weight = 0.0;
var specificRange = [];
var refColor;
var weightIndex;
class Home2State extends State<Home2> {

  final ageWeightList =
  ["Birth (Term)","3.5 kg",
    "1 month", "4.5 kg",
    "3 months", "6 kg",
    "6 months","7-8 kg",
    "12 months","9-10 kg",
    "18 months","11 kg",
    "2 years","12 kg",
    "3 years","14 kg",
    "4 years","16 kg",
    "5 years","18-20 kg"];

  /*"8 years""25 kg"
  "10 years","30-32 kg",
  "11 years","35 kg"
  "14 years","50kg",
  "Adult","70 kg"*/

  final boxColors =
  [Colors.redAccent,Colors.white,
  Colors.redAccent, Colors.white,
    Colors.redAccent,Colors.white,
    Colors.redAccent, Colors.white,
    Colors.redAccent,Colors.white,
    Colors.purpleAccent, Colors.white,
    Colors.lightGreenAccent,Colors.white,
    Colors.lightGreenAccent, Colors.white,
    Colors.greenAccent,Colors.white,
    Colors.deepPurple, Colors.white,
    Colors.orange,Colors.white];

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
    appBar: AppBar(centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        "Age / Weight Estimation",
        style: TextStyle(
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
      ),
      body: Row(children: <Widget>[
      Container(
          color: Colors.grey,
          width: data.size.width,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      var textBox = ageWeightList[index];
                      var childBox;
                      if (index.isOdd) {
                          childBox = Container(
                            decoration: BoxDecoration(border: Border.all(
                                color: Colors.grey), color: Colors.white),
                            alignment: Alignment.center,
                            child:
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
                              Container(width: data.size.width / 12,
                                  color: boxColors[index]),
                              Text(textBox,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.0)),
                              Icon(Icons.arrow_forward_ios)
                            ]
                            )
                        );
                      }
                      else {
                          childBox = Container(
                            decoration: BoxDecoration(border: Border.all(
                                color: Colors.grey), color: Colors.white),
                            alignment: Alignment.center,
                            child:
                            Row(children: <Widget>[
                              Container(width: data.size.width / 12,
                                  color: boxColors[index]),
                              Container(width: data.size.width / 12),
                              Text(textBox,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.0))
                            ]
                            )
                        );
                      }
                      return GestureDetector(
                          onTap: () {
                            specificRange = ranges[index];
                              return weightBox(context);
                          },
                        child: childBox
                      );
                    },
                  childCount: ageWeightList.length
                ),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 5.0,
                  childAspectRatio: 3,
                  mainAxisSpacing: 5.0
                )
              )
        ]
        )
      )
          ]
      )
    );
  }
}




void weightBox(BuildContext context) {
  final data = MediaQuery.of(context);

  List<Widget> chooseWeightPopup = specificRange.asMap().map((i, specificRange) => MapEntry(i, Column(children: <Widget>[
    GestureDetector(child:
    Container(decoration: BoxDecoration(color: Colors.grey,border: Border.all(),borderRadius: BorderRadius.all(Radius.circular(10.0))),
        padding: EdgeInsets.all(20.0),
        child:
        Text(specificRange.toString() + " kg",style: TextStyle(fontSize: 18))),
      onTap: () {
        weight = specificRange;
        weightIndex = allWeights.indexOf(weight);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DosingMain();
        }
        )
        );
      },
    ),
  SizedBox(height: 30)]))).values.toList();

  var popup = new BackdropFilter(filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
      child:
      CupertinoAlertDialog(
          title: Text("Choose Weight"),
          content: Column(children: <Widget>[
            Container(padding: EdgeInsets.only(top: 30),
              margin: EdgeInsets.all(5),
              width: 0.7 * data.size.width,
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: chooseWeightPopup
              ),
            ),
          ]
          ),
        actions: <Widget>[CupertinoDialogAction(
            isDefaultAction: true,
            child: Text("Back"),
            onPressed: () {
              Navigator.pop(context);
            }
        )
        ],
      ));



  showCupertinoDialog(context: context, builder: (BuildContext context) => popup);
}