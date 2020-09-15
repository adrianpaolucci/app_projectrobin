import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'interventionMainScreen.dart';
import 'allDrugData.dart';
import 'all_sizings.dart';
import 'finalDisplay.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

    var bleedingCells = ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: allDrugs[9].length,
        itemBuilder: (BuildContext context, var i) {
          return GestureDetector(
              child: Container(width: 9*data.size.width/10,height: 40,
                  margin: EdgeInsets.symmetric(vertical: 2.5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(mediumButtonRadius(context)),
                      color: getColor(i)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(allDrugs[9][i]),
                    ),
                    Switch(
                        activeColor: Color(0xff39e600),
                        value: allDrugBooleans[9][i],
                        onChanged: (bool newValue){
                          if (newValue == true) {
                            boolCount += 1;
                          }
                          else {
                            boolCount -= 1;
                          }
                          setState(() {
                            items = badger.setBadge(items, "$boolCount", 1);
                            allDrugBooleans[9][i] = newValue;
                          });
                          if (boolCount == 0) {
                            clearAll();
                          }
                        }),
                  ],
                  )
              ),
              onTap: () {
                if (allDrugBooleans[9][i] == false) {
                  boolCount += 1;
                }
                else {
                  boolCount -= 1;
                }
                setState(() {
                  allDrugBooleans[9][i] = !allDrugBooleans[9][i];
                  items = badger.setBadge(items, "$boolCount", 1);
                }
                );
                if (boolCount == 0) {
                  clearAll();
                }
              });
        });



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
          child: Column(
              children: <Widget>[
                topInterventionTitle(context, weight, specificColor, int),
                Column(children: <Widget>[
                  SizedBox(height: 10),
                  Divider(thickness: 1.0),
                  Theme(
                    data: ThemeData(accentColor: specificColor),
                    child: ExpansionTile(initiallyExpanded: true,
                      title: Text("General Drugs"),
                      children: <Widget>[GestureDetector(child: Text("Select Drug from below",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic))),
                        SizedBox(width: 9*data.size.width/10, child: bleedingCells)
                      ],
                    ),
                  ),
                  Divider(thickness: 1.0),
                ],
                ),
              ]
          ),
        ),
        )
    );

  }
}