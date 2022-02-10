// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:travel_kenya/controller/category_controller.dart';
import 'package:travel_kenya/pages/home/home_tab.dart';

class HorizontalList extends GetView<CategoryController> {
  final categoryController = Get.put(CategoryController());

  HorizontalList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CategoryController(),
      builder: (value) => SizedBox(
        height: 350,
        child: AnimationLimiter(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryController.categoriesCount,
            itemBuilder: (BuildContext context, int i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimationConfiguration.staggeredList(
                  position: i,
                  duration: const Duration(milliseconds: 605),
                  child: SlideAnimation(
                    verticalOffset: 50,
                    child: FadeInAnimation(
                      child: ShowPlaces(
                        image: categoryController.categories[i].image,
                        title: categoryController.categories[i].title,
                        index: i,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ShowPlaces extends StatelessWidget {
  const ShowPlaces({
    required this.image,
    required this.title,
    required this.index,
  });

  final String image;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => HomeTab(),
          transition: Transition.fadeIn,
          arguments: {'index': index},
        );
      },
      child: Container(
          height: 350,
          width: 210,
          decoration: BoxDecoration(
            // color: Colors.green,
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            )
          ])),
    );
  }
}
