// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:travel_kenya/routes/app_routes.dart';

class AppScaffold extends StatefulWidget {
  final Widget body;

  const AppScaffold({Key? key, required this.body}) : super(key: key);

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  late bool showDrawer;

  @override
  void initState() {
    showDrawer = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(showDrawer ? '' : 'Travel Kenya'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            setState(() {
              showDrawer = !showDrawer;
            });
          },
          icon:
              Icon(showDrawer ? Icons.close : Icons.sort, color: Colors.white),
        ),
        actions: [
          showDrawer
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Travel Kenya',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                )
              : Container()
        ],
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      // resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomInset: true,
      body:
          SafeArea(child: showDrawer ? drawerContainer(context) : widget.body),
    );
  }

  Widget drawerContainer(context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: AnimationLimiter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: AnimationConfiguration.toStaggeredList(
              duration: Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: MediaQuery.of(context).size.width / 2,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
              children: [
                TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.homePage);
                      setState(() {
                        showDrawer = false;
                      });
                    },
                    child: Text('Home',
                        style: TextStyle(color: Colors.white, fontSize: 20))),
                TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.explorePage);
                      setState(() {
                        showDrawer = false;
                      });
                    },
                    child: Text('Explore',
                        style: TextStyle(color: Colors.white, fontSize: 20))),
                TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.eventsPage);
                      setState(() {
                        showDrawer = false;
                      });
                    },
                    child: Text('Events',
                        style: TextStyle(color: Colors.white, fontSize: 20))),
                TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.contactPage);
                      setState(() {
                        showDrawer = false;
                      });
                    },
                    child: Text('Contacts',
                        style: TextStyle(color: Colors.white, fontSize: 20))),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white)),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        showDrawer = false;
                      });
                    },
                    icon: Icon(Icons.close, size: 28, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
