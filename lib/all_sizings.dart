import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

paddingVerticalBetweenButtons(context) {
  final data = MediaQuery.of(context);
  var padding = data.size.height/100;
  return padding;
}

Color getColor(i) {
  if (i % 2 == 0) {
    return Color(0xffcccccc);
  } else {
    return Color(0xffe6e6e6);
  }
}

genericIconSize(context) {
  final data = MediaQuery.of(context);
  return data.size.width/15;
}

paddingHorizontalBetweenButtons(context) {
  final data = MediaQuery.of(context);
  var padding = data.size.width/39.27;
  return padding;
}

final shadowColour = Color(0x802196F3);

final lrgBorderRad = 18.0;


//equivalent to approximately text size of 16
size16Text(context) {
  final data = MediaQuery.of(context);
  return data.size.width / 24.55;
}

size14Text(context) {
  final data = MediaQuery.of(context);
  return data.size.width/28.05;
}

size18Text(context) {
  final data = MediaQuery.of(context);
  return data.size.width / 21.82;
}

size20Text(context) {
  final data = MediaQuery.of(context);
  return data.size.width / 18.5;
}

//text size of ~24
titleText(context) {
  final data = MediaQuery.of(context);
  return data.size.width / 16.4;
}

//equates to abt 1/7 of screen
appBarHeight(context) {
  final data = MediaQuery.of(context);
  return data.size.longestSide/7.5;
}

topInterventionTitle(context, weight, specificColor, int) {
  final data = MediaQuery.of(context);
  return Row(children: <Widget>[
    Container(height: appBarHeight(context), width: 0.7*data.size.width, color: Color(0xfff2f2f2),
        child: Center(child:
        Text("$int",style: TextStyle(color: specificColor,fontSize: titleText(context)),textAlign: TextAlign.center,))
    ),
    Column(children: <Widget>[
      Container(alignment: Alignment.bottomCenter,color: Color(0xfff2f2f2), width: data.size.width*0.3,child: Icon(CupertinoIcons.bookmark, size: genericIconSize(context),)),
      Container(alignment: Alignment.topCenter, width: data.size.width*0.3, color: Color(0xfff2f2f2),
          child: Center(child: Text("$weight kg", style: TextStyle(fontSize: size14Text(context))))
      )
    ]
    )
  ]
  );
}

//standard shadow value for button elevation
final buttonShadowElev = 14.0;

//corner radius for button/box of 10 relative pixels
mediumButtonRadius(context) {
  final data = MediaQuery.of(context);
  return data.size.width/35;
}

lightBoxDec(context) {
  return BoxDecoration(borderRadius: BorderRadius.circular(mediumButtonRadius(context)),color: Color(0xffcccccc));
}

largeButtonRadius(context) {
  final data = MediaQuery.of(context);
  return data.size.width/15.5;
}

largeButtonHeight(context) {
  final data = MediaQuery.of(context);
  return data.size.height/6.2;
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
