import 'dart:ui';
import 'package:app_search_bar/interventionMainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
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
  return data.size.width/18;
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


void croupErrorAlert(BuildContext context, var i) {
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


void errorAlert(BuildContext context, i, j, k ) {
  var popup = new BackdropFilter(filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
      child:
      AlertDialog(
        title: Text("Alert"),
        content:
        Text("Cannot use $i when weight is $j than $k kg",
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

finalDisplayFull(
    var interventionColour,
    BuildContext context,
    var drugName,
    Widget function1,
    Widget function2,
    Widget function3,
    Widget function4,
    ) {

  final data = MediaQuery.of(context);

  return Column(
      children: <Widget>[
        SizedBox(height: 15),
        Container(
            width: 0.8*data.size.width,
            decoration: lightBoxDec(context),
            child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: smallButtonPadding(context)),
                  child: Text(
                      "$drugName",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: size18Text(context),
                          color: interventionColour,
                          fontWeight: FontWeight.bold)
                  ),
                )
            )
        ),
        Container(padding: EdgeInsets.all(10.0),
          decoration: whiteBoxDec(context),
          width: 0.8 * data.size.width,
          child:
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                function1,
                function2,
                function3
              ]
          ),
        ),
        SizedBox(height: 15),
        Container(
            padding: EdgeInsets.symmetric(
                horizontal: 3*smallButtonPadding(context),
                vertical: smallButtonPadding(context)),
            width: 0.8*data.size.width,
            decoration: lightBoxDec(context),
            child: function4
        ),
        SizedBox(height: 15)]
  );
}

Widget finalDisplayDilute(BuildContext context, var instruction, var value1, var value2) {

  return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: smallButtonPadding(context),
              right: smallButtonPadding(context),
              top: smallButtonPadding(context)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$instruction",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size16Text(context)
                  )
              ),
              Text("$value1",
                  style: TextStyle(
                      fontSize: size16Text(context)
                  ))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: smallButtonPadding(context)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("$value2",
              textAlign: TextAlign.right)
            ],
          ),
        )
      ]
  );
}

Widget finalDisplayGive(BuildContext context, var instruction, var value) {

  return Column(
    children: [
      Padding(
      padding: EdgeInsets.only(
          left: smallButtonPadding(context),
          right: smallButtonPadding(context),
          top: 2*smallButtonPadding(context)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$instruction",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size16Text(context)
              )
          ),
          Text("$value",
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: size16Text(context),
                  fontWeight: FontWeight.bold
              ))
        ],
      ),
    )
    ]
  );
}

Widget finalDisplaySecondary(BuildContext context, var text1, var text2, var text3) {

  return Padding(
    padding: EdgeInsets.only(
        left: smallButtonPadding(context),
        right: smallButtonPadding(context),
        top: smallButtonPadding(context)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("$text1",
        textAlign: TextAlign.end),
        Text("$text2",
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.end
        ),
        Text("$text3",
            textAlign: TextAlign.end)
      ],
    ),
  );

}

Widget finalDisplayFormula(BuildContext context, var formula) {

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Formula: ",
          style: TextStyle(
              fontSize: size16Text(context)
          )
      ),
      Container(
        child:
          Text("$formula",
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: size16Text(context),
                  decoration: TextDecoration.underline
              )
          ),
      )
    ],
  );

}
Widget finalDisplayEmpty(){
  return SizedBox(height:5);

}

Widget finalDisplayBold(BuildContext context,var instruction, var text1, var text2, var text3) {

  return Padding(
    padding: EdgeInsets.only(
        left: smallButtonPadding(context),
        right: smallButtonPadding(context),
        top: smallButtonPadding(context)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$instruction",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size16Text(context)
          )
      ),
        Row(
          children: <Widget>[
            Text("$text1",
                style: TextStyle(
                fontSize: size16Text(context)
            )),
            Text("$text2",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size16Text(context)
                )
            ),
            Text("$text3",
                style: TextStyle(
                fontSize: size16Text(context)
            )),
          ],
        )

      ],
    ),
  );

}
Widget finalDisplayCentre(BuildContext context, var text1, var text2, var text3 ){
  return Padding(
    padding: EdgeInsets.only(
        left: smallButtonPadding(context),
        right: smallButtonPadding(context),
        top: 2*smallButtonPadding(context)),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("$text1",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: size16Text(context)
              )),
          Text("$text2",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size16Text(context)
              )
          ),
          Text("$text3",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: size16Text(context)
              )),
        ],
      ),
    ),
  );
}

