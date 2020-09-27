import 'package:app_search_bar/finalDisplay.dart';
import 'package:app_search_bar/icons/my_flutter_app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'allDrugData.dart';
import 'interventionMainScreen.dart';
import 'all_sizings.dart';
import 'homeScreen.dart';



class DrugSearch extends SearchDelegate<String> {

  var suggestionArray = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for app bar
    return [IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: transitionAnimation),
      onPressed: () {
            close(context, null);
            Navigator.push(context, SlideRightRoute(page: InterventionMain())
            );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //show result based on selection


    List allDrugSearch = [];
    List searchBools = [];

    var count = 0;

    for (var i = 0; i < allDrugs.length; i++) {
      for (var j = 0; j < allDrugs[i].length; j++) {
        allDrugSearch.add("${allDrugs[i][j]} - ${searchInterventions[i]}");
        if (allDrugSearch[count].toLowerCase().contains(query.toLowerCase())) {
          searchBools.add([i, j]);
        }
        count++;
      }
    }


    final suggestionList = query.isEmpty
        ? suggestionArray
        : allDrugSearch.where((p) => p.toLowerCase().contains(query.toLowerCase())).toList();

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return ListView.builder(
          itemBuilder: (context,index)
          =>ListTile(
              onTap: () {

                var i = searchBools[index][0];
                var j = searchBools[index][1];

                if ((weight < 6) && (i == 11)) {
                  croupErrorAlert(context, j);
                }
                else if ((weight < 10) && (i == 3) && (j == 1)) {
                  errorAlert(context, "Porpofol","less",10);
                }
                else if ((weight > 10) && (i == 0) && (j == 9)) {
                  errorAlert(context, "Pyridoxine","more",10);
                }
                else {
                  suggestionArray.add(suggestionList[index]);

                  setState(() {
                    boolCount += 1;
                    allDrugBooleans[i][j] = true;
                    items = badger.setBadge(items, "$boolCount", 1);
                  });

                  Navigator.push(
                      context, CupertinoPageRoute(builder: (context) {
                    return FinalDisplay();
                  }
                  )
                  );
                }
              },
              leading: Icon(MyFlutterApp.syringe),
              title: RichText(
                  text: TextSpan(
                      text: suggestionList[index].substring(0,suggestionList[index].toLowerCase().indexOf("${query.toLowerCase()}")),
                      style: TextStyle(
                          color: Colors.grey),
                      children: [
                        TextSpan(
                            text: suggestionList[index].substring(suggestionList[index].toLowerCase().indexOf("${query.toLowerCase()}"),suggestionList[index].toLowerCase().indexOf("${query.toLowerCase()}")+ query.length),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        TextSpan(
                            text: suggestionList[index].substring(suggestionList[index].toLowerCase().indexOf("${query.toLowerCase()}") + query.length),
                            style: TextStyle(color: Colors.grey))
                      ]
                  )
              )
          ),
          itemCount: suggestionList.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List searchInterventions = ["Seizures and Neurology","Asthma","Asthma","Intubation","Intubation","Electrolyte Abnormalities","Anaphylaxis and Arrithmyia","Resuscitation","Shock","Bleeding","Infection","Croup","Analgesia","Electrolyte Abnormalities","Antidotes"];

    List allDrugSearch = [];
    List searchBools = [];

    var count = 0;

    for (var i = 0; i < allDrugs.length; i++) {
      for (var j = 0; j < allDrugs[i].length; j++) {
        allDrugSearch.add("${allDrugs[i][j]} - ${searchInterventions[i]}");
        if (allDrugSearch[count].toLowerCase().contains(query.toLowerCase())) {
          searchBools.add([i, j]);
        }
        count++;
      }
    }


    final suggestionList = query.isEmpty
        ? suggestionArray
        : allDrugSearch.where((p) => p.toLowerCase().contains(query.toLowerCase())).toList();

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return ListView.builder(
          itemBuilder: (context,index)
          =>ListTile(
              onTap: () {

                var i = searchBools[index][0];
                var j = searchBools[index][1];

                if ((weight < 6) && (i == 11)) {
                  croupErrorAlert(context, j);
                }
                else if ((weight < 10) && (i == 3) && (j == 1)) {
                  errorAlert(context,"Propofol","less",10);
                }
                else if ((weight > 10) && (i == 0) && (j == 9)) {
                  errorAlert(context,"Pyridoxine","more",10);
                }
                else {
                  suggestionArray.add(suggestionList[index]);

                  setState(() {
                    boolCount += 1;
                    allDrugBooleans[i][j] = true;
                    items = badger.setBadge(items, "$boolCount", 1);
                  });

                  Navigator.push(
                      context, CupertinoPageRoute(builder: (context) {
                    return FinalDisplay();
                  }
                  )
                  );
                }
              },
              leading: Icon(MyFlutterApp.syringe),
              title: RichText(
                  text: TextSpan(
                      text: suggestionList[index].substring(0,suggestionList[index].toLowerCase().indexOf("${query.toLowerCase()}")),
                      style: TextStyle(
                          color: Colors.grey),
                      children: [
                        TextSpan(
                            text: suggestionList[index].substring(suggestionList[index].toLowerCase().indexOf("${query.toLowerCase()}"),suggestionList[index].toLowerCase().indexOf("${query.toLowerCase()}")+ query.length),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        TextSpan(
                            text: suggestionList[index].substring(suggestionList[index].toLowerCase().indexOf("${query.toLowerCase()}") + query.length),
                            style: TextStyle(color: Colors.grey))
                      ]
                  )
              )
          ),
          itemCount: suggestionList.length,
        );
      },
    );
  }
}

