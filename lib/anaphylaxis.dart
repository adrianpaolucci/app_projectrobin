import 'package:flutter/material.dart';
import 'package:app_search_bar/home.dart';

class Anaphylaxis extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "PediDosED",
          style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: Material(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("$weight"),
                Text("Anaphylaxis",style: TextStyle(color: Colors.red)),
                Container(color: Color(0xfff2f2f2),child: Text("Back to Case Selection"),)
          ],
        )
      ],
      ),
    )
    );
  }
}