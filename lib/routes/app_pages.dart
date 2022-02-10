// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
// import 'package:travel_kenya/homepage/homepage_binding.dart';
// import 'package:travel_kenya/homepage/homepage.dart';
import 'package:travel_kenya/main/main_page.dart';
import 'package:travel_kenya/pages/contacts/contacts_page.dart';
import 'package:travel_kenya/pages/events/events_page.dart';
import 'package:travel_kenya/pages/explore/explore_page.dart';
import 'package:travel_kenya/pages/home/home_page.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.mainPage,
      page: () => MainPage(),
    ),
    GetPage(
      name: AppRoutes.homePage,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoutes.eventsPage,
      page: () => EventsPage(),
    ),
    GetPage(
      name: AppRoutes.explorePage,
      page: () => ExplorePage(),
    ),
   
    GetPage(
      name: AppRoutes.contactPage,
      page: () => ContactsPage(),
    ),
  ];
}
