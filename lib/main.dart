// ignore_for_file: use_key_in_widget_constructors

import 'package:travel_kenya/main/main_page.dart';
import 'package:travel_kenya/routes/app_pages.dart';
import 'package:travel_kenya/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}
// Nxzcw234}1

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Widget example = SplashScreenView(
      navigateRoute: MainPage(),
      duration: 3000,
      imageSize: 150,
      imageSrc: "assets/kenya.png",
      backgroundColor: Colors.white,
    );

    return GetMaterialApp(
      home: example,
      getPages: AppPages.list,
      title: 'Travel Kenya',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
