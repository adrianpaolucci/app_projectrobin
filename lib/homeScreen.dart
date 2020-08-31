import 'package:app_search_bar/all_sizings.dart';
import 'package:app_search_bar/main.dart';
import 'package:flutter/material.dart';
import 'package:app_search_bar/interventionMainScreen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Home2 extends StatefulWidget {
  State<StatefulWidget> createState() {
    return Home2State();
  }
}


final allWeights = [2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,
                    20.0,22.0,24.0,26.0,28.0,30.0,35.0,40.0,45.0,50.0,55.0,60.0,65.0,70.0,75.0,80.0];
var weight = 0.0;
var specificRange = [];
var refColor;
var weightIndex;
class Home2State extends State<Home2> {

  final ageWeightList = [
    "Birth (Term)","3.5 kg",
    "1 month", "4.5 kg",
    "3 months", "6 kg",
    "6 months","7-8 kg",
    "12 months","9-10 kg",
    "18 months","11 kg",
    "2 years","12 kg",
    "3 years","14 kg",
    "4 years","16 kg",
    "5 years","18-20 kg",
    "8 years","25 kg",
    "10 years","30-32 kg",
    "11 years","35 kg",
    "14 years","50kg",
    "Adult","70 kg"
  ];

  final boxColors = [
    Color(0xfff04747),Colors.white,
    Color(0xfff04747), Colors.white,
    Color(0xfff04747),Colors.white,
    Color(0xfff04747), Colors.white,
    Color(0xfff04747),Colors.white,
    Color(0xff903990), Colors.white,
    Color(0xfff0ff00),Colors.white,
    Color(0xfff0ff00), Colors.white,
    Color(0xfff0ff00),Colors.white,
    Color(0xff1d9dc3), Colors.white,
    Color(0xffffa500),Colors.white,
    Color(0xff08b408),Colors.white,
    Color(0xff08b408), Colors.white,
    Color(0xff000000), Colors.white,
    Color(0xff000000),Colors.white
  ];

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
    [22.0,24.0,26.0,28.0],[22.0,24.0,26.0,28.0],
    [28.0,30.0,35.0],[28.0,30.0,35.0],
    [35.0,40.0],[35.0,40.0],
    [45.0,50.0,55.0,60.0],[45.0,50.0,55.0,60.0],
    [65.0,70.0,75.0,80.0],[65.0,70.0,75.0,80.0]
  ];

  @override
  Widget build(BuildContext context) {

    final data = MediaQuery.of(context);

    sliverBox(index, textBox) {
      var childBox;
      if (index.isOdd) {
        childBox = Container(
          margin: EdgeInsets.only(right: smallButtonPadding(context)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mediumButtonRadius(context)),
                color: Colors.white),
            alignment: Alignment.center,
            child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
              Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(mediumButtonRadius(context)),bottomLeft: Radius.circular(mediumButtonRadius(context))),
      color: boxColors[index]),width: data.size.width / 12),
              Text(textBox,
                  style: TextStyle(
                      color: Colors.black, fontSize: size18Text(context))
              ),
              Padding(
                padding: EdgeInsets.only(right: data.size.width/40),
                child: Icon(Icons.arrow_forward_ios),
              )
            ]
            )
        );
      }
      else {
        childBox = Container(
          margin: EdgeInsets.only(left: smallButtonPadding(context)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mediumButtonRadius(context)),
                color: Colors.white),
            alignment: Alignment.center,
            child:
            Row(children: <Widget>[
              Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(mediumButtonRadius(context)),bottomLeft: Radius.circular(mediumButtonRadius(context))),
                      color: boxColors[index]),
                  width: data.size.width / 12,
              ),
              Container(width: data.size.width / 12),
              Text(textBox,
                  style: TextStyle(
                      color: Colors.black, fontSize: size18Text(context)))
            ]
            )
        );
      }
      return childBox;
    }


    return Scaffold(
    appBar: AppBar(centerTitle: true,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: data.size.width/5),
            child: FaIcon(FontAwesomeIcons.calendarDay, color: Colors.black, size: genericIconSize(context)),
          ),
          Padding(
            padding: EdgeInsets.only(right: data.size.width/5),
            child: FaIcon(FontAwesomeIcons.balanceScale, color: Colors.black, size: genericIconSize(context)),
          ),
        ],
        )
        ,)
    ),
      body: Row(children: <Widget>[
      Container(
          color: Color(0xffcccccc),
          width: data.size.width,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      var textBox = ageWeightList[index];
                      return GestureDetector(
                          onTap: () {
                            specificRange = ranges[index];
                              return weightBox(context);
                          },
                        child: sliverBox(index, textBox)
                      );
                    },
                  childCount: ageWeightList.length
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  mainAxisSpacing: data.size.width/60,
                  crossAxisSpacing: data.size.width/60,
                  childAspectRatio: 3,
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

weightBox(BuildContext context) {
  final data = MediaQuery.of(context);

  List<Widget> chooseWeightPopup = [];

  for (var i = 0; i < specificRange.length; i++) {
    chooseWeightPopup.add(

          Material(
              elevation: 25, shadowColor: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(data.size.width/30)),
              child:
              InkWell(child:
              Container(
                  decoration: BoxDecoration(
                      //color: Color(0xfff2f2f2),
                      borderRadius: BorderRadius.all(Radius.circular(data.size.width/30)
                      )
                  ),
                  padding: EdgeInsets.all(data.size.width/20),
                  child:
                  Text(specificRange[i].toString() + " kg",style: TextStyle(fontSize: size16Text(context))
                  )
              ),
        onTap: () {
          weight = specificRange[i];
          weightIndex = allWeights.indexOf(weight);
          Navigator.push(context, SlideLeftRoute(page: InterventionMain())
          );
        },
      )
          )
    );
    chooseWeightPopup.add(SizedBox(height: data.size.width/13));
  }
  chooseWeightPopup.removeLast();

  var boxHeight = data.size.height*(0.1 +  0.1*specificRange.length);
  var popup = new BackdropFilter(filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
    child: AlertDialog(
        title: Text("Choose Weight", style: TextStyle(
            fontSize: size18Text(context))),
        content: Container(height: boxHeight,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: chooseWeightPopup)
        ),
        actions: <Widget>[
          FlatButton(child: Text("Back",style: TextStyle(fontSize: size16Text(context))), onPressed: () {
            Navigator.pop(context);
          }
          )
        ]
      ),
  );
  showDialog(context: context, builder: (context) {
    return popup;
  }
  );
}

weightColours()
{
  if(weight >= 2 && weight <= 9)
    return Color(0xfff04747);
  if(weight >= 10 && weight <= 11)
    return Color(0xff903990);
  if(weight >= 12 && weight <= 14)
    return Color(0xfff0ff00);
  if(weight >= 15 && weight <= 18)
    return Color(0xffffffff);
  if(weight >= 19 && weight <= 22)
    return Color(0xff1d9dc3);
  if(weight >= 24 && weight <= 28)
    return Color(0xffffa500);
  if(weight >= 30 && weight <= 35)
    return Color(0xff08b408);
  else if(weight >= 40 && weight <= 80)
    return Color(0xff000000);

}