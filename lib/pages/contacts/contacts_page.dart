// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_kenya/widgets/app_scaffold.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contacts_controller.dart';

class ContactsPage extends GetView<ContactsController> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: Text('Contact Us',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              child: Text(
                  'Wish to have a personal tour to all the wonderful places?',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            SizedBox(height: 30),
            Container(
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/imagehome3.jpg'),
                fit: BoxFit.cover,
              )),
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 15),
                Text('Aidarus Badawy', style: TextStyle(color: Colors.white)),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.alternate_email,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text('aidarusbadawy@gmail.com',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text('+254 701 887 881',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          const url = 'tel:+254701887881';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.brown),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Let\'s talk',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        )),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                    )
                                  ]),
                            )),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () async {
                          const url = 'mailto:aidarusbadawy@gmail.com';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Container(
                            alignment: Alignment.center,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.brown),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Email us',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        )),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.email,
                                      color: Colors.white,
                                    )
                                  ]),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
