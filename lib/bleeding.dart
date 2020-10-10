import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'interventionMainScreen.dart';
import 'allDrugData.dart';
import 'all_sizings.dart';
import 'finalDisplay.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final intIndex9 = 9;

class Bleeding extends StatefulWidget {
//this code just creates a stateful widget (a page which isn't static)
  @override
  BleedingState createState() => BleedingState();
}

class BleedingState extends State<Bleeding> {
  @override
  Widget build(BuildContext context) {


    final data = MediaQuery.of(context);

    //function that changes all drugs' booleans to 'false' and
    //removes the badge on the navigation bar

    clearAll() {
      for (var i = 0; i < allDrugs.length; i++) {
        for (var j = 0; j < allDrugs[i].length; j++) {
          setState(() {
            allDrugBooleans[i][j] = false;
            items = badger.removeBadge(items, 1);
          });
        }
      }
      boolCount = 0;
    }

    //this defines the clear icon that's located on the navigation bar with functionality

    var clearAllIcon = BottomNavigationBarItem(
        icon: IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              clearAll();
            }),
        title: Text("Clear All"));

    //this defines the confirm button on the nav bar with functionality

    var confirmIcon = BottomNavigationBarItem(
        icon: IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return FinalDisplay();
              })
              );
            }),
        title: Text("Confirm"));

    //items is how the nav bar icons are defined
    //im just assigning the values in the variable to the nav bar icons I've defined above

    items[0] = clearAllIcon;
    items[2] = confirmIcon;


    List<Widget> bleedingCells = [];

    for (var i = 0; i < allDrugs[intIndex9].length; i++) {
      Widget iOSswitch(var intIndex9) {
        return Padding(
          padding: EdgeInsets.only(
              right: data.size.width * 0.03),
          child: Switch(
              activeColor: Color(0xff39e600),
              value: allDrugBooleans[intIndex9][i],
              onChanged: (bool newValue) {
                setState(() {
                  if (newValue == true) {
                    boolCount += 1;
                  }
                  else {
                    boolCount -= 1;
                  }
                  items = badger.setBadge(items, "$boolCount", 1);
                  allDrugBooleans[intIndex9][i] = newValue;
                  if (boolCount == 0) {
                    clearAll();
                  }
                });
              }
          ),
        );
      }


      var column = returnCell(context, intIndex9, i, iOSswitch(intIndex9));

      bleedingCells.add(column);
    }





    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          items: items,
        ),
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context, CupertinoPageRoute(builder: (context) {
                return InterventionMain();
              }
              )
              );
            },
          ),
          title: Padding(
            padding: EdgeInsets.only(left: 70),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "PediDosED",
                    style: TextStyle(color: Colors.black),
                  ),
                  IconButton(
                      icon: FaIcon(
                          FontAwesomeIcons.home
                      ),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.push(context, SlideRightRoute(page: Home2()));
                      }
                  )
                ]
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(child: Material(
            color: Color(0xfff2f2f2),
            child: Theme(
                data: ThemeData(
                    backgroundColor: Color(0xfff2f2f2)),
                child: Column(
                    children: <Widget>[
                      topInterventionTitle(context, weight, specificColor, int),
                      Material(
                        color: Color(0xfff2f2f2),
                        child: Column(children: <Widget>[

                          Theme(
                            data: ThemeData(accentColor: specificColor),
                            child: ExpansionTile(
                                backgroundColor: Color(0xffffffff),
                                initiallyExpanded: true,
                                title: Text("General Drugs",textAlign: TextAlign.center),
                                children: bleedingCells
                            ),
                          ),

                          Container(
                            height: data.size.height*0.05,
                            color: Color(0xfff2f2f2),
                          ),

                        ],
                        ),
                      ),
                    ])
            )
        )
        )
    );
  }
}
