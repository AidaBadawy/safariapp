// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_kenya/controller/category_controller.dart';
import 'package:travel_kenya/controller/place_controller.dart';
import 'package:travel_kenya/pages/explore/explore_page.dart';
import 'package:travel_kenya/widgets/circle_tab_indicator.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  final categoryController = Get.put(CategoryController());
  final placesController = Get.put(PlaceController());

  int index = 0;
  String headerText = 'Popular';
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    index = Get.arguments['index'] ?? 0;
    _controller = TabController(
        length: categoryController.categoriesCount,
        vsync: this,
        initialIndex: index);
    _controller.addListener(() {
      setState(() {
        index = _controller.index;
      });
    });
    getSharedPrefsData();
  }

  getSharedPrefsData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      headerText = prefs.getString('header') ?? 'Popular';
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String categoryData =
        categoryController.categories[index].title.toLowerCase();
    List mainList = placesController.places
        .where((element) =>
            element.category.toString().toLowerCase().contains(categoryData))
        .toList();
    mainList
        .sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));

    return Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(headerText),
          bottom: TabBar(
            controller: _controller,
            isScrollable: true,
            indicator: CircleTabIndicator(color: Colors.white, radius: 3),
            tabs: categoryController.categories.map((e) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
                child: Text(
                  e.title,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        body: GetBuilder(
          init: PlaceController(),
          builder: (value) => TabBarView(
            controller: _controller,
            children: categoryController.categories.map((e) {
              return mainList.isEmpty
                  ? Center(
                      child: Text('No data available',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    )
                  : AnimationLimiter(
                      child: ListView.builder(
                        itemCount: mainList.length,
                        itemBuilder: (BuildContext context, int i) {
                          return AnimationConfiguration.staggeredList(
                            position: i,
                            duration: const Duration(milliseconds: 605),
                            child: SlideAnimation(
                              horizontalOffset:
                                  MediaQuery.of(context).size.width / 2,
                              child: FadeInAnimation(
                                child: ShowExplore(
                                  image: mainList[i].image,
                                  title: mainList[i].title,
                                  description: mainList[i].description,
                                  location: mainList[i].location,
                                  images: mainList[i].imageList,
                                  type: mainList[i].type,
                                  fulldate: mainList[i].fulldate ?? '00 - 00',
                                  time: mainList[i].time ?? '0 - 0',
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
            }).toList(),
          ),
        ));
  }
}