finalDisplayIndividual(
    BuildContext context,
    Widget function1,
    Widget function2,
    Widget function3,
    Widget function4,
    ) {

  final data = MediaQuery.of(context);

  return Column(
      children: <Widget>[
        Container(padding: EdgeInsets.all(10.0),
          decoration: whiteBoxDec(context),
          width: 0.8 * data.size.width,
          child:
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                function1,
                function2,
                function3
              ]
          ),
        ),
        SizedBox(height: 15),
        Container(
            padding: EdgeInsets.symmetric(
                horizontal: 3*smallButtonPadding(context),
                vertical: smallButtonPadding(context)),
            width: 0.8*data.size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mediumButtonRadius(context)),
                color: Color(0xfff2f2f2)
            ),
            child: function4
        ),
        SizedBox(height: 15)]
  );
}


Widget finalDisplaySteps(BuildContext context,var color,var drugName, var counter, var individuals) {

  final data = MediaQuery.of(context);
  var downArrow = Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: FaIcon(FontAwesomeIcons.arrowDown),
  );

  List<Widget> columnChildren = [];

  columnChildren.add(SizedBox(height: 15));
  columnChildren.add(
    Container(
        width: 0.8*data.size.width,
        decoration: lightBoxDec(context),
        child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: smallButtonPadding(context)),
              child: Text(
                  "$drugName",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size18Text(context),
                      color: color,
                      fontWeight: FontWeight.bold)
              ),
            )
        )
    )
  );

  for (var i = 0; i < counter; i++) {
    columnChildren.add(individuals[i]);
    columnChildren.add(downArrow);
  }

  columnChildren.removeLast();

  return Column(
    children: columnChildren
  );

}

finalDisplayIntubationEquip(
    var interventionColour,
    BuildContext context,
    var drugName,
    Widget function1,
    Widget function2,
    Widget function3,
    Widget function4,
    Widget function5,
    Widget function6,
    Widget function7
    ) {

  final data = MediaQuery.of(context);

  return Column(
      children: <Widget>[
        SizedBox(height: 15),
        Container(
            width: 0.8*data.size.width,
            decoration: lightBoxDec(context),
            child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: smallButtonPadding(context)),
                  child: Text(
                      "$drugName",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: size18Text(context),
                          color: interventionColour,
                          fontWeight: FontWeight.bold)
                  ),
                )
            )
        ),
        Container(padding: EdgeInsets.all(10.0),
          decoration: whiteBoxDec(context),
          width: 0.8 * data.size.width,
          child:
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                function1,
                function2,
                function3,
                function4
              ]
          ),
        ),
        SizedBox(height: 15),
        Container(
            padding: EdgeInsets.symmetric(
                horizontal: 3*smallButtonPadding(context),
                vertical: smallButtonPadding(context)),
            width: 0.8*data.size.width,
            decoration: lightBoxDec(context),
            child: function5
        ),
        SizedBox(height: 15),
        Container(
            padding: EdgeInsets.symmetric(
                horizontal: 3*smallButtonPadding(context),
                vertical: smallButtonPadding(context)),
            width: 0.8*data.size.width,
            decoration: lightBoxDec(context),
            child: function6
        ),
        SizedBox(height: 15),
        Container(
            padding: EdgeInsets.symmetric(
                horizontal: 3*smallButtonPadding(context),
                vertical: smallButtonPadding(context)),
            width: 0.8*data.size.width,
            decoration: lightBoxDec(context),
            child: function6
        ),
      SizedBox(height: 15),
      SizedBox(width: data.size.width*0.9, child: adrianDivider())]
  );
}

Widget finalDisplayTubeSize(BuildContext context, var instruction, var value) {

  return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$instruction",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size16Text(context)
                  )
              ),
              Text("$value",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: size16Text(context),
                      fontWeight: FontWeight.bold
                  ))
            ],
          ),
      ]
  );
}

iconRadius(context){
  final data = MediaQuery.of(context);
  return data.size.width/45;
}