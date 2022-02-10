// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:travel_kenya/controller/place_controller.dart';
import 'package:travel_kenya/pages/events/events_detail.dart';
import 'package:travel_kenya/pages/explore/explore_detail.dart';
import 'package:travel_kenya/widgets/app_scaffold.dart';

class ExplorePage extends GetView<PlaceController> {
  final placesController = Get.put(PlaceController());

  @override
  Widget build(BuildContext context) {
    List maindataList = placesController.places
        .where((element) => element.type == 'Explore')
        .toList();
    maindataList
        .sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));

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
                child: Text('Explore',
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
                          horizontalOffset:
                              MediaQuery.of(context).size.width / 2,
                          child: FadeInAnimation(
                            child: ShowExplore(
                              image: maindataList[i].image,
                              title: maindataList[i].title,
                              description: maindataList[i].description,
                              location: maindataList[i].location,
                              images: maindataList[i].imageList,
                              type: maindataList[i].type,
                              fulldate: maindataList[i].fulldate ?? '00 - 00',
                              time: maindataList[i].time ?? '0 - 0',
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

class ShowExplore extends StatelessWidget {
  const ShowExplore({
    required this.image,
    required this.title,
    required this.description,
    required this.location,
    required this.images,
    required this.type,
    required this.fulldate,
    required this.time,
  });

  final String image;
  final String title;
  final String description;
  final String location;
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
                      Text('Explore', style: TextStyle(color: Colors.white)),
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
