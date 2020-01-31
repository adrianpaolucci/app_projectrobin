import 'package:flutter/material.dart';
import 'package:app_search_bar/home.dart';
import 'package:app_search_bar/dosing_main.dart';

class SelectAge extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
            "Select Age",
        style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: Material(
        child: getAgeList(context),
      ),
    );
  }
}

Widget getAgeList(BuildContext context) {

  var listView = ListView(
    children: <Widget>[
      ListTile(title: Text(
          "Birth / 3.5kg",
          style: TextStyle(
              decoration: TextDecoration.underline),
        textAlign: TextAlign.center,
      ),
        onTap: () {
        weight = 3.5;
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DosingMain();
        }
        )
        );
        },
      ),
      ListTile(title: Text(
        "1 Month / 4.5kg",
        style: TextStyle(
            decoration: TextDecoration.underline),
        textAlign: TextAlign.center,
      ),
        onTap: () {
          weight = 4.5;
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DosingMain();
          }
          )
          );
        },
      ),
      ListTile(title: Text(
        "3 Month / 6kg",
        style: TextStyle(
            decoration: TextDecoration.underline,),
        textAlign: TextAlign.center,
      ),
        onTap: () {
          weight = 6;
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DosingMain();
          }
          )
          );
        },
      ),
      ListTile(title: Text(
        "6 Month / 7-8kg",
        style: TextStyle(
            decoration: TextDecoration.underline),
        textAlign: TextAlign.center,
      ),
        onTap: () {
          weight = 7;
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DosingMain();
          }
          )
          );
        },
      ),ListTile(title: Text(
        "12 Month / 9-10kg",
        style: TextStyle(
            decoration: TextDecoration.underline),
        textAlign: TextAlign.center,
      ),
        onTap: () {
          weight = 9;
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DosingMain();
          }
          )
          );
        },
      ),
      ListTile(title: Text(
        "18 Month / 11kg",
        style: TextStyle(
            decoration: TextDecoration.underline),
        textAlign: TextAlign.center,
      ),
        onTap: () {
          weight = 11;
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DosingMain();
          }
          )
          );
        },
      ),
      ListTile(title: Text(
        "2 Years / 12kg",
        style: TextStyle(
            decoration: TextDecoration.underline),
        textAlign: TextAlign.center,
      ),
        onTap: () {
          weight = 12;
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DosingMain();
          }
          )
          );
        },
      ),
      ListTile(title: Text(
        "3 Years / 14kg",
        style: TextStyle(
            decoration: TextDecoration.underline),
        textAlign: TextAlign.center,
      ),
        onTap: () {
          weight = 14;
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DosingMain();
          }
          )
          );
        },
      ),
    ],
  );
return listView;
}