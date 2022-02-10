// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_kenya/pages/home/horizontal_places_list.dart';
import 'package:travel_kenya/widgets/app_scaffold.dart';
import 'package:travel_kenya/widgets/autocomplete_search.dart';
import 'package:travel_kenya/widgets/circle_tab_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    return GestureDetector(
      onTap: () {
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: AppScaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text('Safari Travels',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(height: 5),
                Text('Choose your trip', style: TextStyle(color: Colors.white)),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AutoCompleteSearch(),
                    ),
                    SizedBox(width: 5),
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: IconButton(
                          onPressed: () {
                            Get.bottomSheet(
                              BottomSheet(),
                              //barrierColor: Colors.red[50],
                              isDismissible: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                              enableDrag: true,
                            );
                          },
                          icon: Icon(Icons.tune),
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40),
                DefaultTabController(
                    initialIndex: 0,
                    length: 3,
                    child: Column(
                      children: [
                        TabBar(
                          onTap: (index) async {
                            String header = 'Popular';
                            switch (index) {
                              case 0:
                                header = 'Popular';
                                break;
                              case 1:
                                header = 'Most viewed';
                                break;
                              case 2:
                                header = 'Recommended';

                                break;
                            }
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setString('header', header);
                            currentFocus.unfocus();
                          },
                          isScrollable: true,
                          indicator: CircleTabIndicator(
                              color: Colors.white, radius: 3),
                          tabs: [
                            Tab(
                                child: Text('Popular',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ))),
                            Tab(
                                child: Text('Most viewed',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ))),
                            Tab(
                                child: Text('Recommended',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ))),
                          ],
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                            height: 400,
                            child: TabBarView(
                              children: [
                                HorizontalList(),
                                HorizontalList(),
                                HorizontalList(),
                              ],
                            ))
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomSheet extends StatefulWidget {
  const BottomSheet({Key? key}) : super(key: key);

  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  late List<String> _filters = [];
  late List<String> _filtersType = [];
  List _categories = [];
  List _type = [];

  @override
  void initState() {
    super.initState();
    getSharedPrefsData();
    _filters = [];
    _filtersType = [];
    _categories = [
      CategoryData('Culture'),
      CategoryData('Wildlife'),
      CategoryData('Adventure'),
      CategoryData('Scenery'),
      CategoryData('Beaches'),
    ];
    _type = [
      CategoryData('Event'),
      CategoryData('Explore'),
    ];
  }

  getSharedPrefsData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _filters = prefs.getStringList('category') ?? [];
      _filtersType = prefs.getStringList('type') ?? [];
    });
    //  _filters = json.decode(listString);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(45),
            topLeft: Radius.circular(45),
          ),
          color: Colors.white,
        ),
        height: 380,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Text('Search Filter',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown))),
              SizedBox(height: 10),
              Text('Category', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Wrap(
                children: categoryPosition.toList(),
              ),
              SizedBox(height: 10),
              Text('Type', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Wrap(
                children: typePosition.toList(),
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          // String stringlist = json.encode(_filters);
                          await prefs.setStringList('category', _filters);
                          await prefs.setStringList('type', _filtersType);
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Apply', style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.brown),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () async {
                          if (_filters.isEmpty && _filtersType.isEmpty) {
                            Get.back();
                          } else {
                            setState(() {
                              _filters = [];
                              _filtersType = [];
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                              _filters.isEmpty && _filtersType.isEmpty
                                  ? 'Cancel'
                                  : 'Clear',
                              style:
                                  TextStyle(color: Colors.brown, fontSize: 20)),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Iterable<Widget> get categoryPosition sync* {
    for (CategoryData category in _categories) {
      yield Padding(
        padding: EdgeInsets.all(5),
        child: FilterChip(
          checkmarkColor: Colors.white,
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.brown),
          selectedColor: Colors.brown,
          label: Text(category.title),
          labelStyle: TextStyle(
              color: _filters.contains(category.title)
                  ? Colors.white
                  : Colors.black),
          selected: _filters.contains(category.title),
          onSelected: (selected) {
            if (selected) {
              setState(() {
                _filters.add(category.title);
              });
            } else {
              setState(() {
                _filters.removeWhere((element) => element == category.title);
              });
            }
          },
        ),
      );
    }
  }

  Iterable<Widget> get typePosition sync* {
    for (CategoryData category in _type) {
      yield Padding(
        padding: EdgeInsets.all(5),
        child: FilterChip(
          checkmarkColor: Colors.white,
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.brown),
          selectedColor: Colors.brown,
          label: Text(category.title),
          labelStyle: TextStyle(
              color: _filtersType.contains(category.title)
                  ? Colors.white
                  : Colors.black),
          selected: _filtersType.contains(category.title),
          onSelected: (selected) {
            if (selected) {
              setState(() {
                _filtersType.add(category.title);
              });
            } else {
              setState(() {
                _filtersType
                    .removeWhere((element) => element == category.title);
              });
            }
          },
        ),
      );
    }
  }

  savetoPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringlist = json.encode(_filters);
    await prefs.setString('stringList', stringlist);
  }
}

class CategoryData {
  final String title;

  CategoryData(this.title);
}
