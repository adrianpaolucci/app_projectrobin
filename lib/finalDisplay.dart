import 'package:flutter/material.dart';
import 'package:app_search_bar/home2.dart';
import 'package:app_search_bar/data.dart';

class FinalDisplay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FinalDisplayState();
  }
}

class FinalDisplayState extends State<FinalDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Selections for $weight kg",
          style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white
      ),
      body: SingleChildScrollView(child: Center(child:
      Column(children: <Widget>[
        Divider(thickness: 1.0, color: Colors.black),
        ExpansionTile(title: Text("Anaphylaxis")),
        Divider(thickness: 1.0, color: Colors.black),
        SizedBox(height: 10),
        Divider(thickness: 1.0, color: Colors.black),
        ExpansionTile(
            title: Text("Intubation"),
            children: intubationFinal(context),
          ),
        Divider(thickness: 1.0, color: Colors.black),
          ]
      ),
      )
      )
    );
  }
}

intubationFinal(BuildContext context) {
  final data = MediaQuery.of(context);
  var inductionWidgets = [ketamineDisplay(context),propofolDisplay(context),thiopentoneDisplay(context),fentanylBolusDisplay(context),midazolamDisplay(context)];
  var paralyticWidgets = [suxamethoniumDisplay(context),rocuroniumDisplay(context),vecuroniumDisplay(context),atracuriumDisplay(context)];
  List<Widget>intubationList = intubationEquipmentInfo(context);
  for (var i=0; i < inductionAgents.length; i++) {
    if (inductionBoolean[i] == true) {
      intubationList.add(inductionWidgets[i]);
      intubationList.add(SizedBox(width: data.size.width*0.9, child: Divider(thickness: 0.5, color: Colors.black)));
    }
  }
  for (var i = 0; i < paralyticAgents.length; i++) {
    if (paralyticBoolean[i] == true) {
      intubationList.add(paralyticWidgets[i]);
      intubationList.add(SizedBox(width: data.size.width*0.9, child: Divider(thickness: 0.5, color: Colors.black)));
    }
  }
  if (intubationList.isNotEmpty) {
    intubationList.removeLast();
  }
  return intubationList;
}


ketamineDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = ketamineData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Ketamine", style: TextStyle(fontSize: 18.0, color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(border: Border.all(),color: Color(0xffa6a6a6),),
      margin: EdgeInsets.all(5),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Dilute", style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold)),
            Text("${currentData[1]} mg in ${currentData[3]} mL"),
            Text("OR"),
            Text("${currentData[2]} mg in ${currentData[4]} mL"),
          ]
      ),
    ),
    Text("Administer ${currentData[3]} - ${currentData[4]} mL of diluted solution",
          style: TextStyle(decoration: TextDecoration.underline)),
    SizedBox(height: 15)]);
  return popup;
}

propofolDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = propofolData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Propofol", style: TextStyle(fontSize: 18.0, color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(),color: Color(0xffa6a6a6),),
      width: 0.8 * data.size.width,
      child:
      Column(children: <Widget>[
            Text("${currentData[1]} mg in ${currentData[2]} mL"),
            Text("Undiluted", style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text("Risk CVS"),Text("\u2193", style: TextStyle(fontSize: 22))])
      ]),
    ),
    Text("Administer ${currentData[2]} mL of undiluted solution",textAlign: TextAlign.center,
  style: TextStyle(decoration: TextDecoration.underline)),
    SizedBox(height: 15)]);
  return popup;
}

thiopentoneDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = thiopentoneData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Thiopentone", style: TextStyle(fontSize: 18.0, color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(),color: Color(0xffa6a6a6),),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Reconstitute", style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold)),
            Text("${currentData[1]} mg in ${currentData[3]} mL"),
            Text("OR"),
            Text("${currentData[2]} mg in ${currentData[4]} mL"),
            SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text("Risk CVS"),Text("\u2193", style: TextStyle(fontSize: 22))])
          ]
      ),
    ),
    Text( "Administer ${currentData[3]} - ${currentData[4]} mL of diluted solution",
          style: TextStyle(decoration: TextDecoration.underline)),
    SizedBox(height: 15)]);
  return popup;
}

fentanylBolusDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = fentanylBolusData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Fentanyl (Bolus)", style: TextStyle(fontSize: 18.0, color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(),color: Color(0xffa6a6a6),),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Dilute", style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold)),
            Text("${currentData[1]} \u03bcg in ${currentData[3]} mL"),
            Text("OR"),
            Text("${currentData[2]} \u03bcg in ${currentData[4]} mL"),
          ]
      ),
    ),
    Text.rich(TextSpan(text: "", children:
    <TextSpan>[
      TextSpan(text: "Administer ${currentData[3]} - ${currentData[4]} mL of diluted solution",
          style: TextStyle(decoration: TextDecoration.underline)),
      TextSpan(text: "")
    ])),
    SizedBox(height: 15)]);
  return popup;
}

midazolamDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = midazolamData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Midazolam", style: TextStyle(fontSize: 18.0, color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(),color: Color(0xffa6a6a6),),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${currentData[3]}", style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold)),
            Text("${currentData[1]} mg in ${currentData[4]} mL"),
            Text("OR"),
            Text("${currentData[2]} mg in ${currentData[5]} mL"),
          ]
      ),
    ),
    Text.rich(TextSpan(text: "", children:
    <TextSpan>[
      TextSpan(text: "Administer ${currentData[4]} - ${currentData[5]} mL of diluted solution",
          style: TextStyle(decoration: TextDecoration.underline)),
      TextSpan(text: "")
    ])),
    SizedBox(height: 15)]);
  return popup;
}

suxamethoniumDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = suxamethoniumData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Suxamethonium", style: TextStyle(fontSize: 18.0, color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(),color: Color(0xffa6a6a6),),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Dilute", style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold)),
            Text("${currentData[2]} mg in ${currentData[3]} mL")
          ]
      ),
    ),
    Text.rich(TextSpan(text: "", children:
    <TextSpan>[
      TextSpan(text: "Administer ${currentData[3]} mL of diluted solution",
          style: TextStyle(decoration: TextDecoration.underline)),
      TextSpan(text: "")
    ])),
    SizedBox(height: 15)]);
  return popup;
}

rocuroniumDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = rocuroniumData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Rocuronium", style: TextStyle(fontSize: 18.0, color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(),color: Color(0xffa6a6a6),),
      width: 0.8 * data.size.width,
      child:
      Column(children: <Widget>[
        Text("${currentData[1]} mg in ${currentData[2]} mL"),
        Text("Undiluted", style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold))
      ]),
    ),
    Text("Administer ${currentData[2]} mL of undiluted solution",textAlign: TextAlign.center,
        style: TextStyle(decoration: TextDecoration.underline)),
    SizedBox(height: 15)]);
  return popup;
}

vecuroniumDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = vecuroniumData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Vecuronium", style: TextStyle(fontSize: 18.0, color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(),color: Color(0xffa6a6a6),),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Reconstitute", style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold)),
            Text("${currentData[1]} mg in ${currentData[2]} mL"),
            SizedBox(height: 5)
          ]
      ),
    ),
    Text( "Administer ${currentData[2]} mL of diluted solution",
        style: TextStyle(decoration: TextDecoration.underline)),
    SizedBox(height: 15)]);
  return popup;
}

atracuriumDisplay(BuildContext context) {
  final data = MediaQuery.of(context);
  var currentData = atracuriumData[weightIndex];

  var popup = Column(children: <Widget>[
    SizedBox(height: 15),
    Text("Atracurium", style: TextStyle(fontSize: 18.0, color: Color(0xff000000), fontWeight: FontWeight.bold)),
    Container(padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(),color: Color(0xffa6a6a6),),
      width: 0.8 * data.size.width,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${currentData[2]}", style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold)),
            Text("${currentData[1]} mg in ${currentData[3]} mL")
          ]
      ),
    ),

      Text("Administer ${currentData[3]} mL of diluted solution",
          style: TextStyle(decoration: TextDecoration.underline)),
    SizedBox(height: 15)]);
  return popup;
}

intubationEquipmentInfo(BuildContext context) {
  final data = MediaQuery.of(context);

  firstTextSpan(firstString, secondString) {
    var textBox = Text.rich(
        TextSpan(
            text: "",
            children: <TextSpan>[
              TextSpan(text: firstString,style: TextStyle(fontSize: 16, decoration: TextDecoration.underline)),
              TextSpan(text: secondString, style: TextStyle(fontSize: 16))
            ]
        )
    );
    return textBox;
  }

  etTubeDisplayBox(tubeType,tubeSize) {
    var box = Container(alignment: Alignment.centerLeft, decoration: BoxDecoration(border: Border.all(), color: Color(0xffa6a6a6)),width: 0.95*data.size.width, height: 25,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget> [
          Text(tubeType,style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),),
          Text(tubeSize, style: TextStyle(fontWeight: FontWeight.bold))
        ]));
   return box;
  }


  var box = [
        Text("General Information", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        SizedBox(height: 10),
        firstTextSpan("Depth",
            ":  " + ettDepthOral[weightIndex][1].toString() + " cm to lip, " +
                ettDepthNasal[weightIndex][1].toString() + " cm to nose"),
        SizedBox(height: 10),
        firstTextSpan("LMA Size", ":  " + lmaSize[weightIndex][1].toString()),
        SizedBox(height: 10),
        firstTextSpan("Laryngoscope", ":  " + layngoscope[weightIndex][1].toString()),
        SizedBox(height: 10),
        firstTextSpan("Suction", ":  " + suction[weightIndex][1].toString() + " Fr"),
        SizedBox(height: 20),
        Text("ET Tubes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        etTubeDisplayBox("Uncuffed", ettUncuffedSize[weightIndex][1].toString()),
        SizedBox(height: 15),
        etTubeDisplayBox("Microcuff", ettMicroCuffSize[weightIndex][1].toString()),
        SizedBox(height: 15),
        etTubeDisplayBox("Cuffed", ettCuffedSize[weightIndex][1].toString())
  ];
  box.add(SizedBox(width: data.size.width*0.9, child: Divider(thickness: 0.5, color: Colors.black)));

  return box;
}

