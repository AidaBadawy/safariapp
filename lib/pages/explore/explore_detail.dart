// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:travel_kenya/widgets/like_button.dart';

class ExploreDetails extends StatefulWidget {
  const ExploreDetails({Key? key}) : super(key: key);

  @override
  _ExploreDetailsState createState() => _ExploreDetailsState();
}

class _ExploreDetailsState extends State<ExploreDetails> {
  List imageList = Get.arguments['imagelist'];
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider.builder(
                itemCount: imageList.length,
                itemBuilder: (BuildContext context, int index, int indexMain) {
                  return showImagesTwo(
                    imageList[index],
                  );
                },
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    // enlargeCenterPage: true,
                    autoPlay: true,
                    //autoPlayInterval: Duration(seconds: 4),
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 1500),
                    viewportFraction: 1,
                    scrollDirection: Axis.horizontal),
              ),
              tapped
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimationLimiter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: AnimationConfiguration.toStaggeredList(
                            duration: Duration(milliseconds: 375),
                            childAnimationBuilder: (widget) => SlideAnimation(
                              horizontalOffset:
                                  MediaQuery.of(context).size.width / 2,
                              child: FadeInAnimation(
                                child: widget,
                              ),
                            ),
                            children: [
                              Text(
                                Get.arguments['title'] ??
                                    'Description not available',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                              SizedBox(height: 10),
                              ReadMoreText(
                                Get.arguments['description'] ??
                                    'Description not available',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              Positioned(
                top: 38,
                right: 20,
                child: LikeButtonWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget showImagesTwo(String image) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tapped = !tapped;
        });
      },
      child: Container(
        // margin: EdgeInsets.all(5),
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              tapped ? Colors.transparent : Colors.black,
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.1, 1],
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}

// class ShowImages extends StatefulWidget {
//   const ShowImages({
//     Key? key,
//     required this.image,
//   }) : super(key: key);
//   final String image;

//   @override
//   State<ShowImages> createState() => _ShowImagesState();
// }

// class _ShowImagesState extends State<ShowImages> {
//   bool tappedTwo = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     tappedTwo = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           tappedTwo = !tappedTwo;
//           print(tappedTwo);
//         });
//       },
//       child: Container(
//         // margin: EdgeInsets.all(5),
//         foregroundDecoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Colors.black,
//               Colors.transparent,
//             ],
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//             stops: [0.1, 1],
//           ),
//         ),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             image: DecorationImage(
//               image: AssetImage(widget.image),
//               fit: BoxFit.cover,
//             )),
//       ),
//     );
//   }
// }
// Container(
        //   decoration: BoxDecoration(
        //       image: DecorationImage(
        //     image:
        //         NetworkImage(Get.arguments['image'] ?? 'assets/imagehome2.jpg'),
        //     fit: BoxFit.cover,
        //   )),
        // ),
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   height: MediaQuery.of(context).size.height,
        //   foregroundDecoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [
        //         Colors.black,
        //         Colors.transparent,
        //       ],
        //       begin: Alignment.bottomCenter,
        //       end: Alignment.center,
        //       stops: [0, 1.2],
        //     ),
        //   ),
        //   child: Image.asset(
        //     'assets/imagehome2.jpg',
        //     fit: BoxFit.cover,
        //   ),
        // ),
// Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   Get.arguments['title'] ?? 'Description not available',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 ReadMoreText(
//                   Get.arguments['description'] ?? 'Description not available',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//               ],
//             ),
//           ),
        