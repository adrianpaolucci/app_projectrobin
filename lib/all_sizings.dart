import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

paddingVerticalBetweenButtons(context) {
  final data = MediaQuery.of(context);
  var padding = data.size.height/100;
  return padding;
}

paddingHorizontalBetweenButtons(context) {
  final data = MediaQuery.of(context);
  var padding = data.size.width/39.27;
  return padding;
}

final shadowColour = Color(0x802196F3);

final lrgBorderRad = 18.0;


//equivalent to approximately text size of 16
medButtonText(context) {
  final data = MediaQuery.of(context);
  return data.size.width / 24.55;
}

//text size of ~4
titleText(context) {
  final data = MediaQuery.of(context);
  return data.size.width / 16.4;
}

topInterventionTitle(context, weight, specificColor, int) {
  final data = MediaQuery.of(context);
  return Row(children: <Widget>[
    Container(height: 100, width: 0.7*data.size.width, color: Color(0xfff2f2f2),
        child: Center(child:
        Text("$int",style: TextStyle(color: specificColor,fontSize: 24.0),textAlign: TextAlign.center,))
    ),
    Column(children: <Widget>[
      Container(alignment: Alignment.bottomCenter,color: Color(0xfff2f2f2),height: 40, width: data.size.width*0.3,child: Icon(CupertinoIcons.bookmark),),
      Container(alignment: Alignment.topCenter,height: 60, width: data.size.width*0.3, color: Color(0xfff2f2f2),
          child: Center(child: Text("$weight kg", style: TextStyle(fontSize: 16.0),))
      )
    ]
    )
  ]
  );
}

final buttonShadowElev = 14.0;