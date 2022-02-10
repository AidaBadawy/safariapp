// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class EventsDetail extends StatelessWidget {
  EventsDetail({Key? key}) : super(key: key);

  List imageList = Get.arguments['listimages'];
  List colors = [
    Colors.red,
    Colors.pink,
    Colors.blue,
    Colors.purple,
  ];

  // final List

  @override
  Widget build(BuildContext context) {
    // final List<Widget> imageSliders = imageList
    //     .map((item) => Container(
    //           child: ClipRRect(
    //             borderRadius: BorderRadius.all(Radius.circular(5)),
    //             child: Image.asset(item, fit: BoxFit.cover),
    //           ),
    //         ))
    //     .toList();
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    stops: [0, 1.2],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),

                  // color: Colors.green,
                  image: DecorationImage(
                    image: AssetImage(Get.arguments['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 10,
                child: Text(
                  Get.arguments['name'] ?? 'Name Description',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 10,
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, size: 18, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      Get.arguments['dateText'] ?? '00 - 00 ',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(width: 40),
                    Icon(Icons.access_time, size: 18, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      Get.arguments['timeText'] ?? '00 : 00',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    ReadMoreText(
                      Get.arguments['fulldescription'] ??
                          'Description not available',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      trimLength: 150,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Gallery',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: AnimationLimiter(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageList.length,
                          itemBuilder: (BuildContext context, int i) {
                            return AnimationConfiguration.staggeredList(
                              position: i,
                              duration: const Duration(milliseconds: 605),
                              child: SlideAnimation(
                                verticalOffset: 50,
                                child: FadeInAnimation(
                                  child: ShowImages(
                                    image: imageList[i],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget listContainer(BuildContext context, Color color) {
  //   return Container(
  //     margin: EdgeInsets.only(right: 10),
  //     height: MediaQuery.of(context).size.height,
  //     width: 150,
  //     color: color,
  //   );
  // }
}

class ShowImages extends StatelessWidget {
  const ShowImages({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(right: 10),
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(right: 15),
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: AssetImage(image),
            // colorFilter: ColorFilter.mode(
            //     Colors.black.withOpacity(0.8), BlendMode.saturation),
            fit: BoxFit.cover,
          )),
    );
  }
}

// CarouselSlider.builder(
//                     itemCount: imageList.length,
//                     itemBuilder:
//                         (BuildContext context, int index, int indexMain) {
//                       return ShowImages(
//                         image: imageList[index],
//                       );
//                     },
//                     options: CarouselOptions(
//                         height: MediaQuery.of(context).size.height,
//                         // enlargeCenterPage: true,
//                         autoPlay: true,
//                         autoPlayInterval: Duration(seconds: 4),
//                         aspectRatio: 16 / 9,
//                         autoPlayCurve: Curves.fastOutSlowIn,
//                         enableInfiniteScroll: true,
//                         autoPlayAnimationDuration: Duration(milliseconds: 1500),
//                         viewportFraction: 1,
//                         scrollDirection: Axis.horizontal),
//                   )
