// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'all_sizings.dart';
import 'finalDisplay.dart';
import 'homeScreen.dart';
import 'icons/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'interventionMainScreen.dart';
import 'allDrugData.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    @required this.controller,
    @required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 8,
        ),
        child: Row(
          children: [
            const Icon(
              CupertinoIcons.search,
              color: Colors.black,
            ),
            Expanded(
              child: CupertinoTextField(
                controller: controller,
                focusNode: focusNode,
              ),
            ),
            GestureDetector(
              onTap: controller.clear,
              child: const Icon(
                CupertinoIcons.clear_thick_circled,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() {
    return _SearchTabState();
  }
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController _controller;
  FocusNode _focusNode;
  String _terms = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onTextChanged);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SearchBar(
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    var count = 0;

    for (var i = 0; i < allDrugs.length; i++) {
      for (var j = 0; j < allDrugs[i].length; j++) {
        allDrugSearch.add("${allDrugs[i][j]} - ${searchInterventions[i]}");
        if (allDrugSearch[count].toLowerCase().contains(_terms.toLowerCase())) {
          searchBools.add([i, j]);
        }
        count++;
      }
    }

    final suggestionList = _terms.isEmpty
        ? suggestionArray
        : allDrugSearch.where((p) => p.toLowerCase().contains(_terms.toLowerCase())).toList();

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
      child: SafeArea(
        child: Column(
          children: [
            _buildSearchBox(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => 
                    Material(
                      child: ListTile(
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
                              text: suggestionList[index].substring(0,suggestionList[index].toLowerCase().indexOf("${_terms.toLowerCase()}")),
                              style: TextStyle(
                                  color: Colors.grey),
                              children: [
                                TextSpan(
                                    text: suggestionList[index].substring(suggestionList[index].toLowerCase().indexOf("${_terms.toLowerCase()}"),suggestionList[index].toLowerCase().indexOf("${_terms.toLowerCase()}")+ _terms.length),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                                TextSpan(
                                    text: suggestionList[index].substring(suggestionList[index].toLowerCase().indexOf("${_terms.toLowerCase()}") + _terms.length),
                                    style: TextStyle(color: Colors.grey))
                              ]
                          )
                      )
                ),
                    ),
                itemCount: suggestionList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}