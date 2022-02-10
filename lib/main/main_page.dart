// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_kenya/routes/app_routes.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            // color: Colors.green,
            image: DecorationImage(
                image: AssetImage('assets/lion.jpg'), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Come Explore the Wild Safari',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50),
              child: Text('Get a whole new experience of Safari Travel',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.homePage);
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  color: Colors.brown,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Discover',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
