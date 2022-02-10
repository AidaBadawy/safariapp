// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:travel_kenya/controller/place_controller.dart';
import 'package:travel_kenya/pages/events/events_detail.dart';
import 'package:travel_kenya/widgets/app_scaffold.dart';

class EventsPage extends GetView<PlaceController> {
  final placesController = Get.put(PlaceController());

  @override
  Widget build(BuildContext context) {
    List maindataList = placesController.places
        .where((element) => element.type.contains('Event'))
        .toList();
    return AppScaffold(
      body: GetBuilder(
        init: PlaceController(),
        builder: (value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Events',
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: AnimationLimiter(
                  child: ListView.builder(
                    itemCount: maindataList.length,
                    itemBuilder: (BuildContext context, int i) {
                      return AnimationConfiguration.staggeredList(
                        position: i,
                        duration: const Duration(milliseconds: 605),
                        child: SlideAnimation(
                          verticalOffset: 50,
                          child: FadeInAnimation(
                            child: ShowEvents(
                              image: maindataList[i].image,
                              title: maindataList[i].title,
                              description: maindataList[i].description,
                              date: maindataList[i].date,
                              month: maindataList[i].month,
                              fulldate: maindataList[i].fulldate,
                              time: maindataList[i].time,
                              listimages: maindataList[i].imageList,
                              category: maindataList[i].category,
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
      ),
    );
  }
}

class ShowEvents extends StatefulWidget {
  const ShowEvents({
    required this.image,
    required this.title,
    required this.description,
    required this.date,
    required this.month,
    required this.fulldate,
    required this.time,
    required this.listimages,
    required this.category,
  });

  final String image;
  final List category;
  final String title;
  final String description;
  final String date;
  final String month;
  final String fulldate;
  final String time;
  final List listimages;

  @override
  State<ShowEvents> createState() => _ShowEventsState();
}

class _ShowEventsState extends State<ShowEvents> {
  bool longPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => EventsDetail(),
            transition: Transition.rightToLeft,
            arguments: {
              'image': widget.image,
              // 'category': widget.title,
              'name': widget.title, //
              'dateText': widget.fulldate, //
              'timeText': widget.time, //
              'fulldescription': widget.description, //
              'listimages': widget.listimages, //
            });
      },
      // onLongPressCancel: () {
      // },
      // onLongPress: () {
      //   setState(() {
      //     longPressed = true;
      //   });
      //   print('long pressed by kakashi');
      // },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.brown.withOpacity(0.8),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                stops: [0.2, 0.8],
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),

              // color: Colors.green,
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              width: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.date,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(widget.month, style: TextStyle(fontSize: 16))
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  child: Wrap(
                      children: widget.category.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        e,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList()
                      // child: ListView.builder(
                      //     itemCount: widget.category.length,
                      //     scrollDirection: Axis.horizontal,
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return Text(
                      //         widget.category[index],
                      //         style: TextStyle(
                      //             color: Colors.white, fontWeight: FontWeight.bold),
                      //       );
                      //     }),
                      ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

// Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(children: [
//                     SizedBox(),
//                     Spacer(),
//                     Container(
//                         width: 55,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                             color: Colors.white),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(widget.date,
//                                     style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold)),
//                                 Text(widget.month, style: TextStyle(fontSize: 16))
//                               ]),
//                         ))
//                   ]),
//                   Spacer(),
//                   Text(
//                     widget.category,
//                     style: TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     widget.title,
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),