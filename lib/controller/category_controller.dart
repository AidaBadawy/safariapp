// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';
import 'package:travel_kenya/models/category.dart';

class CategoryController extends GetxController {
  List<Category> _category = [
    Category(
      title: 'CULTURE',
      image: 'assets/imagehome1.jpg',
    ),
    Category(
      title: 'WILDLIFE',
      image: 'assets/imagehome2.jpg',
    ),
    Category(
      title: 'SCENERY',
      image: 'assets/imagehome3.jpg',
    ),
    Category(
      title: 'ADVENTURES',
      image: 'assets/imagehome4.jpg',
    ),
    Category(
      title: 'BEACHES',
      image: 'assets/imagehome5.jpg',
    ),
  ];

  List<Category> get categories {
    return [..._category];
  }

  int get categoriesCount {
    return _category.length;
  }
}
