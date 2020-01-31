import 'package:app_search_bar/select_age.dart';
import 'package:flutter/material.dart';
import 'package:app_search_bar/dosing_main.dart';

class Home extends StatelessWidget {

  static const primaryColor = const Color(0xFFbfbfbf);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Pediatric Dosing",
          style: TextStyle(
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
        body: Material(
            color: Colors.white,
            child: Container(
                alignment: Alignment.center,
                child: Column(
                      children: <Widget>[
                        SizedBox(height: 30),
                        KilogramImage(),
                        SizedBox(height: 30),
                        Text(
                          "Enter Weight By Searching Here",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontSize: 22.0,
                              decoration: TextDecoration.underline
                              )
                        ),
                      IconButton(
                          icon: Icon(Icons.search),
                          iconSize: 50,
                          onPressed: () {
                        showSearch(context: context, delegate: WeightSearch());
                      }),
                      SizedBox(
                          height: 30),
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 500,
                        color: Color(0xfff2f2f2),
                      ),
                     Container(
                          alignment: Alignment.topCenter,
                          height: 70,
                          width: 500,
                          color: Color(0xfff2f2f2),
                          child: Text(
                            "OR",
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontSize: 28.0),
                          )
                      ),
                      CalendarImage(),
                      Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: 500,
                        color: Color(0xfff2f2f2),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return SelectAge();
                            }
                            )
                            );
                          },
                          child: Text(
                          "Enter Age",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontSize: 28.0,
                              decoration: TextDecoration.underline),
                        ),
                        )
                      )
                    ]
                )
            )
            )
    );
  }
}

var weight = 0.0;

class WeightSearch extends SearchDelegate<String>{
  final allWeights = [2,2.5,3,3.5,4,4.5,5,5.5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,22,24,26,28,30,35,40,45,50,55,60,65,70,75,80];

  final recentWeights = ["Closest weights will appear here"];

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for app bar
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = "";
      }
      )];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: transitionAnimation,
        ),
        onPressed: (){
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show result based on selection
    return ListView(
      children: <Widget>[
        ListTile(title: Text("You've gone too")),
        ListTile(title: Text("far!!!")),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
/*
    var index = 0;
      if (allWeights.contains(double.tryParse(query)) == true) {
        index = allWeights.indexOf(double.tryParse(query)); }  //giving true results based on correct input of actual weight}

      else if (allWeights.contains(double.tryParse(query)) == false) {
        index =
        0; }//defaulting to index of 0 if the input is not a value from all weights


      if (index == 0) {
        index =
        1; }//defaulting to index of 0 if the value inputted is invalid or 2kg (since it is first on the list)

      else if (index == allWeights.length - 1) {
        index = allWeights.length - 2; }//defaulting to the second last index if the index is the last (for 80kg) for clarity (there is no value to show after 80kg)

   */
var diff = 80.0;
var i = 0;



  if ((double.tryParse(query) != null)) {
    while (diff > 0) {
      i++;
      diff = double.parse(query) - allWeights[i];
  }
}

    final suggestionList = query.isEmpty
        ? recentWeights
        : [allWeights[i-1].toString(),allWeights[i].toString()];

    /*final suggestionList = query.isEmpty
        ? recentWeights
        : [value1,value2];
*/
    return ListView.builder(itemBuilder: (context,index)
    =>ListTile(
      leading: Icon(Icons.person),
      title: Text(suggestionList[index]),
      onTap: () {
        weight = double.tryParse(suggestionList[index]);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DosingMain();
        }
        )
        );
      },
    ),
      itemCount: suggestionList.length,
    );
  }
}

class KilogramImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/kg_icon.png');
    Image image = Image(image: assetImage);
    return Container(child: image,);
  }
}

class CalendarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/calendar_icon.png');
    Image image = Image(image: assetImage);
    return Container(alignment: Alignment.center,
        width: 500,
        height: 80,
        color: Color(0xfff2f2f2),
        child: image);
  }
}
