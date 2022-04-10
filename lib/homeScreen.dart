import 'package:app_search_bar/all_sizings.dart';
import 'package:flutter/material.dart';
import 'package:app_search_bar/interventionMainScreen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ios_search.dart';

var previousPage;

var navBarIndex = 0;

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
    [5.5,6.0],[5.5,6.0],
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

    var homeListItems = ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: 15,
        itemBuilder: (BuildContext context, var i) {
          return Container(
            color: Color(0xffffffff),
            height: data.size.height*0.1,
            child: InkWell(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: data.size.width*0.45,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: smallButtonPadding(context),
                                    top: data.size.height/100),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        data.size.width/40
                                    ),
                                    color: boxColors[2*i]),
                                width: data.size.width / 20,
                              ),
                              Padding(
                                padding: EdgeInsets.all(paddingHorizontalBetweenButtons(context)),
                                child: Text(
                                    ageWeightList[2*i],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: size18Text(context)
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: data.size.width*0.55,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: data.size.width*0.15
                                ),
                                child: SizedBox(
                                  child: Text(
                                      ageWeightList[2*i + 1],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: size18Text(context))
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: data.size.width/40),
                                child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: data.size.width*0.12),
                      child: Divider(thickness: 1.0)
                  )
                ]
              ),
              onTap: () {
                specificRange = ranges[2*i];
                List<Widget> actions = [];
                for (var i = 0; i < specificRange.length; i++) {
                  actions.add(
                      CupertinoActionSheetAction(
                        child:
                            Text(
                                "${specificRange[i]} kg",
                                //style: TextStyle(
                               //   color: weightColours(specificRange[i]))
                      ),
                        onPressed: () {
                          weight = specificRange[i];
                          weightIndex = allWeights.indexOf(weight);
                          Navigator.push(
                              context,
                              ForwardRoute(page: InterventionMain())
                          );
                        }
                      )
                  );
                }
                final actionSheet = CupertinoActionSheet(
                    title: Text(
                        "Select Weight",
                        style: TextStyle(
                          fontSize: size16Text(context)
                        )),
                    actions: actions,
                    cancelButton: CupertinoActionSheetAction(
                      child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          )),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                );
                showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => actionSheet);
              },
            ),
          );
        });


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
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Image.asset('lib/icons/m_health.png'),
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
          child: CupertinoScrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [homeListItems],
              ),
            ),
          )
      )
      ]
      )
    );
  }
}

weightColours(weight)
{
  if (weight >= 2 && weight <= 9) {
    return Color(0xfff04747);
  }
  else if (weight >= 10 && weight <= 11) {
    return Color(0xff903990);
  }
  else if (weight >= 12 && weight <= 14) {
    return Color(0xfff0ff00);
  }
  else if (weight >= 15 && weight <= 18) {
    return Color(0xffffffff);
  }
  else if (weight >= 19 && weight <= 22) {
    return Color(0xff1d9dc3);
  }
  else if (weight >= 24 && weight <= 28) {
    return Color(0xffffa500);
  }
  else if (weight >= 30 && weight <= 35) {
    return Color(0xff08b408);
  }
  else if(weight >= 40 && weight <= 80)
    return Color(0xff000000);
}



