import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'allDrugData.dart';


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
    Container(height: appBarHeight(context), width: 0.6*data.size.width, color: Color(0xfff2f2f2),
        child: Center(child:
        Text("$int",style: TextStyle(color: specificColor,fontSize: titleText(context)),textAlign: TextAlign.center,))
    ),

      Container(
        width: data.size.width*0.15,
        height: appBarHeight(context),
        alignment: Alignment.centerRight,
        color: Color(0xfff2f2f2),
        child: FaIcon(
            FontAwesomeIcons.balanceScaleLeft,
            size: data.size.width/12),
      ),
      Container(
        width: data.size.width*0.25,
        alignment: Alignment.center,
        height: appBarHeight(context),
  color: Color(0xfff2f2f2),
        child: Text(
              "$weight kg",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size20Text(context)
              ),
            ),
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


//equivalent padding of ~5 pixels on standard phone
smallButtonPadding(context) {
  final data = MediaQuery.of(context);
  return data.size.width/74;
}

//standard box decoration for final drug display
lightBoxDec(context) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(mediumButtonRadius(context)),
      color: Color(0xffe6e6e6)
  );
}

whiteBoxDec(context) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(mediumButtonRadius(context)),
      color: Colors.white
  );
}

//equivalent radius of ~25 pixels on standard phone
largeButtonRadius(context) {
  final data = MediaQuery.of(context);
  return data.size.width/15.5;
}

//relative size for click buttons to select drug
//(the ones on the seizures and neurology screen)
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

//equivalent padding of ~15 pixels on standard phone
popupPadding(context) {
  final data = MediaQuery.of(context);
  return data.size.width/15;
}

//equivalent padding of ~20 pixels on standard phone
appBarPadding(context) {
  final data = MediaQuery.of(context);
  return data.size.width/20;
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionDuration: Duration(milliseconds: 250),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}

class SlideLeftRoute extends PageRouteBuilder {
  final Widget page;
  SlideLeftRoute({this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionDuration: Duration(milliseconds: 250),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}


void CroupErrorAlert(BuildContext context, var i) {
  final data = MediaQuery.of(context);
  var popup = new BackdropFilter(filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child:
      AlertDialog(
        title: Text("Alert"),
        content:
        Text("Cannot use ${allDrugs[11][i]} when weight is less than 6 kg",
            style: TextStyle(fontSize: size16Text(context))),
        actions: <Widget>[
          FlatButton(child: Text("Okay", style: TextStyle(fontSize: 18)),
              onPressed: () {
                Navigator.pop(context);
              }
          )
        ],
      )
  );

  showDialog(context: context, builder: (BuildContext context) => popup);
}


void propofolErrorAlert(BuildContext context) {
  final data = MediaQuery.of(context);
  var popup = new BackdropFilter(filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child:
      AlertDialog(
        title: Text("Alert"),
        content:
        Text("Cannot use Propofol when weight is less than 10 kg",
            style: TextStyle(fontSize: size16Text(context))),
        actions: <Widget>[
          FlatButton(child: Text("Okay", style: TextStyle(fontSize: 18)),
              onPressed: () {
                Navigator.pop(context);
              }
          )
        ],
      )
  );

  showDialog(context: context, builder: (BuildContext context) => popup);
}