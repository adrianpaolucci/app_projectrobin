import 'package:app_search_bar/icons/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'allDrugData.dart';

class DrugSearch extends SearchDelegate<String> {

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
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //show result based on selection
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List allDrugSearch = [];
    for (var i = 0; i < allDrugs.length; i++) {
      for (var j = 0; j < allDrugs[i].length; j++) {
        allDrugSearch.add(allDrugs[i][j]);
      }
    }

    final suggestionList = query.isEmpty
        ? ["Ketamine", "Propofol"]
        : allDrugSearch.where((p) => p.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemBuilder: (context,index)
          =>ListTile(
            onLongPress: () {
              //make popup code for this section
            },
            leading: Icon(MyFlutterApp.syringe),
            title: RichText(
              text: TextSpan(
                text: suggestionList[index].substring(0,query.length),
                style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]
              )
                  )
          ),
      itemCount: suggestionList.length,
    );
  }
}