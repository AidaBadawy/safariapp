// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_kenya/controller/place_controller.dart';
import 'package:travel_kenya/pages/events/events_detail.dart';
import 'package:travel_kenya/pages/explore/explore_detail.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final placesController = Get.put(PlaceController());

  List list = [];
  //List newList = [];
  List _filters = [];
  List _filtersType = [];
  List _lastList = [];

  @override
  void initState() {
    super.initState();
    getSharedPrefsData();
    _lastList = [];
  }

  getSharedPrefsData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _filters = prefs.getStringList('category') ?? [];
      _filtersType = prefs.getStringList('type') ?? [];
      List typeFilter = _filtersType.map((e) => e).toList();
      List categoryFilter = _filters.map((e) => e).toList();

      list = placesController.places
          .where((e) => e.location
              .toLowerCase()
              .contains(Get.arguments['title'].toString().toLowerCase()))
          .toList();
      if (_filters.isEmpty && _filtersType.isEmpty) {
        setState(() {
          _lastList = list;
        });
      } else {
        for (var i in typeFilter) {
          for (var item in list) {
            if (item.type.contains(i)) {
              setState(() {
                _lastList.add(item);
              });
            }
          }
        }
        for (var i in categoryFilter) {
          for (var item in list) {
            if (item.category.contains(i)) {
              setState(() {
                _lastList.add(item);
              });
            }
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(Get.arguments['title'] ?? 'not available'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _filters.isEmpty && _filtersType.isEmpty
                ? Container()
                : Container(
                    height: 70,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Wrap(
                            children: _filters
                                .map((title) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InputChip(
                                        label: Text(title),
                                        onDeleted: () {
                                          setState(() {
                                            if (_filtersType.isEmpty) {
                                              _filters.removeWhere((element) =>
                                                  element.contains(title));
                                              _lastList.removeWhere((element) =>
                                                  element.category
                                                      .contains(title));
                                            } else {
                                              _lastList.removeWhere((element) =>
                                                  element.category
                                                      .contains(title));
                                              _filters.removeWhere((element) =>
                                                  element.contains(title));
                                              List typeFilter = _filtersType
                                                  .map((e) => e)
                                                  .toList();

                                              for (var i in typeFilter) {
                                                for (var item in list) {
                                                  if (item.type.contains(i)) {
                                                    setState(() {
                                                      _lastList.add(item);
                                                    });
                                                  }
                                                }
                                              }
                                            }
                                            if (_filters.length > 1) {
                                              List filter = _filters
                                                  .map((e) => e)
                                                  .toList();

                                              for (var i in filter) {
                                                for (var item in list) {
                                                  if (item.category
                                                      .contains(i)) {
                                                    setState(() {
                                                      _lastList.add(item);
                                                    });
                                                  }
                                                }
                                              }
                                            }
                                            // if (_lastList.isEmpty &&
                                            //     _filters.length > 1) {
                                            //   setState(() {
                                            //     _lastList = [];
                                            //   });
                                            // }
                                            else if (_lastList.isEmpty &&
                                                _filters.isEmpty) {
                                              _lastList = list;
                                            }
                                          });
                                        },
                                      ),
                                    ))
                                .toList()),
                        Wrap(
                            children: _filtersType
                                .map((title) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InputChip(
                                        backgroundColor: Colors.brown.shade300,
                                        label: Text(title),
                                        onDeleted: () {
                                          setState(() {
                                            if (_filters.isEmpty) {
                                              _filtersType.removeWhere(
                                                  (element) =>
                                                      element.contains(title));
                                              _lastList.removeWhere((element) =>
                                                  element.type.contains(title));
                                            } else {
                                              _lastList.removeWhere((element) =>
                                                  element.type.contains(title));
                                              _filtersType.removeWhere(
                                                  (element) =>
                                                      element.contains(title));
                                              List categoryFilter = _filters
                                                  .map((e) => e)
                                                  .toList();

                                              for (var i in categoryFilter) {
                                                for (var item in list) {
                                                  if (item.category
                                                      .contains(i)) {
                                                    setState(() {
                                                      _lastList.add(item);
                                                    });
                                                  }
                                                }
                                              }
                                            }

                                            if (_lastList.isEmpty) {
                                              _lastList = list;
                                            }
                                          });
                                        },
                                      ),
                                    ))
                                .toList()),
                      ],
                    ),
                  ),
            Expanded(
              child: _lastList.isEmpty
                  ? Center(
                      child: Text('No data available',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    )
                  : AnimationLimiter(
                      child: ListView.builder(
                        itemCount: _lastList.toSet().length,
                        itemBuilder: (BuildContext context, int i) {
                          return AnimationConfiguration.staggeredList(
                            position: i,
                            duration: const Duration(milliseconds: 605),
                            child: SlideAnimation(
                              horizontalOffset:
                                  MediaQuery.of(context).size.width / 2,
                              child: FadeInAnimation(
                                child: ShowSearch(
                                  title: _lastList[i].title,
                                  image: _lastList[i].image,
                                  description: _lastList[i].description,
                                  type: _lastList[i].type,
                                  images: _lastList[i].imageList,
                                  fulldate: _lastList[i].fulldate ?? '00 - 00',
                                  time: _lastList[i].time ?? '0 - 0',
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterData {
  final String title;

  FilterData(this.title);
}

class ShowSearch extends StatelessWidget {
  const ShowSearch({
    required this.image,
    required this.title,
    required this.description,
    required this.images,
    required this.type,
    required this.fulldate,
    required this.time,
  });

  final String image;
  final String title;
  final String description;
  final List images;
  final String type;
  final String fulldate;
  final String time;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (type == 'Explore') {
          Get.to(
            () => ExploreDetails(),
            transition: Transition.fadeIn,
            arguments: {
              'image': image,
              'title': title,
              'description': description,
              'imagelist': images,
            },
          );
        } else {
          Get.to(() => EventsDetail(),
              transition: Transition.rightToLeft,
              arguments: {
                'image': image,
                // 'category': widget.title,
                'name': title, //
                'dateText': fulldate, //
                'timeText': time, //
                'fulldescription': description, //
                'listimages': images, //
              });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
                height: 130,
                child: Row(
                  children: [
                    Container(
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        // color: Colors.green,
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text(description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(height: 10),
            Row(
              children: [
                Container(width: 130),
                SizedBox(width: 12),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(type, style: TextStyle(color: Colors.white)),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward_ios,
                          color: Colors.white, size: 14)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
